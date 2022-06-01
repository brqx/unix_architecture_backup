#!/bin/bash
#-------------------------------------------------------------------
# Variables Entornos Unix - Brqz - I+D
# BRQX NG - Rct - 2010
#-------------------------------------------------------------------
VERSION_SCRIPT="V 3.0"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2011"
#-==================================================================

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Logs de los productos de IBM : Websphere
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#-------------------------------------------------------------------
#- Log general - El que se usa normalmente -
#-------------------------------------------------------------------

WPS_LOGS=${WPS_PF}${PERFIL_01}/logs/server1/SystemOut.log
WPS_STARTLOGS=${WPS_PF}${PERFIL_01}/logs/server1/startServer.log

#-------------------------------------------------------------------
#- Log perfil 01
#-------------------------------------------------------------------

WPS_LOGP1=${WPS_PF}${PERFIL_01}/logs/server1/SystemOut.log
WPS_SLOGP1=${WPS_PF}${PERFIL_01}/logs/server1/startServer.log

#-------------------------------------------------------------------
#- Log perfil 02
#-------------------------------------------------------------------

WPS_LOGP2=${WPS_PF}${PERFIL_02}/logs/server1/SystemOut.log
WPS_SLOGP2=${WPS_PF}${PERFIL_02}/logs/server1/startServer.log

#-------------------------------------------------------------------
#- Log perfil 03
#-------------------------------------------------------------------

WPS_LOGP3=${WPS_PF}${PERFIL_03}/logs/server1/SystemOut.log
WPS_SLOGP3=${WPS_PF}${PERFIL_03}/logs/server1/startServer.log

#-------------------------------------------------------------------
#- Log perfil 04
#-------------------------------------------------------------------

WPS_LOGP4=${WPS_PF}${PERFIL_04}/logs/server1/SystemOut.log
WPS_SLOGP4=${WPS_PF}${PERFIL_04}/logs/server1/startServer.log

# Nueva version de Logs - Acceso via Apache
#-------------------------------------------------------------------

WPS_LOGS_SOA=${APACHE_AUTO}/soa
WPS_LOGS_CORE=${APACHE_AUTO}/core
WPS_LOGS_FRONTAL=${APACHE_AUTO}/frontal
WPS_LOGS_APLICACIONES=${APACHE_AUTO}/aplicaciones



#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------

