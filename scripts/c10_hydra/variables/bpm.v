#!/usr/bin/bash
#-------------------------------------------------------------------
# Variables Entornos Unix - Brqz - I+D
# BRQX NG - Rct - 2007
#-------------------------------------------------------------------
VERSION_SCRIPT="V 3.1"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2007"
#-==================================================================

#- Bpm
BPM_HOME=${WEBSPHERE_HOME}ProcServer/

# Ruta donde se almacenan las sesiones al instalar el BPM
BPM_INSTALACION_TMP=${BPM_HOME}profiles/HIDRANET/wstemp/

BPM_INSTALACION_BASE_TRANLOG=${BPM_HOME}profiles/HIDRANET/tranlog/
BPM_INSTALACION_TRANLOG=${BPM_INSTALACION_BASE_TRANLOG}${PLAT}Node01Cell/${PLAT}Node01/server1/transaction/tranlog

BPM_CONF=${BPM_HOME}TID/

RUTA_EARS_BPM=${BPM_HOME}profiles/HIDRANET/installedApps/${PLAT}Node01Cell/BPCExplorer_${PLAT}Node01_server1.ear/
RUTA_PAGINAS_BPM=${RUTA_EARS_BPM}bpcexplorer.war/pages/

RUTA_LISTADOS_BPM=${RUTA_PAGINAS_BPM}layouts/lists/

