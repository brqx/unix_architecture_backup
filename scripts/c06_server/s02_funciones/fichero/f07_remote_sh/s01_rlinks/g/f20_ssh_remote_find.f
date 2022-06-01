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
#-- ssh_find
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
#P [usuario] [servidor] [puerto] RUTA_DESTINO
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E ssh_find ibm core 22 ruta  -- Cambia los permisos en la ruta remota
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

ssh_find()
{
IS_ssh_find="Busca archivos en un servidor remoto"
INFO_SCRIPT=${IS_ssh_find}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_ssh_find=${INFO_SCRIPT}

USUARIO_CONEXION=${1}
SERVER=${2}
PORT=${3}
RUTA_DESTINO=${4}
FILTRO=${5}

SALIDA_ssh_find=0

NOMBRE_SCRIPT_ssh_find=ssh_find
PARAMETROS_SCRIPT_ssh_find="usuario servidor puerto dest"

if [ "${USUARIO_CONEXION}" == "" ]; then
	USUARIO_CONEXION=ibm
fi  

if [ "${SERVER}" == "" ]; then
	SERVER=frontal
fi  

if [ "${PORT}" == "" ]; then
	PORT=22
fi  

if [ "${FILTRO}" == "" ]; then
	FILTRO='*.log'
fi  


if [ "${RUTA_DESTINO}" == "" ]; then
	USUARIO_CONEXION="-?"
fi  


if [ "${USUARIO_CONEXION}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_ssh_find} ${PARAMETROS_SCRIPT_ssh_find}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

## find . -name \[m]onse_*.log

ssh -oPort=${PORT} ${USUARIO_CONEXION}@${SERVER} "echo \" find ${RUTA_DESTINO} -name *.log \"   && find ${RUTA_DESTINO} -name *.log " 
ERROR_ssh=$?

SALIDA_ssh_find=${ERROR_ssh}

if [ "${ERROR_ssh}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio Generacion de nueva ruta
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Acceso al servidor correcto"
else
MOTIVO_FUNCION="Error al acceder al servidor"

#--------========--------========--------========--------========---
#----- [1] Fin Generacion de nueva ruta
#--------========--------========--------========--------========---
fi

#-Parametros comunes
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Ruta       : ${RUTA_DESTINO}"


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_ssh_find}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_ssh_find}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_ssh_find}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_ssh_find}
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
