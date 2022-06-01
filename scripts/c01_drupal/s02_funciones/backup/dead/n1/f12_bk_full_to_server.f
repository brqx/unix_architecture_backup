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
#-- bk_full_to_server
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
#P [usuario] [servidor] [fichero_conf_serv]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E bk_full_to_server palillos soa7a -- backup de palillos en servidor soa7a
#-------------------------------------------------------------------
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-mini alias bkful
bk_full_to_server()
{
IS_bk_full_to_server="Backup completo en servidor destino."
INFO_SCRIPT=${IS_bk_full_to_server}

CUENTA=${1}
SITE_SERVER=${2}
FICHERO_BACKUP_SERVIDORES=${3}


if [ "${CUENTA}" == "" ]; then
## Activamos un usuario por defecto
CUENTA="-?"
fi  

if [ "${SITE_SERVER}" == "" ]; then
SITE_SERVER=soa7a
fi  

if [ "${FICHERO_BACKUP_SERVIDORES}" == "" ]; then
FICHERO_BACKUP_SERVIDORES=/brqx/zzb_servers.dat
fi  


if [ "${CUENTA}" == "-?" ]; then

e_pmt bk_full_to_server "[usuario] [servidor]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- File System Full
NOMBRE_FICHERO=fs-full-${CUENTA}

#- Obtenemos : RUTA_ORIGEN y RUTA_LOGS
parseo_backup_files ${CUENTA} 

#- Obtenemos : SITE_SERVER y datos de BBDD
parseo_backup_bbdd ${CUENTA} 

#- Obtenemos Datos conexion y Ruta Backup global
parseo_backup_servidores ${SITE_SERVER} ${FICHERO_BACKUP_SERVIDORES}

vacia_fichero_log ${RUTA_LOG}

echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
echo " Datos Servidor : "
echo "--------------------------------------"
echo "${USUARIO_CONEXION} ${SITE_SERVER} ${SITE_PORT} "
echo "Origen : ${RUTA_ORIGEN}   "
echo "Destino: ${RUTA_BACKUP_GLOBAL}   "
echo "Archivo: ${NOMBRE_FICHERO}"
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="

bk_path_to_server ${USUARIO_CONEXION} ${SITE_SERVER} ${SITE_PORT}  \
${RUTA_ORIGEN}  ${RUTA_BACKUP_GLOBAL} ${NOMBRE_FICHERO}

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
