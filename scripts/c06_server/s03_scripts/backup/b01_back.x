#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Septiembre 2015"
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
echo "Realizando Backup Mensual $FECHA"
SYNC_LOG_FILE=/var/log/cron/zback.log

#-Cargamos funcion de sincronismo y backup

. /brqx/arquitectura/unix/scripts/c06_server/s03_scripts/backup/b01_back_funcs.i


#-Llamamos a rsync - Backu mensual
back_documents /zsync/Documentos

back_documents /zsync/StudioBrqx

back_documents /zsync/Fotos

back_documents /zsync/Videos


echo "Backup $FECHA" 			   > ${SYNC_LOG_FILE}		
