#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2015
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Febrero 2015"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_PRODUCTO="cpanel"
CONCEPT_MOLDE="alias"
CONCEPT_ARQUETIPO="fichero"
CONCEPT_LEVEL="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO}"
#-==================================================================
# Funciones definidas:
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# La idea es auto sincronizar rutas paralelas entre servidores
#- ==================================================================


FECHA=$(date +%G_%m_%d_%H-%M)
echo $FECHA
SYNC_LOG_FILE=/var/log/cron/zsync.log

#-Cargamos funcion de sincronismo y backup

#-Funciones necesarias para sincronismo unidireccional (rsync)
. /brqx/arquitectura/unix/scripts/c06_server/s03_scripts/sync/x01_sync_funcs.i

#-Llamamos a unison
dual_sync_documents /zsync/Documentos


