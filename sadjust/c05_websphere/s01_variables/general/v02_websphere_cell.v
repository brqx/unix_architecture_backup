#!/bin/bash
#-------------------------------------------------------------------
# Variables Entornos Unix - Mapfre - Arquitectura
# BRQX NG - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 5.0"          #  Version del Script actual
FECHA_SCRIPT="Febrero 2012"
#-==================================================================
#-------------------------------------------------------------------
#- Para definir la celda partimos del perfil y definimos lac celda
#  Esta variable cambia por cada WPS
#-------------------------------------------------------------------

#-------------------------------------------------------------------
#- Seccion de configuracion Especifica
#-------------------------------------------------------------------

#-SERVER_CHANGE-  -- Cambios especificos de servidor

#-Valores para core
ADMIN_DMGR_HOST=LES000900200
ADMIN_DMGR_PORT=8879
ADMIN_DMGR_USER=app-arq
ADMIN_DMGR_PASS=Arqu1t3ctura

WEBSPHERE_CELL=${WPS_PD}config/cells/LES000900304Node02Cell/

WEBSPHERE_NODO=${WEBSPHERE_CELL}nodes/LES000900304Node02/

WEBSPHERE_APPS=${WEBSPHERE_CELL}applications/

WEBSPHERE_SERVER=${WEBSPHERE_NODO}servers/server1/

#-Fichero que apunta al serverindex del servidor
WAS_SERVER_INDEX_FILE=${WEBSPHERE_NODO}serverindex.xml


#-------------------------------------------------------------------
#- Logs de la celda - Cambia con cada entorno
#-------------------------------------------------------------------

LOGS_CELL=${WPS_DM}logs/server1/

LOGS_NODO=${WPS_PD}logs/server1/

LOGS_SERVER=${WPS_PD}logs/server1/

#-------------------------------------------------------------------
#- Especificos de cada entorno - cambian con cada plataforma
#-------------------------------------------------------------------

LOGS_CORE=${WPS_DM}logs/server1/

LOGS_FRON=${WPS_PD}logs/server1/

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------

