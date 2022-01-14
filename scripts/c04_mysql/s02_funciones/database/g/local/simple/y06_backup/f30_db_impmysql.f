#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.1"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2011"
STATUS_SCRIPT="pending"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_CARACTER_04="especifico"
CONCEPT_MOLDE_04="funciones"
CONCEPT_PRODUCTO_04="mysql"
CONCEPT_ARQUETIPO_04="database"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_CARACTER_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- db_impmysql
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- db_exist - db_create - check_db_name
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Importa una base de datos. La BBDD debe estar creada
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T importacion bbdd mysql
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P BBDD [MODO_IMPORT]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E db_restore za_d50prok  --> Importa bbdd za_d50prok
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## - Se encarga de recuperar la base de datos corresopndiente que se ha pasado
##   utiliza un fichero sql que se llama exactamente igual que el nombre de la bd

#-Vamos a preparar una funcion que permita importar un nombre distinto
##- Alias db_import - dbimp
db_impmysql()
{
IS_db_impmysql="Importa la base de datos indicada. La BBDD debe estar creada o forzarse su generacion."
INFO_SCRIPT=${IS_db_impmysql}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_db_impmysql=${INFO_SCRIPT}

#-- Si se pasa solo un parametro y que se saque de ahi la BBDD

BASE_DATOS_LOCAL=$1
MODO_IMPORT=$2

SALIDA_db_impmysql=0

NOMBRE_SCRIPT_db_impmysql=db_impmysql
PARAMETROS_SCRIPT_db_impmysql="BBDD [MODO_IMPORT]"

if [ "${BASE_DATOS_LOCAL}" == "" ] ; then
BASE_DATOS_LOCAL="-?"
fi

if [ "${MODO_IMPORT}" != "" ] ; then
MODO_IMPORT="1"
fi


if [ "${BASE_DATOS_LOCAL}" == "-?" ] ;  then

e_pmt ${NOMBRE_SCRIPT_db_impmysql} ${PARAMETROS_SCRIPT_db_impmysql}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar si el archivo cumple normativa
#-- [2] Comprobar si el archivo existe
#-- [3] Comprobar si existe bbdd
#-- [4] Comprobar modo importacion
#-- [5] Actuar dependiendo del modo
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
check_db_name ${BASE_DATOS_LOCAL}
SALIDA_db_impmysql=${SALIDA_check_db_name}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
#-- Nos devuelve NOMBRE_BBDD - NOMBRE_BBDD_SQL - NOMBRE_BBDD_TAR_GZ - RUTA_COMPLETA

PARAMETROS_MOTIVO_01="Base de datos       :  ${NOMBRE_BBDD} "
PARAMETROS_MOTIVO_02="Ruta de importacion :  ${RUTA_COMPLETA} "

if [ "${SALIDA_check_db_name}" == "0"  ]  ; then
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#----- [1] Inicio check nombre BBDD
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
db_exist ${NOMBRE_BBDD}
SALIDA_db_impmysql=${SALIDA_db_exist}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_db_exist}" == "0"  ]  ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#----- [2] Inicio check BBDD en sistema
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

mysql -u root ${NOMBRE_BBDD} < ${RUTA_IMPORTACION_COMPLETA} &> /dev/null
SALIDA_mysql_import=$?
SALIDA_db_impmysql=${SALIDA_mysql_import}


if [ "${SALIDA_mysql_import}" == "0"  ]  ; then
#----====----====----====----====----====----====----====----====---
#----- [3] Inicio chequeo importacion BBDD
#----====----====----====----====----====----====----====----====---

MOTIVO_FUNCION="Bases de datos Mysql importada correctamente"

else

MOTIVO_FUNCION="Bases de datos Mysql no existe o hubo error al importar"

#----====----====----====----====----====----====----====----====---
#----- [3] Fin chequeo importacion BBDD
#----====----====----====----====----====----====----====----====---
fi
else

#-Aqui hay que actuar dependiendo del modo de importacion
if [ "${MODO_IMPORT}" == "1" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [3a] Inicio chequeo importacion BBDD
#----====----====----====----====----====----====----====----====---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
db_create ${NOMBRE_BBDD}
SALIDA_db_impmysql=${SALIDA_db_create}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_db_create}" == "0"  ]  ; then
#------======------======------======------======------======------=
#----- [4a] Inicio check db_create en sistema
#------======------======------======------======------======------=

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
db_impmysql ${RUTA_IMPORTACION_COMPLETA}
SALIDA_db_impmysql=${SALIDA_db_impmysql}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_db_impmysql}" == "0"  ]  ; then
#------======------======------======------======------======------=
#----- [5a] Inicio check db_impmysql en sistema
#------======------======------======------======------======------=

MOTIVO_FUNCION="Bases de datos Mysql no existe pero se ha recreado y se ha importado"

else

MOTIVO_FUNCION="Bases de datos Mysql y ha habido error al importar"

#------======------======------======------======------======------=
#----- [5a] Inicio check db_impmysql en sistema
#------======------======------======------======------======------=
fi
else

MOTIVO_FUNCION="Bases de datos Mysql y ha habido error al crear"

#------======------======------======------======------======------=
#----- [4a] Inicio check db_create en sistema
#------======------======------======------======------======------=
fi

#----====----====----====----====----====----====----====----====---
#----- [3a] Fin chequeo importacion BBDD
#----====----====----====----====----====----====----====----====---
fi
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#----- [2] Fin check BBDD en sistema
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi
else

MOTIVO_FUNCION="El formato del archivo a importar no se corresponde con lo esperado"

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#----- [1] Fin check nombre BBDD
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_db_impmysql}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_db_impmysql}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_db_impmysql}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_db_impmysql}
#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi
}


#-------------------------------------------------------------------
#+ Sistema de trazado N5 - parametrizado
#-------------------------------------------------------------------
if [ "${N5}" != "" ] ; then
echo "${LEVEL_NIVEL_05}/${LEVEL_NIVEL}--${CONCEPT_LEVEL_05}"
fi
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================

