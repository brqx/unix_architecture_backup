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

gfant()
{
# Filtra por defecto por la fecha actual
# Puede recibir dos parametros : mes - mes y temporada
MES=$1 ;
YEAR=$2 ;

if [ "${MES}" == "" ] ;  then
# No se pasa ningun parametro
MES=`date '+%m'`
YEAR=`date '+%Y'`
else
# Se pasa un parametro
if [ "${YEAR}" == "" ] ;  then
YEAR=`date '+%Y'`
fi

fi

let MES-- ;

#- El problema es que 03 se queda en 2
#  No pasara con 10 - 11 - 12
#
if [ $(echo ${#MES} ) -eq 1 ] ; then
#- Si el mes fuese 0 que ha venido de enero debe ser 12 del anterior year
#  Ya esta adaptado para cualquier YEAR y mes

if [ "${MES}" = "0" ] ; then
MES=12
let YEAR--
else
MES="0${MES}"
fi


fi


ls -1 | grep "${YEAR}-${MES}"

}

# Vamos con el codigo del script


rm -f $( gfant $@ | tr "\n" " " )

