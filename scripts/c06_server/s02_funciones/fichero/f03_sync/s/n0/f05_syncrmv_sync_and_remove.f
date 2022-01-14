#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - WEIGHT ARQ - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.0"          #  Version del Script actual
FECHA_SCRIPT="Abril 2016"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_PRODUCTO="server"
CONCEPT_MOLDE="alias"
CONCEPT_ARQUETIPO="fichero"
CONCEPT_LEVEL="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO}"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#-------------------------------------------------------------------
#-- syncrmv 
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Sincroniza ruta actual borrando el contenido previamente
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T sync server sure secure remove contents
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P SERVER [USER]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E syncrmv SERVER -- Sincroniza la ruta actual borrando lo que tenia antes
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
syncrmv()
{
SERVER=${1}   
USER=${2}
FUNC=syncrmv
VER="0.0.6"

#-Antes de hacer el sync hay que chequear que:
#--- El servidor no es el mismo
#--- El servidor permite conexion al puerto

if [ "${1}" == "" -o "${1}" == "-?" ] ; then
#--[01] - START [IF SERVER PARAMETER ] ------------------------------------------------------------------
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "SyncSure - Sincronismo seguro borrando destino primero arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : syncrmv SERVER [USER]							"
echo "----------------------------------------------------------"
echo "Example : syncrmv tbrqx.com                              "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

IP_SERVER=$( 		hostname -I 			| cut -d " " -f1 	2> /dev/null	)
if [ "${?}" != 0 ] ; then
IP_SERVER=$( 		hostname -i						)
fi

SERVER_NAME=$(  	uname -n 				| cut -d "." -f2-  		)
SERVER_CLEAN=$(  	echo "${SERVER_NAME}"	| tr "." "_" 			)

if [ "${SERVER}" != "${SERVER_NAME}" -a "${SERVER}" != "${IP_SERVER}" ] ; then
#--[02] - START [IF SERVER IS NOT THE SAME ] ------------------------------------------------------------

PERL_CK=/root/scripts/arq/libs/perl/checkport.pl

#-Si da un 0 esta abierto - 1 esta cerrado
perl_OUT=$( ${PERL_CK} ${SERVER} | grep Closed | wc -l)

if  [ "${perl_OUT}" == "0"	 ] ; then
#--[03] - START [IF PERL OPEN PORT] ---------------------------------------------------------------------

#- Simple command in server
src=${PWD}/
dst=$( dirname ${PWD} )

if [ "${USER}" == "" ] ; then
USER=root
fi

CMD="ls ${dst}"
syncrmv_OUT=$( 	ssh -oPasswordAuthentication=no  ${USER}@${SERVER} "${CMD}" &> /dev/null )
ssh_OUT=$?

if [ "${ssh_OUT}" == "2" ] ; then
	#-No existe la carpeta - la creamos
	syncrmv_MSG="Se crea la carpeta ${SERVER}:${dst}"
	CMD="mkdir -p ${dst}"
else
	# Existe - La borramos
	syncrmv_MSG="Se elimina la carpeta ${SERVER}:${src}"
	CMD="rm -rf ${src}"
fi

syncrmv_OUT=$( ssh -oPasswordAuthentication=no  ${USER}@${SERVER} "${CMD}" &> /dev/null )
ssh_OUT=$?

if [ "${ssh_OUT}" == "0" ] ; then
#--[04] - START [IF ssh_OUT correct] --------------------------------------------------------------------

rsync -avz -e "ssh -oPort=22" ${src} ${USER}@${SERVER}:${src} 					&> /dev/null
rsync_OUT=$?

if [ "${rsync_OUT}" == "0" ] ; then
	syncrmv_OUT="OK"
	syncrmv_MSG="Sincronizacion correcta (${SERVER}:${src})."
else
	syncrmv_OUT="KO"
	syncrmv_MSG="Error de sincronizacion (${SERVER}:${dst}) y tampoco se puede crear."
fi
else
#-No folder - No existe o no se puede crear la carpeta
syncrmv_OUT="NF"
syncrmv_MSG="No existe la carpeta (${dst}) y tampoco se puede crear"

#--[04] - END [IF ssh_OUT correct] --------------------------------------------------------------------
fi
else
# Si no ha podido acceder,la funcion perl devuelve 1
#-Hay error de conectividad con els servidor - o no existe la carpeta
syncrmv_OUT="NK"
syncrmv_MSG="El puerto no esta abierto en el servidor indicado"
#--[03] - END [IF PERL OPEN PORT] ---------------------------------------------------------------------
fi
else
syncrmv_OUT="NN"
syncrmv_MSG="Es el mismo servidor (${SERVER}). No se hace sincronismo."

#--[02] - END [IF SERVER IS NOT THE SAME ] ------------------------------------------------------------
fi

#--[01] - START [IF SERVER PARAMETER ] ----------------------------------------------------------------
fi
}

