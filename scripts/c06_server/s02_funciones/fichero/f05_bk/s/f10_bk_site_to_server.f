#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.5"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2011"
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
#-- bk_site_to_server
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - czf_path_to_server_file
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera un backup de FS y DB del site indicado
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T dead backup site ficheros ssh scp servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [usuario_servidor] [site]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E bk_site_to_server rct -- Hace un backup del site rct
#-------------------------------------------------------------------
#E bk_path_to_server za parques  -- Hace un backup del site za:parques
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Dead Backup
#-mini alias bks
bk_site_to_server()
{
IS_bk_site_to_server="Backup site en servidor destino."
INFO_SCRIPT=${IS_bk_site_to_server}
#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2012
#-------------------------------------------------------------------

#-Vamos a pensar en lo que necesitamos :

#- bks zi  --> Debe hacer un Dbackup global de zi
#- bks zi parques --> Debe hacer un Dbackup global de zi:parques


CUENTA=${1}
PROYECTO=${2}

#-Almacenamos la ruta actual para poder volver
RUTA_ACTUAL=${PWD}


if [ "${CUENTA}" == "" ]; then
## Activamos un usuario por defecto
CUENTA=za
fi  

if [ "${PROYECTO}" == "" ]; then
## Activamos un proyecto por defecto
PROYECTO=main
fi  


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${CUENTA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt bk_site_to_server "[cuenta] [proyecto]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-Almacenamos la ruta previa al backup
RUTA_ACTUAL_BK=${PWD}


#-Obtenemos informacion para hacer el dead backup
get_dead_backup_fs_data ${CUENTA}  ${PROYECTO}

#-Requiere BD1 BD2 RUTA

db_export ${DB_LOCAL} ${DB_REMOTA}

#-Preparamos el servidor
#- No son correctos los datos

## echo "-- ${USUARIO_CONEXION} ${SERVER} ${PORT}  "
## echo "-origen - ${RUTA_FS_ORIGEN}		"
## echo "-destino- ${RUTA_FS_DESTINO}		"
## echo "-archivo- fs_${NOMBRE_FICHERO_SITE}  "
## echo " Ahora DB  -esta funciona - : "
## echo "-origen - ${RUTA_FICHERO_DB_ORIGEN}		"
## echo "-destino- ${RUTA_DB_DESTINO}		"
## echo "-archivo- db_${NOMBRE_FICHERO_SITE}  "

#-Copiariamos el sistema
czf_path_to_server_file ${USUARIO_CONEXION} ${SERVER} ${PORT} ${RUTA_FS_ORIGEN} ${RUTA_FS_DESTINO} fs_${NOMBRE_FICHERO_SITE}

#-Copiariamos la BD - Esto esta pendiente
czf_path_to_server_file ${USUARIO_CONEXION} ${SERVER} ${PORT} ${RUTA_FICHERO_DB_ORIGEN} ${RUTA_DB_DESTINO} db_${NOMBRE_FICHERO_SITE}

#-Volvemos a la ruta actual
cd ${RUTA_ACTUAL_BK}

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
