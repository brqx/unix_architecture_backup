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
syncout()
{
SERVER=${1}   
USER=${2}
FUNC=syncout
VER="0.0.6"

#-Antes de hacer el sync hay que chequear que:
#--- El servidor no es el mismo
#--- El servidor permite conexion al puerto

if [ "${1}" == "" -o "${1}" == "-?" ] ; then
#--[01] - START [IF SERVER PARAMETER ] ------------------------------------------------------------------
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "SyncSure - Sincronismo seguro sin errores arquitectura Brqx [$VER]"
echo "=========================================================="
echo "Format  : syncsure SERVER [USER]							"
echo "----------------------------------------------------------"
echo "Example : syncsure tbrqx.com                              "
echo "==--==--==--==--==--==--==--==--==--==--==--==--==--==--=="

else

#-Only exist in Centos 6x
IP_SERVER=$( 		hostname -I  | cut -d " " -f1  	)
if [ "${?}" != 0 ] ; then
IP_SERVER=$( 		hostname -i						)
fi

SERVER_NAME=$(  	uname -n 				| cut -d "." -f2-  		)
SERVER_CLEAN=$(  	echo "${SERVER_NAME}"	| tr "." "_" 			)

if [ "${SERVER}" != "${SERVER_NAME}" -a "${SERVER}" != "${IP_SERVER}" ] ; then
#--[02] - START [IF SERVER IS NOT THE SAME ] ------------------------------------------------------------

PERL_CK=/root/scripts/arq/libs/perl/checkport.pl

#-Si da un 0 esta abierto - 1 esta cerrado - si es aix es distinta
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
syncsure_OUT=$( 	ssh -oPasswordAuthentication=no  ${USER}@${SERVER} "${CMD}"  )
ssh_OUT=$?

if [ "${ssh_OUT}" == "2" ] ; then
	#-No existe la carpeta - la creamos
	syncsure_MSG="Se crea la carpeta ${dst}"
	CMD="mkdir -p ${dst}"
	syncsure_OUT=$( ssh -oPasswordAuthentication=no  ${USER}@${SERVER} "${CMD}"  )
	ssh_OUT=$?
fi

#-Volvemos a comprobar

CMD="ls ${dst}"
syncsure_OUT=$( 	ssh -oPasswordAuthentication=no  ${USER}@${SERVER} "${CMD}"  )
ssh_OUT=$?

if [ "${ssh_OUT}" == "0" ] ; then
#--[04] - START [IF ssh_OUT correct] --------------------------------------------------------------------

rsync -avz -e "ssh -oPort=22" ${src} ${USER}@${SERVER}:${src} 					
rsync_OUT=$?

if [ "${rsync_OUT}" == "0" ] ; then
	syncsure_OUT="OK"
	syncsure_MSG="Sincronizacion correcta (${SERVER}:${src})."
else
	syncsure_OUT="KO"
	syncsure_MSG="Error de sincronizacion (${SERVER}:${dst}) y tampoco se puede crear."
fi
else
#-No folder - No existe o no se puede crear la carpeta
syncsure_OUT="NF"
syncsure_MSG="No existe la carpeta (${dst}) y tampoco se puede crear"

#--[04] - END [IF ssh_OUT correct] --------------------------------------------------------------------
fi
else
# Si no ha podido acceder,la funcion perl devuelve 1
#-Hay error de conectividad con els servidor - o no existe la carpeta
syncsure_OUT="NK"
syncsure_MSG="El puerto no esta abierto en el servidor indicado"
#--[03] - END [IF PERL OPEN PORT] ---------------------------------------------------------------------
fi
else
syncsure_OUT="NN"
syncsure_MSG="Es el mismo servidor (${SERVER}). No se hace sincronismo."

#--[02] - END [IF SERVER IS NOT THE SAME ] ------------------------------------------------------------
fi


#--[01] - START [IF SERVER PARAMETER ] ----------------------------------------------------------------
fi
}

