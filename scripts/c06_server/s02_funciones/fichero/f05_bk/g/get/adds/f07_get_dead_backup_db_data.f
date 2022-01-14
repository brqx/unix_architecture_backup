#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.4"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2012"
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
#-- get_dead_backup_db_data
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Obtiene los parametros para hacer el backup del site
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T obtencion parametros get backup ficheros ssh scp servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [cuenta] [proyecto]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E get_dead_backup_db_data zi  -- Devuelve los datos para la cuenta zi
#-------------------------------------------------------------------
#E get_dead_backup_db_data zi parques -- Devuelve los datos para la cuenta zi:parques
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-mini alias gdbdd
get_dead_backup_db_data()
{
IS_get_dead_backup_db_data="Obtiene los parametros de backup para la cuenta indicada"
INFO_SCRIPT=${IS_get_dead_backup_db_data}

#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2012
#-------------------------------------------------------------------

#-Los sites son el despliegue de un proyecto en una cuenta de un servidor

CUENTA_ORIGEN=${1}
PROYECTO_ORIGEN=${2}

if [ "${CUENTA_ORIGEN}" == "" ]; then
## Activamos un usuario por defecto
CUENTA_ORIGEN=-?
fi  

if [ "${PROYECTO_ORIGEN}" == "" ]; then
## Activamos un proyecto por defecto
PROYECTO_ORIGEN=main
fi  

if [ "${CUENTA_ORIGEN}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt get_dead_backup_db_data "[proyecto] [site]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- y el fichero : 
# cuenta:proyecto:bbdd_local:bbdd_remota:servidor_backup
# main:palillos:p50palil:p50palil:abrqx
# za:palillos:d50palil:d50palil:bbrqx

#-Informacion cuentas servidor
FICHERO=${RS_SITE}zinfo_db_sites_dead_backup.dat

#-Primero vamos a obtener el servidor de backup

if [ "${PROYECTO_ORIGEN}" == "main" ] ; then
#- Es un site principal
#- Pero la ruta debe existir en nuestro archivo

LINEA_DB=$( cat ${FICHERO} | grep "^main"  | grep ":${CUENTA_ORIGEN}" )

else
#- Es un subdominio.Tendremos un fichero general para subdominios

LINEA_DB=$( cat $FICHERO | grep "^${CUENTA_ORIGEN}"  | grep ":${PROYECTO_ORIGEN}" )

fi

#-Obtenemos los parametros del site para hacer el backup
DB_LOCAL=$( echo ${LINEA_DB} | cut -d ":" -f3 )
DB_REMOTA=$( echo ${LINEA_DB} | cut -d ":" -f4 )
SERVER_REMOTO=$( echo ${LINEA_DB} | cut -d ":" -f5 )

#-Fichero origen para el backup

RUTA_FICHERO_DB_ORIGEN="${DB_GLOBAL_EXPORT}${DB_REMOTA}.sql"

#-Vamos a obtener la informacion de los servidores local y remoto

get_server_params ${SERVER_REMOTO}

get_nombre_servidor_local

#-----------------

#-Le insertamos db a la ruta del servidor

RUTA_SERVIDOR_DB=${RUTA_SERVIDOR}/db/

cleanpath ${RUTA_SERVIDOR_DB}

RUTA_SERVIDOR_DB=${SALIDA_cleanpath}

#-Ahora accedemos a la ruta de backup del servidor
get_path_for_backup ${CUENTA_ORIGEN} ${PROYECTO_ORIGEN} ${SERVIDOR} ${RUTA_SERVIDOR_DB}

#-Definida tambien RUTA_FS_DESTINO /home/cuenta/www/fs
RUTA_DB_DESTINO=${BACKUP_PATH}

#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
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
