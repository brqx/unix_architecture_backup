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
#-- get_server_params
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Obtiene los parametros del servidor indicado para hacer el backup del site
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T obtencion parametros servidor get backup ficheros ssh scp servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [servidor] 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E get_server_params abrqx  -- Devuelve los datos para el servidor abrqx
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-alias get_server_info
#-mini alias gps - get parametros servidor
get_server_params()
{
IS_get_server_params="Obtiene los parametros del servidor indicado"
INFO_SCRIPT=${IS_get_server_params}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_get_server_params=${INFO_SCRIPT}

SERVIDOR=${1}

SALIDA_get_server_params=0

NOMBRE_SCRIPT_get_server_params=get_server_params
PARAMETROS_SCRIPT_get_server_params="[servidor]"

if [ "${SERVIDOR}" == "" ]; then
SERVIDOR=abrqx
fi  

if [ "${SERVIDOR}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_get_server_params} ${PARAMETROS_SCRIPT_get_server_params} 

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-Tenemos lo siguiente : zinfo_servers_backup.dat
# Servidor:Usuario:Puerto:Ruta_Backup (se accedera tanto a BD como a FS )
# soa7a:ricabel:22:/opt/zdown/bb

#-Informacion servidores
FICH_SERV=${RS_SITE}zinfo_servers_backup.dat

#-Linea del servidor

LINEA_SERVIDOR=$( cat ${FICH_SERV} | grep "^${SERVIDOR}" )
ERROR_grep=$?
SALIDA_get_server_params=${ERROR_grep}

if [ "${ERROR_grep}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio Se ha encontrado el proyecto
#----====----====----====----====----====----====----====----====---

#-Acceso a los parametros

USUARIO_CONEXION=$(echo ${LINEA_SERVIDOR} | cut -d ":" -f2 ) 
PORT=$(echo ${LINEA_SERVIDOR} | cut -d ":" -f3 ) 
RUTA_SERVIDOR=$(echo ${LINEA_SERVIDOR} | cut -d ":" -f4 )/
SERVER=${SERVIDOR}

cleanpath ${RUTA_SERVIDOR}
RUTA_SERVIDOR=${SALIDA_cleanpath}

MOTIVO_FUNCION="Acceso correcto Servidor"
PARAMETROS_MOTIVO_01="Parametros : ${SERVIDOR}"
PARAMETROS_MOTIVO_02="Datos      : ${LINEA_SERVIDOR}"

else

MOTIVO_FUNCION="Error al obtener los datos del servidor"
PARAMETROS_MOTIVO_01="Parametros : ${SERVIDOR}"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin Se ha encontrado el proyecto
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_get_server_params}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_get_server_params}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_get_server_params}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_get_server_params}
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
