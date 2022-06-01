#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.1"          #  Version del Script actual
FECHA_SCRIPT="Febrero 2012"
STATUS_SCRIPT="checking"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
LEVEL_NIVEL_05=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="funcion"
CONCEPT_ARQUETIPO_05="control"
CONCEPT_LEVEL_05="Script $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- check_entorno_no_proxy
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - site_access_proxy - intelliformat - formatea
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Busca logs concanenando contador
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T busca logs servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [RUTA_SERVIDORES] 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E check_entorno_proxy	--> Chequea todos los servidores indicados
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Alias ckentorno
#-Mini alias ckent
check_entorno_no_proxy()
{
IS_check_entorno_no_proxy="Comprueba todo el entorno via proxy. Puerto http."
INFO_SCRIPT=${IS_check_entorno_no_proxy}

#-Como va a ser un agrupador de conexiones es dificil ponerle parametros

INFO=$1

if [ "${INFO}" == "-?" ] ;  then

e_pmt check_entorno_no_proxy 

else
#-Lo mas dificil es saber el estado global
# Tambien recordar que desde las funciones no se puede invocar a los alias

#-- Chequeo de las consolas de los servidores
check_sites_no_proxy ${RS_CONN}zsites_consolas.dat

#-- Chequeo de los frontales de los servidores
check_sites_no_proxy

#-- Chequeo de los apaches
check_servidores_apache_no_proxy

fi
}

#-------------------------------------------------------------------

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
