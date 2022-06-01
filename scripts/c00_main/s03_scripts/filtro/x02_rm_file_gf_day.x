#!/bin/bash
#-------------------------------------------------------------------
# Funciones Especificas Entornos Unix - Brqz - I+D
# BRQX NG - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.3"          #  Version del Script actual
FECHA_SCRIPT="Octubre 2011"
#-==================================================================
#+ Script:
#-------------------------------------------------------------------
#-Ej: gf 03 --> Funcion de busqueda de archivos basandose en contenidos

# El objetivo del script es eliminar los ficheros del mes anterior
# Para su ejecucion vamos a usar la funcion gf modificada por fecha

gfday()
{

# Filtra por defecto por el parametro pasado por parameto
FILTRO=$1 ;
RUTA=$2

if [ "${FILTRO}" == "" ] ;  then
# No se pasa ningun parametro
MES=`date '+%m'`
YEAR=`date '+%Y'`
FILTRO="${YEAR}-${MES}"
RUTA=$PWD
else
if [ "${RUTA}" == "" ] ;  then
RUTA=$PWD
fi
fi


# Vamos con el codigo del script

RUTA_ANTERIOR=$PWD

cd ${RUTA}

ls -1 | grep "${FILTRO}"

rm -f $( ls -1 | grep "${FILTRO}" )

cd ${RUTA_ANTERIOR}
}

#- Logs del servidor

gfday $(date '+%y').$(date '+%m') /opt/WebSphere61/AppServer/profiles/ProcSrv02/logs/server1

