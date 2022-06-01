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
#-- get_dead_backup_fs_data
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
#E get_dead_backup_fs_data zi  -- Devuelve los datos para la cuenta zi
#-------------------------------------------------------------------
#E get_dead_backup_db_data zi parques -- Devuelve los datos para la cuenta zi:parques
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-mini alias gdbdd
get_dead_backup_fs_data()
{
IS_get_dead_backup_fs_data="Obtiene los parametros de backup para la cuenta indicada"
INFO_SCRIPT=${IS_get_dead_backup_fs_data}

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

e_pmt get_dead_backup_fs_data "[proyecto] [site]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Debe devolvar las rutas origen y destino del backup : 
#- Para lo cual debe conocer servidor cuenta 

get_path_site ${CUENTA_ORIGEN} ${PROYECTO_ORIGEN}
# - Tenemos ya definida RUTA_FS_ORIGEN /home/cuenta/www/...

#-Obtenemos informacion del servidor - dead backup - 
get_dead_backup_db_data ${CUENTA_ORIGEN} ${PROYECTO_ORIGEN}

#-Le insertamos fs a la ruta del servidor

RUTA_SERVIDOR_FS=${RUTA_SERVIDOR}/fs/

cleanpath ${RUTA_SERVIDOR_FS}

RUTA_SERVIDOR_FS=${SALIDA_cleanpath}

#-Ahora accedemos a la ruta de backup del servidor
get_path_for_backup ${CUENTA_ORIGEN} ${PROYECTO_ORIGEN} ${SERVIDOR} ${RUTA_SERVIDOR_FS}

#-Actualizamos el servidor local
get_nombre_servidor_local

#-Definida tambien RUTA_FS_DESTINO /home/cuenta/www/fs
RUTA_FS_DESTINO=${BACKUP_PATH}

#-Vamos con el nombre del archivo

get_nombre_fichero_export ${CUENTA_ORIGEN} ${PROYECTO_ORIGEN}

#-Establecido el nombre del fichero
NOMBRE_FICHERO_EXPORT_BK=${SALIDA_get_nombre_fichero_export}


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
