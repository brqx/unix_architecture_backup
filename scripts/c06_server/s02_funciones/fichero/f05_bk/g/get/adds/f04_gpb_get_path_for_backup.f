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
#-- get_path_for_backup
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Obtiene la ruta para el backup remoto
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T obtencion ruta backup servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [servidor] 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E get_nombre_fichero_export abrqx  -- Devuelve el nombre para el fichero de backup
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-mini alias gpb
get_path_for_backup()
{
IS_get_path_for_backup="Obtiene el nombre del fichero a exportar"
INFO_SCRIPT=${IS_get_path_for_backup}

#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2012
#-------------------------------------------------------------------

#-El servidor local es desde el que se hace el backup

CUENTA=${1}
PROYECTO=${2}
SERVIDOR_LOCAL=${3}
RUTA_BASE=${4}

if [ "${CUENTA}" == "" ] ; then
CUENTA= "-?"
fi

if [ "${PROYECTO}" == "" ] ; then
#- Igual hay que quitarle el .com - se le pasa como parametro
PROYECTO=main
fi

if [ "${SERVIDOR_LOCAL}" == "" ] ; then
#- Igual hay que quitarle el .com - se le pasa como parametro
SERVIDOR_LOCAL=$(uname -n  | cut -d "." -f1)
fi

if [ "${RUTA_BASE}" == "" ] ; then
#- Igual hay que quitarle el .com - se le pasa como parametro
RUTA_BASE=${BRQX_BK}
fi


if [ "${CUENTA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt get_path_for_backup "cuenta [proyecto] [servidor_local] [ruta_base]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

YEAR=$( date +"%Y" )
MES=$(date '+%m')

YEARP=${YEAR}/
MESP=${MES}/

# /brqx/backup/fs/fbrqx/usuario/main/2010/b10_09
# /brqx/backup/fs/fbrqx/za/main/2010/b10_09
# /home/ruso/www/fbrqx/za/palillos/2010/b10_09


#-La funcion la vamos a usar como origen o como destino

BACKUP_PATH=${RUTA_BASE}/${SERVIDOR_LOCAL}/${CUENTA}/${PROYECTO}/${YEARP}b${YEAR}_${MESP}

cleanpath ${BACKUP_PATH}

BACKUP_PATH=${SALIDA_cleanpath}

cleanpath ${BACKUP_PATH}

BACKUP_PATH=${SALIDA_cleanpath}

SALIDA_get_path_for_backup=${BACKUP_PATH}

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
