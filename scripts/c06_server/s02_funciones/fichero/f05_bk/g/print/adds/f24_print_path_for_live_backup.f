#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.4"          #  Version del Script actual
FECHA_SCRIPT="Abril 2012"
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
#-- print_path_for_live_backup
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Imprime la ruta de backup en el servidor remoto
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T impresion ruta backup servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P cuenta [proyecto] 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E print_path_for_live_backup abrqx  -- Imprime la ruta de backup en el servidor
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-mini alias ppb
print_path_for_live_backup()
{
IS_print_path_for_live_backup="Imprime ruta backup en el servidor"
INFO_SCRIPT=${IS_print_path_for_live_backup}
#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2012
#-------------------------------------------------------------------

#-Vamos a permitir cuentas y proyectos vacios en la generacion del nombre

CUENTA=${1}
PROYECTO=${2}


if [ "${CUENTA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt print_path_for_live_backup "[cuenta] [proyecto]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

get_path_for_live_backup ${CUENTA} ${PROYECTO} 

RUTA_LIVE_BACKUP=${SALIDA_get_path_for_live_backup}

linea_normal
echo "Parametros para el site  : ${CUENTA} ${PROYECTO}  "
echo "Ruta base de partida     : ${RUTA_BASE}           "
linea_alterna
echo "Ruta Live backup         : ${RUTA_LIVE_BACKUP}    "
linea_normal

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
