#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Mayo 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="fichero"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- dame_servi_datos_pendientes
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera una cadena de fotos para luego parsearla en razon a una ruta establecida
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T listado total ficheros fotos
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P CODIGO	[ FICH_CONFIG ]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E dame_servi_datos_pendientes  -- Prepara las variables pendientes
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

dame_servi_datos_pendientes()
{
IS_dame_servi_datos_pendientes="Genera las categorias pendientes en razon al codigo"
INFO_SCRIPT=${IS_dame_servi_datos_pendientes}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_dame_servi_datos_pendientes=${INFO_SCRIPT}

CODIGO_PASADO=$1
SEP=$2
FICHERO=$3

SALIDA_dame_servi_datos_pendientes=0

NOMBRE_SCRIPT_dame_servi_datos_pendientes=dame_servi_datos_pendientes
PARAMETROS_SCRIPT_dame_servi_datos_pendientes="codigo [separador] [fichero_codigos]"

if [ "${CODIGO_PASADO}" == "" ]; then
CODIGO_PASADO="-?"
fi

if [ "${SEP}" == "" ]; then
SEP=";"
fi

if [ "${FICHERO}" == "" ]; then
FICHERO=${RECCARDS}servilletas/servilletas.dat
fi

if [ "${CODIGO_PASADO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_dame_servi_datos_pendientes} ${PARAMETROS_SCRIPT_dame_servi_datos_pendientes} 

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

LINEA_FICHERO=$(cat ${FICHERO} | grep "^${CODIGO_PASADO}" )
ERROR_grep=$?

if [ "${ERROR_grep}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio Existe el codigo para la foto
#----====----====----====----====----====----====----====----====---

PENDIENTE_CLAVE=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f1 )
PENDIENTE_SUBCLAVE=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f2 )
PENDIENTE_TITULO=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f3 )
PENDIENTE_C1=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f4 )
PENDIENTE_C2=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f5 )
PENDIENTE_C3=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f6 )
PENDIENTE_C4=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f7 )
PENDIENTE_C5=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f8 )
PENDIENTE_COLOR=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f9 )
PENDIENTE_PAIS=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f10 )
PENDIENTE_PROVINCIA=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f11 )
PENDIENTE_POBLACION=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f12 )
PENDIENTE_MODELO=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f13 )

MOTIVO_FUNCION="Codigo Correcto"
PARAMETROS_MOTIVO_01="Codigo : ${CODIGO_PASADO}"
PARAMETROS_MOTIVO_02="Titulo : ${PENDIENTE_TITULO}"

else

SALIDA_dame_servi_datos_pendientes=1

MOTIVO_FUNCION="Codigo incorrecto"
PARAMETROS_MOTIVO_01="Codigo : ${CODIGO_PASADO}"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin Existe el codigo para la foto
#----====----====----====----====----====----====----====----====---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_dame_servi_datos_pendientes}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_dame_servi_datos_pendientes}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_dame_servi_datos_pendientes}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_dame_servi_datos_pendientes}
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

#-------------------------------------------------------------------
#+ Sistema de trazado N4 - desactivado
#-------------------------------------------------------------------
#N4# echo "$LEVEL_NIVEL	-	Ejecutadas $CONCEPT_LEVEL"
#-------------------------------------------------------------------
