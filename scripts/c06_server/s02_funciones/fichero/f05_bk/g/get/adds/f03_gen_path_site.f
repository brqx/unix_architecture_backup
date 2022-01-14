#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.4"          #  Version del Script actual
FECHA_SCRIPT="Abril 2012"
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
#-- gen_path_site
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera un path para un site
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generacion ruta path cuenta site
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P cuenta [proyecto] [enfoque] [ruta_base]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E gen_path_site zi parques personales -- Genera un path para cuenta proyecto y entorno
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

gen_path_site()
{
IS_gen_path_site="Genera un path valido para los datos pasados"
INFO_SCRIPT=${IS_gen_path_site}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_gen_path_site=${INFO_SCRIPT}

#-Los sites son el despliegue de un proyecto en una cuenta de un servidor

CUENTA=${1}
PROYECTO=${2}
ENFOQUE=${3}
RUTA_BASE=${4}

SALIDA_gen_path_site=0

NOMBRE_SCRIPT_gen_path_site=gen_path_site
PARAMETROS_SCRIPT_gen_path_site="cuenta proyecto enfoque [ruta_base]"

if [ "${CUENTA}" == "" ]; then
CUENTA="-?"
fi  

if [ "${PROYECTO}" == "" ]; then
PROYECTO=main
fi  

if [ "${PROYECTO}" != "main" ]; then

if [ "${ENFOQUE}" == "" ]; then
CUENTA="-?"
fi  

fi  

if [ "${RUTA_BASE}" == "" ]; then
RUTA_BASE=/home/
fi  


if [ "${CUENTA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_gen_path_site} ${PARAMETROS_SCRIPT_gen_path_site} 

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------


if [ "${PROYECTO}" == "main" ] ; then
#- Es un site principal

RUTA_COMPUESTA_SITE=${RUTA_BASE}${CUENTA}/www/

else

RUTA_COMPUESTA_SITE=${RUTA_BASE}${CUENTA}/www/brqxng/proyectos/${ENFOQUE}/${PROYECTO}/

fi

RUTA_gen_path_site=${RUTA_COMPUESTA_SITE}

MOTIVO_FUNCION="Ruta solicitada"
PARAMETROS_MOTIVO_01="Ruta   : =${RUTA_COMPUESTA_SITE} "

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_get_path_site}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_get_path_site}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_get_path_site}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_gen_path_site}
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
