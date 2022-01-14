#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.1"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="funcion"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05}"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- bk_db_to_server
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - bk_path_to_server
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera un backup (tar.gz) de la ruta indicada en el servidor 
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T backup ficheros ssh scp servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [usuario] [servidor] [RUTA_EXPORT_BBDD] [FICHERO_BBDD] [FICHERO_SERVIDORES] 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E bk_db_to_server zd_palillos  -- backup de bbdd palillos en servidor soa7a
#-------------------------------------------------------------------
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-mini alias bkdbs
bk_db_to_server()
{
IS_bk_db_to_server="Backup bbdd en servidor destino"
INFO_SCRIPT=${IS_bk_db_to_server}

CUENTA=${1}
SERVIDOR=${2}
RUTA_EXPORT_BBDD=${3}
FICHERO_BACKUP_BBDD=${4}
FICHERO_BACKUP_SERVIDORES=${4}

if [ "${CUENTA}" == "" ]; then
## Activamos un usuario por defecto
CUENTA="-?"
fi  

#-El servidor igual tambien lo podemos obtener via configuracion
if [ "${SERVIDOR}" == "" ]; then
SERVER=soa7a
fi  

if [ "${RUTA_EXPORT_BBDD}" == "" ]; then
RUTA_EXPORT_BBDD=${DB_GLOBAL_EXPORT}
fi  

if [ "${FICHERO_BACKUP_BBDD}" == "" ]; then
FICHERO_BACKUP_BBDD=/brqx/zzcuentas_servidor.dat
fi  

if [ "${FICHERO_BACKUP_SERVIDORES}" == "" ]; then
FICHERO_BACKUP_SERVIDORES=/brqx/zzb_servers.dat
fi  


if [ "${CUENTA}" == "-?" ]; then

e_pmt bk_db_to_server "[usuario] [servidor]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Hay que saber que BBDD hay que exportar

NOMBRE_FICHERO=db-full-${CUENTA}

#- Usuario servidor y puerto lo obtiene del archivo de servidores /brqx/servidores_brqx.dat

#-El parseo de bbdd obtiene entre otras cosas el servidor
parseo_backup_bbdd ${CUENTA} ${FICHERO_BACKUP_BBDD}

parseo_backup_servidores ${SERVER} ${FICHERO_BACKUP_SERVIDORES}

db_export ${BBDD_LOCAL} ${BBDD_REMOTA} ${RUTA_EXPORT_BBDD}

#- Exporta la bbdd en la ruta que se le indique

##echo "${USUARIO_CONEXION} ${SERVER} ${PORT} ${RUTA_EXPORT_BBDD}  ${RUTA_BACKUP_GLOBAL} ${CUENTA}"

bk_path_to_server ${USUARIO_CONEXION} ${SITE_SERVER} ${SITE_PORT} \
${RUTA_EXPORT_BBDD}  ${RUTA_BACKUP_GLOBAL} ${NOMBRE_FICHERO}

##bk_path_to_server ricabel soa7a 22 /home/ricabel/Descargas/c /opt/zdown/aa/bb/cc/aa/ff ricardo

fi
}


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
