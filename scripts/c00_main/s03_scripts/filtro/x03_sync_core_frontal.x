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

sync_folder()
{
#- Queremos sincronizar la misma carpeta en dos maquinas

# Filtra por defecto por el parametro pasado por parameto

DESTINO=$1 ;
RUTA=$2 ;

if [ "${DESTINO}" == "" ] ;  then
# No se pasa ningun parametro
echo "Error de parametrizacion en la sincronizacin "
else

if [ "${RUTA}" == "" ] ;  then
#- Si se pasa solo un parametro - entonces es el servidor
RUTA=/home/ibm/scripts_ibm/sincronismo/
fi
# Vamos con el codigo del script

rsync -avz -e "ssh -oPort=22" ${RUTA}/ root@${DESTINO}:${RUTA}

fi




}

#- Logs del servidor

sync_folder core frontal /home/ibm/scripts_ibm/sincronismo

