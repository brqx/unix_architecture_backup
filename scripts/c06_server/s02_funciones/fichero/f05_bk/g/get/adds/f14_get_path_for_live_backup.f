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
#-- get_path_for_live_backup
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- get_path_site - cleanpath - e_pmt 
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
#E get_path_for_live_backup abrqx  -- Devuelve el nombre para el fichero de backup
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-mini alias gplb
get_path_for_live_backup()
{
IS_get_path_for_live_backup="Obtiene el nombre del fichero a exportar"
INFO_SCRIPT=${IS_get_path_for_live_backup}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_get_path_for_live_backup=${INFO_SCRIPT}


CUENTA=${1}
PROYECTO=${2}

SALIDA_get_path_for_live_backup=0

NOMBRE_SCRIPT_get_path_for_live_backup=get_path_for_live_backup
PARAMETROS_SCRIPT_get_path_for_live_backup="cuenta [proyecto]"


if [ "${CUENTA}" == "" ] ; then
CUENTA= "-?"
fi

if [ "${PROYECTO}" == "" ] ; then
#- Igual hay que quitarle el .com - se le pasa como parametro
PROYECTO=main
fi

if [ "${CUENTA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_get_path_for_live_backup} ${PARAMETROS_SCRIPT_get_path_for_live_backup} 


else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-La funcion la vamos a usar como origen o como destino
#--- aqui llamariamos a brqxng

## echo "Sacando el path para : ${CUENTA} ${PROYECTO}"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

get_path_site ${CUENTA} ${PROYECTO}
SALIDA_get_path_for_live_backup=${SALIDA_get_path_site}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_get_path_site}" == "0" ] ; then
#------======------======------======------======------======------=
#----- [2] Inicio Ruta obtenida
#------======------======------======------======------======------=

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

LIVE_BACKUP_PATH=${RUTA_get_path_site}
cleanpath ${LIVE_BACKUP_PATH}

LIVE_BACKUP_PATH=${SALIDA_cleanpath}

cleanpath ${LIVE_BACKUP_PATH}

LIVE_BACKUP_PATH=${SALIDA_cleanpath}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#--Cambiamos SALIDA por RUTA
RUTA_get_path_for_live_backup=${LIVE_BACKUP_PATH}

## echo "Path obtenido : ${LIVE_BACKUP_PATH} "

MOTIVO_FUNCION="Ruta obtenida correctamente"
PARAMETROS_MOTIVO_01="Ruta : ${RUTA_get_path_for_live_backup}"

else

MOTIVO_FUNCION="Error al obtener la ruta. Posible error en la cuenta y/o proyecto."
PARAMETROS_MOTIVO_01="Parametros: ${CUENTA} ${PROYECTO} ${ENFOQUE}"

fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_get_path_for_live_backup}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_get_path_for_live_backup}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_get_path_for_live_backup}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_get_path_site}
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
