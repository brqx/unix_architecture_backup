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
#-- print_backup_server_info
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - get_backup_server_info
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Muestra los parametros del servidor indicado para hacer el backup del site
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T impresion parametros servidor get backup ficheros ssh scp servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [servidor] 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E print_backup_server_info abrqx  -- Imprime los datos para el servidor abrqx
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-mini alias pbsi
print_backup_server_info()
{
IS_print_backup_server_info="Muestra los parametros del servidor indicado"
INFO_SCRIPT=${IS_print_backup_server_info}

#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2012
#-------------------------------------------------------------------

#-Los sites son el despliegue de un proyecto en una cuenta de un servidor

SERVIDOR=${1}

if [ "${SERVIDOR}" == "" ]; then
SERVIDOR="-?"
fi  

if [ "${SERVIDOR}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt print_backup_server_info "[servidor]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

get_backup_server_info ${SERVIDOR}

linea_normal
echo "Parametros para el servidor : ${SERVIDOR}"
linea_alterna
echo "Usuario    : ${USUARIO_CONEXION} "
echo "Puerto     : ${PORT}				"
echo "Ruta Bk DB : ${RUTA_BACKUP_DB}"
echo "Ruta Bk FS : ${RUTA_BACKUP_FS}"
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
