#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.1"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2016"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="funcion"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Script ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- pf_scp_to_server
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Copia ficheros a otro servidor de forma agil en ruta actual
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
#E pf_scp_to_server fich.dat ibrqx.com -- Copia fichero a ibrqx.com 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Mini alias pa
# Quiero automatizar ordenes como : 
# scp azucar_p50azucar_20160125.sql.tar.gz abrqx.com:$PWD/
pf_scp_to_server()
{
IS_pf_scp_to_server="Copia ficheros sincronizando la ruta actual. No respeta los enlaces"
INFO_SCRIPT=${IS_cf_to_server}


#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------

##USUARIO_CONEXION=root

SERVER=${1}
FILES=${2}
USUARIO_CONEXION=${3}
PORT=${4}

if [ "${USUARIO_CONEXION}" == "" ]; then
## Activamos un servidor por defecto
	USUARIO_CONEXION=root
##	SERVER=ibrqx
fi  


if [ "${SERVER}" == "" ]; then
## Activamos un servidor por defecto
	SERVER=pbrqx.com
fi  

#- No activamos puerto. Activar en casa

if [ "${PORT}" == "" ]; then
## Activamos un puerto por defecto
	PORT=22
##	PORT=65533
fi  

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${FILES}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt pf_scp_to_server "[server] [files] [user] [port] "

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

if [ "${FILES}" == "" ]; then
FILES="*"
fi

#- Copiara a la misma ruta
dest=${PWD}/ ;

echo "Copiando Desde : ${HOSTNAME}  ${FILES}"
echo "Hacia ruta     : ${SERVER}::${dest} : $PORT "

# Primero creamos la ruta

scp -r -P ${PORT} ${FILES}  ${USUARIO_CONEXION}@${SERVER}:${dest}

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
