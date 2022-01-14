#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.3"          #  Version del Script actual
FECHA_SCRIPT="Abril 2012"
STATUS_SCRIPT="pending"
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
#-- db_exportz
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt -db_export
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Exporta una base de datos
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T exportacion bbdd mysql
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P BBDD_LOCAL [BBDD_REMOTA] [RUTA_EXPORT]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E db_exportz za_d50prok  --> Exporta bbdd za_d50prok en tar.gz
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#alias dbexp
##- Exporta la base de datos actual y prepara el fichero de importacion remoto
db_exportz()
{
IS_db_exportz="Exporta la base de datos indicada comprimiendola con tar.gz"
INFO_SCRIPT=${IS_db_exportz}

INFO_SCRIPT_db_exportz=${INFO_SCRIPT}

BASE_DATOS_LOCAL=$1
BASE_DATOS_REMOTA=$2
RUTA_EXPORT=$3

SALIDA_db_exportz=0

NOMBRE_SCRIPT_db_exportz=db_exportz
PARAMETROS_SCRIPT_db_export="BD_LOCAL BD_REMOTA RUTA_EXPORT"

if [ "${BASE_DATOS_LOCAL}" == "" ] ; then
BASE_DATOS_LOCAL="-?"
fi

if [ "${BASE_DATOS_LOCAL}" == "-?" ] ;  then

e_pmt ${NOMBRE_SCRIPT_db_exportz} ${PARAMETROS_SCRIPT_db_exportz}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Exportar base de datos ( si la ruta no existe, debe crearla )

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
db_export ${BASE_DATOS_LOCAL} ${BASE_DATOS_REMOTA} ${RUTA_EXPORT}
SALIDA_db_exportz=${db_export}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

RUTA_EXPORT_SQL=${RUTA_EXPORT}${BASE_DATOS_REMOTA}.sql
RUTA_EXPORT_GZ=${RUTA_EXPORT_SQL}.tar.gz

stat "${RUTA_EXPORT_SQL}" &> /dev/null
SALIDA_stat=$?
SALIDA_db_exportz=${SALIDA_stat}

PARAMETROS_MOTIVO_01="Base de datos              :  ${BASE_DATOS_REMOTA} "
PARAMETROS_MOTIVO_02="Ruta de exportacion sql    :  ${RUTA_EXPORT_SQL} "
PARAMETROS_MOTIVO_03="Ruta de exportacion tar.gz :  ${RUTA_EXPORT_GZ} "

if [ "${SALIDA_stat}" == "0" ] ; then
#-----====-----====-----====-----====-----====-----====-----====----
#----- [1] Inicio comprobacion ruta
#-----====-----====-----====-----====-----====-----====-----====----

#- Descomprimimos el tarball
tar zcpvf ${RUTA_EXPORT_GZ} ${RUTA_EXPORT_SQL} &> /dev/null
SALIDA_tar=$?
SALIDA_db_exportz=${SALIDA_tar}

if [ "${SALIDA_tar}" == "0"  ]  ; then
#-----------===========-----------===========-----------===========-
#----- [2] Inicio chequeo exportacion BBDD
#-----------===========-----------===========-----------===========-
rm -f ${RUTA_EXPORT_SQL}       &> /dev/null
rm -f ${RUTA_EXPORT_SQL}.md5   &> /dev/null
SALIDA_rm=$?
SALIDA_db_exportz=${SALIDA_rm}

if [ "${SALIDA_rm}" == "0"  ]  ; then
#-------------=============-------------=============-------------==
#----- [3] Inicio borrado correcto del sql tras el export
#-------------=============-------------=============-------------==

MOTIVO_FUNCION="Bases de datos Mysql exportada correctamente en tar.gz"

else

MOTIVO_FUNCION="Error al borrar el fichero extraido"

#-------------=============-------------=============-------------==
#----- [3] Fin borrado correcto del sql tras el export
#-------------=============-------------=============-------------==
fi
else

MOTIVO_FUNCION="Bases de datos Mysql no existe o hubo error al exportar"

#-----------===========-----------===========-----------===========-
#----- [2] Fin chequeo exportacion BBDD
#-----------===========-----------===========-----------===========-
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

INFO_SCRIPT=${INFO_SCRIPT_db_exportz}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_db_exportz}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_db_exportz}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_db_exportz}

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
