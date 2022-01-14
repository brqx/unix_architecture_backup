#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - MM
# MM - Rct - 2015
#-------------------------------------------------------------------
VERSION_SCRIPT="V 0.0.1"          #  Version del Script actual
FECHA_SCRIPT="Julio 2014"
STATUS_SCRIPT="pending"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- serverlogs
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- serverlogs
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Reporta informacion de un los logs del servidor
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T info informacion logs servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P LOG
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E serverlogs [FICHERO_CUENTAS]
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 


#-Genera una app entera invocando a los scripts de mma
serverlogs()
{
IS_serverlogs="Reporta informacion de los logs del servidor."
INFO_SCRIPT=${IS_serverlogs}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_serverlogs=${INFO_SCRIPT}

ACCOUNTS_FILE=${1}
RESULTS_FILE=${2}


SALIDA_serverlogs=0

NOMBRE_SCRIPT_serverlogs=serverlogs
PARAMETROS_SCRIPT_serverlogs="ACCOUNTS_FILE [RESULT_FILE]"
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_serverlogs}

if [ "${ACCOUNTS_FILE}" == "" ] ;  then
ACCOUNTS_FILE=/brqx/zzcuentas_servidor.dat
fi


if [ "${RESULTS_FILE}" == "" ] ;  then
RESULTS_FILE=/brqx/results/check_logs_server.dat
fi


if [ "${DATE_LOG}" == "" ] ;  then
# 01/Aug/2014
DATE_LOG=$( date "+%d/%b/%Y" )
fi

if [ "${LINE_LENGTH}" == "" ] ;  then
LINE_LENGTH=70
fi

if [ "${AUX_LOG_FILE}" == "" ] ;  then
AUX_LOG_FILE=${NOMBRE_LOG}_aux
AUXFULL_LOG_FILE=${NOMBRE_LOG}_auxfull
fi


if [ "${ACCOUNTS_FILE}" == "-?" ] ;  then
e_pmi ${NOMBRE_SCRIPT_serverlogs} ${PARAMETROS_SCRIPT_serverlogs}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar fichero informacin cuentas
#-- [2] Obtener la informacion de la linea pasada
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-Salida: 
#---===---===---===---===---===---===---===---===---===---===---===-
#-- [0] Informacion obtenida
#-- [1] No se puede obtener la informacion
#--------========--------========--------========--------========---

if [ -f "${ACCOUNTS_FILE}" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- [1] Inicio Comprobacion fichero log existe
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--

MOTIVO_FUNCION="Fichero de cuentas correcto"
SALIDA_serverlogs=1

for cuenta in $(cat "${ACCOUNTS_FILE}" ) ; do

ACCOUNT=$( echo ${cuenta} | cut -d ":" -f1 )
DOMAIN=$( echo ${cuenta} | cut -d ":" -f2 )

echo "Antes de entrar : ${DOMAIN} == ${ACCOUNT} "

if [ "${DOMAIN}" == "" -o  "${DOMAIN}" == "${ACCOUNT}" ] ; then
OLD_PATH=$PWD
cd /home/${ACCOUNT}/www/
DOMAIN=$( surl | grep home| cut -d " " -f2 )

echo "Dominio obtenido : ${DOMAIN} "

cd ${OLD_PATH}
fi

echo "${ACCOUNT}:${DOMAIN}:${ACCOUNT_LOG}"

ACCOUNT_LOG="/home/${ACCOUNT}/access_log/${DOMAIN}"

done

fi

fi
}