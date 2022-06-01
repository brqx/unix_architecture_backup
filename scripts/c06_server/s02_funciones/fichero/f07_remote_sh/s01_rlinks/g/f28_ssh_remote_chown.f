#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.2"          #  Version del Script actual
FECHA_SCRIPT="Abril 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="alias"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Script ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- ssh_chown
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Cambia usuario y grupo en una ruta en servidor remoto
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T cambia usuario grupo ruta ssh servidor remoto
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [usuario] [servidor] [puerto] RUTA_DESTINO PERMISOS
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E ssh_chown ibm core 22 ruta usu grupo -- Genera enlace simbolico en destino
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

ssh_chown()
{
IS_ssh_chown="Cambia de usuario y grupo en una ruta de un servidor remoto"
INFO_SCRIPT=${IS_ssh_chown}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_ssh_chown=${INFO_SCRIPT}

USUARIO_CONEXION=${1}
SERVER=${2}
PORT=${3}
RUTA_DESTINO=${4}
USUARIO=${5}
GRUPO=${6}

SALIDA_ssh_chown=0

NOMBRE_SCRIPT_ssh_chown=ssh_chown
PARAMETROS_SCRIPT_ssh_chown="[usuario] [servidor] [puerto] [ruta_dest] [usuario] [grupo]"


if [ "${USUARIO_CONEXION}" == "" ]; then
	USUARIO_CONEXION=ibm
fi  

if [ "${SERVER}" == "" ]; then
	SERVER=frontal
fi  

if [ "${PORT}" == "" ]; then
	PORT=22
fi  

if [ "${RUTA_DESTINO}" == "" ]; then
	USUARIO_CONEXION="-?"
fi  

if [ "${USUARIO}" == "" ]; then
	USUARIO_CONEXION="-?"
fi  

if [ "${GRUPO}" == "" ]; then
	GRUPO=${USUARIO}
fi  

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${USUARIO_CONEXION}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_ssh_chown} ${PARAMETROS_SCRIPT_ssh_chown}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

##echo "Cambiando usuario ${USUARIO}:${GRUPO} en ${RUTA_DESTINO} "

ssh -oPort=${PORT} ${USUARIO_CONEXION}@${SERVER} "echo \" chown -R ${USUARIO}:${GRUPO} ${RUTA_DESTINO} \"   && chown -R ${USUARIO}:${GRUPO} ${RUTA_DESTINO} " &> /dev/null
ERROR_ssh=$?

SALIDA_ssh_chown=${ERROR_ssh}

if [ "${ERROR_ssh}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio Cambio de permisos
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Cambio Correcto"
else
MOTIVO_FUNCION="Error al dar los permisos "

#--------========--------========--------========--------========---
#----- [1] Fin Cambio de permisos
#--------========--------========--------========--------========---
fi

#-Parametros comunes
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Propietario: ${USUARIO}:${GRUPO}"
PARAMETROS_MOTIVO_03="Ruta       : ${RUTA_DESTINO}"

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_ssh_chown}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_ssh_chown}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_ssh_chown}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_ssh_mvdir}
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
