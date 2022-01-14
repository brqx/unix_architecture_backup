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
#-- parseo_backup_bbdd
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Parsea el fichero de configuracion obteniendo los datos de bbdd
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T parseo configuracion servidores bbdd ssh backup
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P cuenta [fichero_configuracion]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E parseo_backup_bbdd cuenta fichero_config -- Obtiene datos para la cuenta
#-------------------------------------------------------------------
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-mini alias dmdb_data
#- dame_bbdd_data
parseo_backup_bbdd()
{
IS_parseo_backup_bbdd="Actualiza variables conexion en razon a la configuracion de bbdd"
INFO_SCRIPT=${IS_parseo_backup_bbdd}

CUENTA=${1}
FICHERO_BACKUP_BBDD=${2}

if [ "${CUENTA}" == "" ]; then
## Activamos un usuario por defecto
CUENTA="-?"
fi  

if [ "${FICHERO_BACKUP_BBDD}" == "" ]; then
FICHERO_BACKUP_BBDD=/brqx/zzcuentas_servidor.dat
fi  

if [ "${CUENTA}" == "-?" ]; then

e_pmt IS_parseo_backup_bbdd "cuenta [fichero_configuracion]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

LINEA_BBDD=$( cat ${FICHERO_BACKUP_BBDD} | grep "^${CUENTA}" )

#-------------------------------------------------------------------

BBDD_LOCAL=$( echo ${LINEA_BBDD} | cut -d ":" -f2 )
BBDD_REMOTA=$( echo ${LINEA_BBDD} | cut -d ":" -f3 )
SITE_SERVER=$( echo ${LINEA_BBDD} | cut -d ":" -f4 )
RUTA_EXPORT_BBDD=$( echo ${LINEA_BBDD} | cut -d ":" -f5 )


if [ "${RUTA_EXPORT_BBDD}" == "" ]; then
RUTA_EXPORT_BBDD=${DB_GLOBAL_EXPORT}
fi  

if [ "${SERVER}" == "" ]; then
#- Recuperamos el servidor global de backup
RUTA_EXPORT_BBDD=${DB_GLOBAL_SERVER}
fi  


#-Devolvemos la ruta de exportacion indicando la cuenta
RUTA_EXPORT_BBDD=${RUTA_EXPORT_BBDD}${CUENTA}

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
