#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.3"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="funcion"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05}"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- get_nombre_fichero_export
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Obtiene el nombre para el fichero de backup del site
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T obtencion nombre fichero backup servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [servidor] 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E get_nombre_fichero_export abrqx  -- Devuelve el nombre para el fichero de backup
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-mini alias gnfe
get_nombre_fichero_export()
{
IS_get_nombre_fichero_export="Obtiene el nombre del fichero a exportar"
INFO_SCRIPT=${IS_get_nombre_fichero_export}
#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2012
#-------------------------------------------------------------------

#-Vamos a permitir cuentas y proyectos vacios en la generacion del nombre

CUENTA=${1}
PROYECTO=${2}

if [ "${PROYECTO}" == "" ]; then
PROYECTO=main
fi  


if [ "${CUENTA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt get_nombre_fichero_export "[cuenta] [proyecto]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-------------------------------------------------------------------
#- Gestion de la fecha
#-------------------------------------------------------------------

YEAR=$( date +"%Y" )
MES=b$( date +"%m" )_$( date +"%h" )

YEARP=${YEAR}/
MESP=${MES}/

TAR_FILE=brqx_${YEAR}_${MES}.tar.gz

#-------------------------------------------------------------------
#- Fin Gestion de la fecha
#-------------------------------------------------------------------

if [ "${CUENTA}" != "" ] ; then
#-Si cuenta esta vacio entonces no devuelve cuenta
PREFIJO_NOMBRE_FICHERO=${CUENTA}
else
PREFIJO_NOMBRE_FICHERO=xync
fi

if [ "${PROYECTO}" != "" ] ; then
PREFIJO_NOMBRE_FICHERO=${PREFIJO_NOMBRE_FICHERO}_${PROYECTO}
fi

NOMBRE_FICHERO_SITE=${PREFIJO_NOMBRE_FICHERO}_${TAR_FILE}

SALIDA_get_nombre_fichero_export=${NOMBRE_FICHERO_SITE}

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
