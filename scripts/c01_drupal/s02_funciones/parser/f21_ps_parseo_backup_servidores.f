#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.5"          #  Version del Script actual
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
#-- parseo_backup_servidores
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Parsea el fichero de configuracion obteniendo los datos del servidor
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T parseo configuracion servidores ssh backup
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P servidor [fichero_configuracion]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E parseo_backup_servidores servidor fichero_config -- Obtiene datos para el servidor
#-------------------------------------------------------------------
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-mini alias dmsv_data
#- dame_server_data
parseo_backup_servidores()
{
IS_parseo_backup_servidores="Actualiza variables conexion en razon a la configuracion de servidores."
INFO_SCRIPT=${IS_parseo_backup_servidores}

SITE_SERVER=${1}
FICHERO_BACKUP_SERVIDORES=${2}

if [ "${SITE_SERVER}" == "" ]; then
SITE_SERVER="-?"
fi  

if [ "${FICHERO_BACKUP_SERVIDORES}" == "" ]; then
FICHERO_BACKUP_SERVIDORES=/brqx/zzb_servers.dat
fi  

if [ "${SITE_SERVER}" == "-?" ]; then

e_pmt parseo_backup_servidores "servidor [fichero_configuracion]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

LINEA_SERVIDOR=$( cat ${FICHERO_BACKUP_SERVIDORES} | grep "^${SITE_SERVER}" )

#-------------------------------------------------------------------

USUARIO_CONEXION=$( echo ${LINEA_SERVIDOR} | cut -d ":" -f2 )
SITE_PORT=$( echo ${LINEA_SERVIDOR} | cut -d ":" -f3 )
RUTA_BACKUP_GLOBAL=$( echo ${LINEA_SERVIDOR} | cut -d ":" -f4 )

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
