#!/bin/bash
#-------------------------------------------------------------------
# Variables Entornos Unix - Mapfre - Arquitectura
# BRQX NG - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 4.0"          #  Version del Script actual
FECHA_SCRIPT="Mayo 2011"
#-==================================================================

#-------------------------------------------------------------------
#- Home de todos los productos de IBM - Process Server - Monitor
#-------------------------------------------------------------------

#-------------------------------------------------------------------
#- Application Server
#-------------------------------------------------------------------

#-SERVER_CHANGE-  -- Cambios especificos de servidor

#-- Valor del Wid7
WEBSPHERE_HOME=/opt/ibm/wid/v7/

WAS_HOME=${WEBSPHERE_HOME}wid7_WTE/runtimes/bi_v7/

WAS_JAVA_HOME=${WAS_HOME}java/bin/

#-------------------------------------------------------------------
#- Process Server
#-------------------------------------------------------------------
WPS_HOME=${WEBSPHERE_HOME}wid7_WTE/runtimes/bi_v7/


#- Arranque
WPS_RUN=${WPS_HOME}bin/

#- Generacion de perfiles
WPS_PM=${WPS_HOME}bin/ProfileManagement/

#- Plugins
WPS_PG=${WPS_HOME}plugins/

#- Gestion de Perfiles existentes
WPS_PF=${WEBSPHERE_HOME}profiles/

#- Indicamos el perfil por defecto
WPS_PD=${WPS_PF}ProcSrv02/

#- Indicamos el dmgr por defecto - Si es standalone apuntamos al perfil
WPS_DM=${WPS_PF}ProcSrv02/


#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
