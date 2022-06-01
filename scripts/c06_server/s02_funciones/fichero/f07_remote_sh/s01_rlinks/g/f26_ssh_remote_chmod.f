#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.2"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="alias"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Script ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- ssh_chmod
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Cambia permisos en una ruta en servidor remoto
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T cambia permisos ruta ssh servidor remoto
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [usuario] [servidor] [puerto] RUTA_DESTINO PERMISOS
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E ssh_chmod ibm core 22 ruta 777 -- Cambia los permisos en la ruta remota
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

ssh_chmod()
{
IS_ssh_chmod="Mueve una ruta en servidor remoto"
INFO_SCRIPT=${IS_ssh_chmod}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_ssh_chmod=${INFO_SCRIPT}

USUARIO_CONEXION=${1}
SERVER=${2}
PORT=${3}
RUTA_DESTINO=${4}
PERMISOS=${5}

SALIDA_ssh_chmod=0

NOMBRE_SCRIPT_ssh_chmod=ssh_chmod
PARAMETROS_SCRIPT_ssh_chmod="usuario servidor puerto dest [permisos]"

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

if [ "${PERMISOS}" == "" ]; then
## Activamos permisos por defecto
	PERMISOS=755
fi  


if [ "${USUARIO_CONEXION}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_ssh_chmod} ${PARAMETROS_SCRIPT_ssh_chmod}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

##echo "Generando permisos ${PERMISOS} en ${RUTA_DESTINO} "

ssh -oPort=${PORT} ${USUARIO_CONEXION}@${SERVER} "echo \" chmod -R ${PERMISOS} ${RUTA_DESTINO} \"   && chmod -R ${PERMISOS} ${RUTA_DESTINO} " &> /dev/null
ERROR_ssh=$?

SALIDA_ssh_chown=${ERROR_ssh}

if [ "${ERROR_ssh}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio Generacion de nueva ruta
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Permisos cambiados correctamente"
else
MOTIVO_FUNCION="Error al cambiar los permisos"

#--------========--------========--------========--------========---
#----- [1] Fin Generacion de nueva ruta
#--------========--------========--------========--------========---
fi

#-Parametros comunes
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Ruta       : ${RUTA_DESTINO}"
PARAMETROS_MOTIVO_03="Permisos   : ${PERMISOS}"


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_ssh_chmod}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_ssh_chmod}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_ssh_chmod}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_ssh_chmod}
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
