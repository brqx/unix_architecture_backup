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
#-- czl_to_server
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - czf_path_to_server
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Hace una copia de la ruta actual usando tar.gz como intercambio
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T copia ficheros tar gz ssh scp servidor sincronismo
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [usuario] [servidor] [puerto]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E czl_to_server ibm core 22 -- Hace una copia de la ruta actual en core
#-------------------------------------------------------------------
#E czl_to_server ibm core 22 /home/www/zz -- Hace una copia de la ruta indicada en core
#-------------------------------------------------------------------
#E czl_to_server ibm core 22 /home/www/zz /opt -- Hace una copia zz en core::/opt/zz
#-------------------------------------------------------------------
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-mini alias czl
#- alias czl_to_server

czf_live_to_server()
{
IS_czf_live_to_server="Copia ficheros en servidor destino. Sincronismo con tar.gz"
INFO_SCRIPT=${IS_czf_live_to_server}
#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------

#- Por ejemplo estamos en server_01::/home/rct/www
#- Debera crear  : server_02::/home/rct/www

USUARIO_CONEXION=${1}
SERVER=${2}
PORT=${3}
RUTA_ORIGEN=${4}

#-Almacenamos la ruta actual para poder volver
RUTA_ACTUAL=${PWD}

if [ "${USUARIO_CONEXION}" == "" ]; then
## Activamos un usuario por defecto
USUARIO_CONEXION=ibm
fi  


if [ "${SERVER}" == "" ]; then
##	SERVER=ibrqx
SERVER=core6
fi  

if [ "${PORT}" == "" ]; then
## Activamos un puerto por defecto
##	PORT=65533
PORT=22
fi  

if [ "${RUTA_ORIGEN}" == "" ]; then
#- Este ajuste implica sincronismo
#- Ambas rutas apuntaran a lo mismo
RUTA_ORIGEN=${RUTA_ACTUAL}
fi  

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${USUARIO_CONEXION}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt czf_live_to_server "[usuario] [servidor] [puerto] [origen] [destino]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Igual hay que preparar primero la ruta

fullpath ${RUTA_ORIGEN}
EXITCODE_fullpath=$?
RUTA_COMPLETA_ORIGEN=${SALIDA_fullpath}

RUTA_COMPLETA_DESTINO="$(dirname ${SALIDA_fullpath} )/"

## echo "Ruta Origen  : ${RUTA_COMPLETA_ORIGEN}  "
## echo "Ruta Destino : ${RUTA_COMPLETA_DESTINO} "

#-Funciona si es una carpeta pero no si es un archivo

czf_path_to_server ${USUARIO_CONEXION} ${SERVER} ${PORT} ${RUTA_COMPLETA_ORIGEN} ${RUTA_COMPLETA_DESTINO}

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
