#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.4"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2012"
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
#-- get_dead_backup_data
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - get_server_params - get_backup_site_data - get_nombre_fichero_export
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
#E get_dead_backup_data zi  -- Devuelve los datos para la cuenta zi
#-------------------------------------------------------------------
#E get_dead_backup_data zi parques -- Devuelve los datos para la cuenta zi:parques
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-mini alias gbk
get_dead_backup_data()
{
IS_get_dead_backup_data="Obtiene los parametros de backup para la cuenta indicada"
INFO_SCRIPT=${IS_get_dead_backup_data}
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

e_pmt get_dead_backup_data "[proyecto] [site]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Informacion del Site - debe obtener la ruta base
get_backup_site_data ${CUENTA_ORIGEN} ${PROYECTO_ORIGEN}

#- Sacamos el nombre del fichero a exportar
get_nombre_fichero_export ${CUENTA_ORIGEN} ${PROYECTO_ORIGEN}

#- Obtenemos el nombre del servidor para los backups
get_nombre_servidor_local $(uname -n |  tr '[:upper:]' '[:lower:]' )

#- Obtenemos la ruta remota para el backup
get_path_for_backup ${CUENTA_ORIGEN} ${PROYECTO_ORIGEN} ${SERVIDOR_LOCAL} ${RUTA_BASE}



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
