#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.1"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="funcion"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Script ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- cf_sync_to_server
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Copia ficheros a otro servidor de forma sincronizada
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T copia ficheros ssh servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [usuario] [servidor] [puerto] [dest] ficheros 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E cf_sync_to_server ibm core 22 -- Sincroniza la ruta actual contra core
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Posible alias cfs
scpp_sync_to_server()
{
IS_cf_sync_to_server="Copia ficheros sincronizando la ruta actual. No respeta los enlaces"
INFO_SCRIPT=${IS_cf_to_server}


#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------

##USUARIO_CONEXION=root

USUARIO_CONEXION=${1}
SERVER=${2}
PORT=${3}

if [ "${USUARIO_CONEXION}" == "" ]; then
## Activamos un servidor por defecto
	USUARIO_CONEXION=ibm
##	SERVER=ibrqx
fi  


if [ "${SERVER}" == "" ]; then
## Activamos un servidor por defecto
	SERVER=frontal
##	SERVER=ibrqx
fi  

#- No activamos puerto. Activar en casa

if [ "${PORT}" == "" ]; then
## Activamos un puerto por defecto
	PORT=22
##	PORT=65533
fi  

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${USUARIO_CONEXION}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt cf_sync_to_server "[usuario] [servidor] [puerto] [dest] ficheros "

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------



#- Copiara a la misma ruta
src=${PWD};
dest=$( dirname ${PWD} );

echo "Copiando Desde : ${src} : ${PORT} "
echo "Hacia ruta     : ${SERVER}::${src} : $PORT "

# Primero creamos la ruta

scp -r -P ${PORT} ${src}  ${USUARIO_CONEXION}@${SERVER}:${dest}

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
