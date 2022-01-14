#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.3"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2011"
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
#-- print_dead_backup_data
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - get_dead_backup_data
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Muestra los parametros para hacer el backup del site
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T impresion parametros get backup ficheros ssh scp servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [cuenta] [proyecto]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E print_dead_backup_data zi  -- Muestra los datos para la cuenta zi
#-------------------------------------------------------------------
#E print_dead_backup_data zi parques -- Imprime los datos para la cuenta zi:parques
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-mini alias pbsd
print_dead_backup_data()
{
IS_print_dead_backup_data="Muestra los parametros de backup para la cuenta indicada"
INFO_SCRIPT=${IS_print_dead_backup_data}

#-Los sites son el despliegue de un proyecto en una cuenta de un servidor

CUENTA_ORIGEN=${1}
PROYECTO_ORIGEN=${2}

if [ "${CUENTA_ORIGEN}" == "" ]; then
CUENTA_ORIGEN="-?"
fi  

if [ "${CUENTA_ORIGEN}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt print_dead_backup_data "[proyecto] [site]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Informacion del Site
get_dead_backup_data ${CUENTA_ORIGEN} ${PROYECTO_ORIGEN}

#- Imprimimos la informacion del site
#- Falta revisarlo de nuevo

linea_normal
echo "Dead Backup Site    : ${CUENTA} : ${PROYECTO}"
linea_alterna
echo "DB local            : ${DB_LOCAL}					    "
echo "DB remota           : ${DB_REMOTA}					"
echo "Servidor Local      : ${SERVIDOR_LOCAL}				"
echo "Servidor Remoto     : ${SERVER_REMOTO}				"
linea_normal
echo "Usuario             : ${USUARIO_CONEXION} "
echo "Puerto              : ${PORT}				"
echo "Ruta Bk Remota DB   : ${RUTA_BACKUP_DB}"
echo "Ruta Bk Remota FS   : ${RUTA_BACKUP_FS}"
linea_normal
echo "Ruta Bk FS Origen   : ${RUTA_FS_ORIGEN}		"
echo "Ruta Bk DB Origen   : ${BACKUP_PATH_ORIGEN}		"
echo "Nombre del fichero  : ${NOMBRE_FICHERO_SITE}		"
linea_alterna

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
