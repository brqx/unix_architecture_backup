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

sync_dir_to_local()
{
SOURCE=${1}
TARGET=${2}

echo "Proceso sincronismo : $(date +'%G%m%d%h' ) "
echo "==========================================="
echo "Sincronizando 2.2 - ${FECHA}" >> ${SYNC_LOG_FILE}
src=${SOURCE}
dst=${TARGET}

#-Local sync
rsync -rtvu  ${src} ${dst}
}

#-Suresync - Never delete
sync_dir_to_local_web()
{
SRC=/home/comandos/garland/index1/
TAR=/suresync/html/flight/home/

sync_dir_to_local ${SRC} ${TAR}

}

FECHA=$(date +%G_%m_%d_%H-%M)
echo $FECHA
SYNC_LOG_FILE=/var/log/zsync/zsync_local_${FECHA}.log


sync_dir_to_local_web	       	      ##  >> ${SYNC_LOG_FILE}

