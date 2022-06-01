#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - WEIGHT ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="V 0.0.6"          #  Version del Script actual
FECHA_SCRIPT="Abril 2016"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
LEVEL_NIVEL=04
CONCEPT_PRODUCTO="server"
CONCEPT_MOLDE="alias"
CONCEPT_ARQUETIPO="fichero"
CONCEPT_LEVEL="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO}"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#-------------------------------------------------------------------
#-- syncsure 
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Sincroniza ruta actual
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T sync server sure secure
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P SERVER [USER]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E syncsure SERVER -- Sincroniza la ruta actual
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--= 
#C OK -- Sincronismo perfecto
#C KO -- Problema con el sincronismo
#C NN -- No se hace sincronismo
#C NK -- No Keys - Error de conexion
#C ZK -- Error en comando remoto
#C NF -- No Folder - No existe la carpeta y tampoco se ha podido crear
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
synclean()
{
SERVER=${1}   
USER=${2}
FUNC=synclean
VER="0.0.6"

#-Antes de hacer el sync hay que chequear que:
#--- El servidor no es el mismo
#--- El servidor permite conexion al puerto

if [ "${1}" == "" -o "${1}" == "-?" ] ; then
#--[01] - START [IF SERVER PARAMETER ] ------------------------------------------------------------------
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "SyncSure - Sincronismo seguro sin errores arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : synclean SERVER [USER]							"
echo "----------------------------------------------------------"
echo "Example : synclean tbrqx.com                              "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

src=$PWD/

if [ "${USER}" == "" ] ; then
USER=root
fi

rsync -avz -e "ssh -oPort=22" ${src} ${USER}@${SERVER}:${src} 					
rsync_OUT=$?

if [ "${rsync_OUT}" == "0" ] ; then
	syncsure_OUT="OK"
	syncsure_MSG="Sincronizacion correcta (${SERVER}:${src})."
else
	syncsure_OUT="KO"
	syncsure_MSG="Error de sincronizacion (${SERVER}:${dst})."
fi


#--[01] - START [IF SERVER PARAMETER ] ----------------------------------------------------------------
fi
}

