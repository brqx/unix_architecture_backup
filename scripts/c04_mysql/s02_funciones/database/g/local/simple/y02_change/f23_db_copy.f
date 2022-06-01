#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.2"          #  Version del Script actual
FECHA_SCRIPT="Enero 2011"
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
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04}  ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- db_copy
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- db_exist - db_export - db_create - db_restore
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Copia una base de datos en otra
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T copia replicacion bbdd mysql
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P BBDD_ORIGEN BBDD_COPIADA [RUTA_EXPORTACION]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E db_copy za_d50prok zu_d50prok  --> Copia bbdd za_d50prok en zu_d50prok
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 


# alias dbcop
## - Copia la base de datos en otra base de datos
db_copy()
{
IS_db_copy="Copia la base de datos indicada"
INFO_SCRIPT=${IS_db_copy}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_db_copy=${INFO_SCRIPT}


BASE_DATOS_LOCAL=$1
BASE_DATOS_COPIADA=$2
RUTA_EXPORT=$3

SALIDA_db_copy=0

NOMBRE_SCRIPT_db_copy=db_copy
PARAMETROS_SCRIPT_db_copy="BBDD_ORIGEN BBDD_COPIADA [RUTA_EXPORTACION]"


if [ "${BASE_DATOS_LOCAL}" == "" ] ; then
BASE_DATOS_LOCAL="-?"
fi

if [ "${BASE_DATOS_COPIADA}" == "" ] ; then
BASE_DATOS_LOCAL="-?"
fi

if [ "${RUTA_EXPORT}" == "" ] ; then
#-Si no se indica ruta 
RUTA_EXPORT=${PWD}
fi


if [ "${BASE_DATOS_LOCAL}" == "-?" ] ;  then

e_pmt ${NOMBRE_SCRIPT_db_copy} ${PARAMETROS_SCRIPT_db_copy}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar bbdd
#-- [2] Exportar BBBDD
#-- [3] Crear BBBDD nueva
#-- [4] Importar BBBDD
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
db_exist ${BASE_DATOS_LOCAL}
SALIDA_db_copy=${SALIDA_db_exist}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_db_exist}" == "0"  ]  ; then
#------======------======------======------======------======------=
#----- [1] Inicio check BBDD en sistema
#------======------======------======------======------======------=

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
db_export ${BASE_DATOS_LOCAL} ${BASE_DATOS_COPIADA} ${RUTA_EXPORT} 
SALIDA_db_copy=${SALIDA_db_export}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_db_export}" == "0"  ]  ; then
#--------========--------========--------========--------========---
#----- [2] Inicio export BBDD en sistema
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
db_create ${BASE_DATOS_COPIADA}
SALIDA_db_copy=${SALIDA_db_create}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_db_create}" == "0"  ]  ; then
#----------==========----------==========----------==========-------
#----- [3] Inicio create BBDD en sistema
#----------==========----------==========----------==========-------

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
db_restore ${BASE_DATOS_COPIADA} ${RUTA_EXPORT} 
SALIDA_db_copy=${SALIDA_db_restore}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_db_restore}" == "0"  ]  ; then
#------------============------------============------------=======
#----- [4] Inicio restore BBDD en sistema
#------------============------------============------------=======
MOTIVO_FUNCION="BBDD copiada correctamente"

rm -f ${RUTA_EXPORT}/${BASE_DATOS_COPIADA}.sql
rm -f ${RUTA_EXPORT}/${BASE_DATOS_COPIADA}.sql.md5

else

MOTIVO_FUNCION="Error al restaurar la BDDD exportada"

#------------============------------============------------=======
#----- [4] Fin restore BBDD en sistema
#------------============------------============------------=======
fi
else

MOTIVO_FUNCION="Error al crear la BDDD exportada"

#--------========--------========--------========--------========---
#----- [3] Fin create BBDD en sistema
#--------========--------========--------========--------========---
fi
else

MOTIVO_FUNCION="Error al exportar la BDDD exportada"

#--------========--------========--------========--------========---
#----- [2] Fin export BBDD en sistema
#--------========--------========--------========--------========---
fi
else

MOTIVO_FUNCION="La BBDD no existe en el sistema"

#------======------======------======------======------======------=
#----- [1] Inicio check BBDD en sistema
#------======------======------======------======------======------=
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_db_copy}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_db_copy}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_db_copy}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_db_copy}
#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi
}

#-------------------------------------------------------------------
#+ Sistema de trazado N4 - desactivado
#-------------------------------------------------------------------
#N4# echo "$LEVEL_NIVEL	-	Ejecutadas $CONCEPT_LEVEL"
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================
