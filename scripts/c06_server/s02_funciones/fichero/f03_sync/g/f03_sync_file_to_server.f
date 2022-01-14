#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.2"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2011"
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
#-- sync_file_to_server
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Sincroniza ficheros con otro servidor 
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T sincronismo ficheros servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [usuario] [servidor] [puerto] fichero
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E sync_file_to_server root ibrqx.com 22 mifichero -- Sincroniza contra ibrqx
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-==================================================================
#- La idea es auto sincronizar fichero entre servidores
#- Para simplificar los parametros, el archivo esta en una ruta especifica
#-==================================================================

#Sincroniza el fichero con un servidor remoto - tiene sentido ... pregunta
#- Mini alias syf
sync_file_to_server()
{
IS_sync_file_to_server="Sincroniza un fichero con servidor destino."
INFO_SCRIPT=${IS_sync_file_to_server}

#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------

USUARIO_CONEXION=${1}
FICHERO=${2}
SERVER=${3}
PORT=${4}

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

if [ "${FICHERO}" == "" ] ; then
USUARIO_CONEXION="-?"
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${USUARIO_CONEXION}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt sync_file_to_server "[usuario] [servidor] [puerto] fichero"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Siempre se recupera y se carga desde la misma ruta
#  Por tanto tenemos que recuperar local_outgoing y remote_outgoing 

local_outgoing=${PWD}/
remote_outgoing=${PWD}/

rsync -avz -e "ssh -oPort=${PORT}" ${local_outgoing}${FICHERO} root@${SERVER}:${remote_outgoing}

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
