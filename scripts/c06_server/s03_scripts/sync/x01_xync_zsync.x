#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2021
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2021"
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
SYNC_LOG_FILE=/var/log/cron/zsync.log

# Funcion que recibe usa variables definidas
# - Directorios SOURCE y TARGET
# - Servidor remoto USER - SERVER y PORT
# - Ejemplo Library/dir1

brqx_sync_to()
{
SOURCE=$1
TARGET=$2
OLD_PATH=${PWD}
TARGET_PWD=$(dirname ${SOURCE})
cd ${SOURCE}

echo "Sincronizando ${SOURCE} en ${TARGET_PWD}"
#xfrom_mac
# Queremos sincronizar desde Library siempre
## rsync -avz --omit-dir-times -e "ssh -oPort=${PORT}" ${USER}@${SERVER}:$PWD/ ${PWD}/ &> /dev/null

sleep 2
## rsync -avz --omit-dir-times -e "ssh -oPort=60022" ${PWD}/ ${USER}@${SERVER}:$PWD/ &> /dev/null

#xto_farm
## chown -R apache. /zsync/Documentos/a/ &> /dev/null
## chmod -R 775 /zsync/Documentos/a/

cd ${OLD_PATH}
echo "End Sync"

}
