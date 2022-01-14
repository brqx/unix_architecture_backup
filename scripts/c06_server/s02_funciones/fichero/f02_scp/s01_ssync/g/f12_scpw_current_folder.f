#!/bin/bash
#--------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.0.7" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- scpw
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas /Comandos
#--------------------------------------------------------------------------------
#-- scp
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Transfiere el fichero o carpeta indicada a la misma ruta en un servidor remoto
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T scp copy files pwd current path server
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P FILE SERVER  [USER] [PORT]
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E scpw abc server  -- Transfiere el fichero abc de la ruta actual al servidor 
#--------------------------------------------------------------------------------
#+ Funciones frecuentes de llamada : 
#--------------------------------------------------------------------------------
#F shell
#--------------------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="funcion"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Script ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
scpw()
{
VER="0.0.7"

scpw_FUN="scpw"
scpw_NFO="Transfiere el fichero o carpeta indicada a la misma ruta en un servidor remoto [$VER]"
scpw_FMT="scpw FILE|FOLDER SERVER "
scpw_EXA="scpw abc server"

scpw_OUT=0
scpw_MSG="#-Ping_KO"
scpw_ERR=""
scpw_RTT=""

if [ "${1}" == "-?" -o "${1}" == "" -o "${1}" == " " ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${scpw_NFO}" "${scpw_FMT}" "${scpw_EXA}"
#--------------------------------------------------------------------------------
else

##USUARIO_CONEXION=root

FILE="${1}"
SERVER=${2}
USUARIO_CONEXION=${3}
PORT=${4}

if [ "${USUARIO_CONEXION}" 	== "" 	]	; then
	USUARIO_CONEXION=root
fi  


if [ "${SERVER}" 			== "" 	]	; then
	SERVER=ubrqx.com
fi  

#- No activamos puerto. Activar en casa

if [ "${PORT}" 				== "" 	] 	; then
	PORT=60022
fi  

SCP_SW=$(which scp | wc -l )

if [ "${SCP_SW}" 			== "1" 	] 	; 	then
#--STA_IF_[01] - [ SCP INSTALLED ] ----------------------------------------------

scp -r -P ${PORT} "${FILE}"  ${USUARIO_CONEXION}@${SERVER}:${PWD}/	&> /dev/null
scp_OUT=$?

if [  "${scp_OUT}" 			== "0" 	] 	; then
#--STA_IF_[02] - [ SCP RUNNED ] -------------------------------------------------

scpw_MSG="#-Copia correcta [${scp_OUT}] ##"
scpw_OUT=0

else

scpw_COD=${scp_OUT}
scpw_EER="#-Error en scp con codigo ${scp_OUT} ##"
scpw_OUT=$(expr  ${scpw_OUT} + ${scpw_COD})
scpw_ERR="${scpw_ERR}${scpw_EER}"

#--END_IF_[02] - [ SCP RUNNED ] -----------------------------------------------
fi
else

scpw_COD=10
scpw_EER="#-Error No esta instalado scp en el sistema ${scp_OUT} ##"
scpw_OUT=$(expr  ${scpw_OUT} + ${scpw_COD})
scpw_ERR="${scpw_ERR}${scpw_EER}"

#--END_IF_[01] - [ SCP INSTALLED ] ----------------------------------------------
fi

if [  "${scpw_OUT}" != "0" ] ; then
scpw_ERR="+${scpw_FUN}::##${scpw_ERR}"
footer_error "${scpw_ERR}"
fi


fi
}

