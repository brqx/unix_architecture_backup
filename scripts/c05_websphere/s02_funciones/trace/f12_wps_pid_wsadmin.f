#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2010
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2010"
#-==================================================================
#+ Funciones:
#-------------------------------------------------------------------
#-Ej: wps_pid --> Obtiene los PID de los procesos WAS
#
#- Lo obtenemos tanto del startServer.log como del SystemOut.log
# 
#-------------------------------------------------------------------

wsadmin_get_pid()
{
INFO_SCRIPT="Obtenemos el PID del WAS con un perfil indicado (Basado en wsadmin)"

# La idea es usar wsr para obtener los datos



echo "-----------------------------------------------"
echo "Perfil : ${PERFIL_WPS} - ${RUTA_WPS}           " 
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo "Inicio del servidor  : ${FECHA_PROCESS_STARTLOG}"
echo "Estado del servidor  : ${PROCESO_EXISTE}       "
echo "PID from wsadmin     : ${PID_PROCESS_STARTLOG} "
echo "-----------------------------------------------"

}


