#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.3"          #  Version del Script actual
FECHA_SCRIPT="Septiembre 2012"
STATUS_SCRIPT="testing"
#-------------------------------------------------------------------
LEVEL_NIVEL=05		# Variable control profundidad alcanzada
LEVEL_NIVEL_05=05	# Variable control script
CONCEPT_FORMATO_05="script"
CONCEPT_MOLDE_05="funciones"
CONCEPT_PRODUCTO_05="server"
CONCEPT_ARQUETIPO_05="sync"
#-------------------------------------------------------------------
CONCEPT_LEVEL_05="${CONCEPT_FORMATO_05} ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05}"
CONCEPT_LEVEL_05="${CONCEPT_LEVEL_05} ${CONCEPT_PRODUCTO_05} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- sync_local_path_to_server_path
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Sincroniza carpeta de un servidor a otro
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T sincronismo carpetas distintas servidores
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [usuario] [servidor] [puerto] fichero
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E sync_local_path_to_server_path ruta_local root ibrqx.com 22 ruta_remota -- Sincroniza contra ibrqx
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-==================================================================
#- La idea es auto sincronizar rutas entre servidores
#-==================================================================

#Sincroniza el fichero con un servidor remoto - tiene sentido ... pregunta
#- Mini alias sylpsp
sync_local_path_to_server_path()
{
IS_sync_local_path_to_server_path="Sincroniza un fichero con servidor destino."
INFO_SCRIPT=${IS_sync_local_path_to_server_path}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_sync_local_path_to_server_path=${INFO_SCRIPT}

#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2012
#-------------------------------------------------------------------

USUARIO_CONEXION=${1}
SERVER=${2}
PORT=${3}
#- Si no se indica sincronizara desde la ruta actual LOCAL
RUTA_DESTINO=${4}
RUTA_ORIGEN=${5}

SALIDA_sync_local_path_to_server_path=0

NOMBRE_SCRIPT_sync_local_path_to_server_path=sync_local_path_to_server_path
PARAMETROS_SCRIPT_sync_local_path_to_server_path="USUARIO SERVIODR PUERTO"

RUTA_ACTUAL=${PWD}

if [ "${USUARIO_CONEXION}" == "" ]; then
USUARIO_CONEXION="-?"
fi  

if [ "${RUTA_DESTINO}" == "" ]; then
RUTA_DESTINO=${RUTA_ACTUAL}
fi  

if [ "${RUTA_ORIGEN}" == "" ]; then
RUTA_ORIGEN=${RUTA_ACTUAL}
fi  

if [ "${USUARIO_CONEXION}" == "" ]; then
## Activamos un usuario por defecto
USUARIO_CONEXION=ibm
fi  

if [ "${SERVER}" == "" ] ; then
#- Servidor por defecto
SERVER=core
##SERVER=ibrqx
fi

if [ "${PORT}" == "" ] ; then
#- Servidor por defecto
PORT=22
##PORT=65533
fi


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${USUARIO_CONEXION}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_sync_local_path_to_server_path} ${PARAMETROS_SCRIPT_sync_local_path_to_server_path}


else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------
#- En esta funcion queremos /a/b/c/  ---> /c/d/h
#
#- Para poder conseguirlo debemos obligar a que la ruta origen sea con barra

cleanpath "${RUTA_ORIGEN}/"
CODIGO_SALIDA_fullpath=$?
SALIDA_sync_local_path_to_server_path=${CODIGO_SALIDA_fullpath}
echo "Llamamos a fullpath : ${RUTA_ORIGEN}  -- ${RUTA_ORIGEN_BARRA}"



#-Vamos a chequear que existe la ruta origen

if [ "${CODIGO_SALIDA_fullpath}" == "0" ] ; then
#- Existe la ruta origen
#--------========--------========--------========--------========---
#-- [2] Inicio test ruta origen
#--------========--------========--------========--------========---
RUTA_ORIGEN_BARRA=${SALIDA_cleanpath}

echo "Va a llamar con ssh -oPort=${PORT} ${RUTA_ORIGEN_BARRA} ${USUARIO_CONEXION}@${SERVER}:${RUTA_DESTINO}"

rsync -avz -e "ssh -oPort=${PORT}" ${RUTA_ORIGEN_BARRA} ${USUARIO_CONEXION}@${SERVER}:${RUTA_DESTINO} &> /dev/null
SALIDA_rsync=$?
##echo "Salida rsync : ${SALIDA_rsync}  - ${RUTA_ORIGEN_BARRA}"
SALIDA_sync_local_path_to_server_path=${SALIDA_rsync}

#- Salida 23 no existe la ruta remota pero crea la carpeta
#- Salida 12 no existe ruta remota base y no hace nada

#-Parametros comunes
PARAMETROS_MOTIVO_01="Conexion    : ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Ruta Origen : ${RUTA_ORIGEN}"
PARAMETROS_MOTIVO_03="Ruta Destino: ${RUTA_DESTINO}"

if [ "${SALIDA_rsync}" == "0" ] ; then
#---------========--------========--------========--------========---
#-- [3] Inicio bloque sincronismo
#---------========--------========--------========--------========---

MOTIVO_FUNCION="Ruta sincronizada correctamente"
elif [ "${SALIDA_rsync}" == "12" ] ; then
MOTIVO_FUNCION="Error al sincronizar ruta. No existe ruta remota base."
else
MOTIVO_FUNCION="Error al sincronizar ruta."
#---------========--------========--------========--------========---
#-- [3] Fin bloque sincronismo
#---------========--------========--------========--------========---
fi
else
#- No existe la ruta origen
MOTIVO_FUNCION="No existe la ruta origen"

#--------========--------========--------========--------========---
#-- [2] Fin test ruta origen
#--------========--------========--------========--------========---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_sync_local_path_to_server_path}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_sync_local_path_to_server_path}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_sync_local_path_to_server_path}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_sync_local_path_to_server_path}
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
