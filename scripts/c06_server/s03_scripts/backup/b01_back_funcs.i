#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2016
#-------------------------------------------------------------------
#-Cargamos funcion de sincronismo y backup

#-Funciones necesarias para sincronismo unidireccional (rsync)
. /brqx/arquitectura/unix/scripts/c00_main/s02_funciones/utils/cadenas/f10_fix_bar_path_ajuste_barra_ruta.f
. /root/scripts/arq/b02_scripts/s02_functions/system/server/sync/auxi/gsd_get_server_data.f
. /root/scripts/arq/b02_scripts/s02_functions/system/server/sync/auxi/sync_set_path.f
. /root/scripts/arq/b02_scripts/s02_functions/system/server/sync/auxi/sync_set_target.f
. /root/scripts/arq/b02_scripts/s02_functions/system/server/sync/auxi/csd_check_server_data.f
. /root/scripts/arq/b02_scripts/s02_functions/system/server/sync/remote/level_01/srxto_sync_to_remote_folder.f

#-Funciones para los backups

. /root/scripts/arq/b02_scripts/s02_functions/system/server/back/auxi/get_backup_personal_server_data.f
. /root/scripts/arq/b02_scripts/s02_functions/system/server/back/spec/remote/level_01/bprx_backup_personal_remote_path.f
. /root/scripts/arq/b02_scripts/s02_functions/system/server/back/spec/remote/level_02/back_documents.f

