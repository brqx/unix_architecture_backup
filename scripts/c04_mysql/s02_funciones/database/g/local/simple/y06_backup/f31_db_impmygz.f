#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.3"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_MOLDE_04="funciones"
CONCEPT_PRODUCTO_04="mysql"
CONCEPT_ARQUETIPO_04="database"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- db_impmygz
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- db_mysqlimp
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Importa una base de datos desde fichero tar.gz. La BBDD debe estar creada
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T importacion bbdd mysql fichero comprimido tarball import
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P BBDD [RUTA_IMPORT]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E db_impmygz za_d50prok				--> Importa bbdd za_d50prok desde fichero za_d50prok.tar.gz
#-------------------------------------------------------------------
#E db_impmygz za_do /a/b/c.sql.tar.gz   --> Importa en bbdd za_do el fichero c.sql.tar.gz
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

db_impmygz()
{
IS_db_impmygz="Importa la base de datos indicada. La BBDD debe estar creada"
INFO_SCRIPT=${IS_db_impmygz}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_db_impmygz=${INFO_SCRIPT}

BASE_DATOS_LOCAL=$1
RUTA_IMPORT=$2
MODO_IMPORT=$3

SALIDA_db_impmygz=0

NOMBRE_SCRIPT_db_impmygz=db_impmygz
PARAMETROS_SCRIPT_db_impmygz="BBDD [RUTA_IMPORT]"

RUTA_ACTUAL=${PWD}/

if [ "${BASE_DATOS_LOCAL}" == "" ] ; then
BASE_DATOS_LOCAL="-?"
fi

if [ "${RUTA_IMPORT}" == "" ] ; then
#-Si no se indica ruta - vamos a usar una ruta generica
RUTA_IMPORT=${RUTA_ACTUAL}
fi

if [ "${BASE_DATOS_LOCAL}" == "-?" ] ;  then

e_pmt ${NOMBRE_SCRIPT_db_impmysql} ${PARAMETROS_SCRIPT_db_impmysql}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-Aqui hay que comprobar que la ruta indicada no incluya el archivo tar.gz
#-- Falta revisar esta funcion con rutas absolutas

echo ${RUTA_IMPORT}  | grep "sql.tar.gz$"  &> /dev/null
SALIDA_existe_tar_gz=$?

if [ "${SALIDA_existe_tar_gz}" == "0" ] ; then
#-----====-----====-----====-----====-----====-----====-----====----
#----- [1] Inicio comprobacion ruta completa con fichero
#-----====-----====-----====-----====-----====-----====-----====----

#-Lo va a descomprimir en la ruta local
RUTA_IMPORT_GZ=${RUTA_IMPORT}
##RUTA_IMPORT_BASE=$(dirname ${RUTA_IMPORT} )/
NOMBRE_IMPORT_BASE=$(basename ${RUTA_IMPORT} | cut -d "." -f1-2 )
RUTA_IMPORT_SQL=${RUTA_ACTUAL}${NOMBRE_IMPORT_BASE}

#echo "Nombre base : ${NOMBRE_IMPORT_BASE}"

else

RUTA_IMPORT_SQL=${RUTA_ACTUAL}${BASE_DATOS_LOCAL}.sql
RUTA_IMPORT_GZ=${RUTA_IMPORT_SQL}.tar.gz
#-----====-----====-----====-----====-----====-----====-----====----
#----- [1] Fin comprobacion ruta completa con fichero
#-----====-----====-----====-----====-----====-----====-----====----
fi

stat "${RUTA_IMPORT_GZ}" &> /dev/null
SALIDA_stat=$?
SALIDA_db_impmygz=${SALIDA_stat}

PARAMETROS_MOTIVO_01="Base de datos              :  ${BASE_DATOS_LOCAL} "
PARAMETROS_MOTIVO_02="Ruta de importacion tar.gz :  ${RUTA_IMPORT_GZ} "
PARAMETROS_MOTIVO_03="Ruta de importacion sql    :  ${RUTA_IMPORT_SQL} "

if [ "${SALIDA_stat}" == "0" ] ; then
#-----====-----====-----====-----====-----====-----====-----====----
#----- [1] Inicio comprobacion ruta
#-----====-----====-----====-----====-----====-----====-----====----

#- Descomprimimos el tarball
tar zxvf ${RUTA_IMPORT_GZ} &> /dev/null
SALIDA_tar=$?
db_impmygz=${SALIDA_tar}

if [ "${SALIDA_tar}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [2] Inicio descompresion archivo
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
db_impmysql ${BASE_DATOS_LOCAL} ${RUTA_IMPORT_SQL}
SALIDA_db_impmysql=${SALIDA_db_impmysql}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_db_impmysql}" == "0"  ]  ; then
#-----------===========-----------===========-----------===========-
#----- [3] Inicio chequeo importacion BBDD
#-----------===========-----------===========-----------===========-
rm -f ${RUTA_IMPORT_SQL}   &> /dev/null
SALIDA_rm=$?
SALIDA_db_impmysql=${SALIDA_rm}

if [ "${SALIDA_rm}" == "0"  ]  ; then
#-------------=============-------------=============-------------==
#----- [4] Inicio borrado correcto del sql tras el import
#-------------=============-------------=============-------------==

MOTIVO_FUNCION="Bases de datos Mysql importada correctamente"

else

MOTIVO_FUNCION="Error al borrar el fichero extraido"

#-------------=============-------------=============-------------==
#----- [4] Fin borrado correcto del sql tras el import
#-------------=============-------------=============-------------==
fi
else

MOTIVO_FUNCION="Bases de datos Mysql no existe o hubo error al importar"

#-----------===========-----------===========-----------===========-
#----- [3] Fin chequeo importacion BBDD
#-----------===========-----------===========-----------===========-
fi
else

MOTIVO_FUNCION="Error al descomprimir archivo"

#--------========--------========--------========--------========---
#----- [2] Fin descompresion archivo
#--------========--------========--------========--------========---
fi
else

MOTIVO_FUNCION="Estructura tarball no existe"

#-----====-----====-----====-----====-----====-----====-----====----
#----- [1] Fin comprobacion ruta
#-----====-----====-----====-----====-----====-----====-----====----
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_db_impmygz}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_db_impmygz}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_db_impmygz}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_db_impmygz}
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

