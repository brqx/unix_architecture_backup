#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.1"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="alias"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Script ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- cf_path_to_arqserver
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - cf_sync_to_server - ssh_mkdir - ssh_lndir - ssh_rmdir
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
#E cf_path_to_arqserver ibm core 22 -- Sincroniza la ruta actual contra core
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Posible alias cfs
cf_path_to_arqserver()
{
IS_cf_path_to_arqserver="Copia ficheros sincronizando la ruta actual. No respeta los enlaces"
INFO_SCRIPT=${IS_cf_path_to_arqserver}


##USUARIO_CONEXION=root
#- Queremos lograr : 
# scp -r  ARQOS ricabel@core7a:/opt/bibliotecas_arquitectura/arqos/ARQOS
# 

USUARIO_CONEXION=${1}
SERVER=${2}
PORT=${3}
RUTA_DESTINO=${4}
FICHEROS=${5}
VERSION=${6}

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

if [ "${RUTA_DESTINO}" == "" ]; then
## Activamos un puerto por defecto
	RUTA_DESTINO=${ARQV2}
fi  

#- Debemos asegurarnos primero que hay algo que copiar

if [ "${FICHEROS}" == "" ]; then

	USUARIO_CONEXION="-?"
fi

if [ "${VERSION}" == "" ]; then

	VERSION=${VERSION_ARQOS}
fi


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${USUARIO_CONEXION}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt cf_path_to_arqserver "[usuario] [servidor] [puerto] origen destino [version] "

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-Una vez que funcione hacer el cambio :
##ENLACE=lastversion
##cf_path_to_arqserver_link ${USUARIO_CONEXION} ${SERVER} PORT} ${RUTA_DESTINO} ${FICHEROS} ${VERSION} ${ENLACE}



RUTA_VERSION=${RUTA_DESTINO}/${VERSION}

RUTA_FINAL_DESTINO=${RUTA_DESTINO}/${FICHEROS}

#-Aqui debe venir el parametro
RUTA_LASTVERSION=${RUTA_DESTINO}/lastversion

#-Si se lanza desde bibliotecas_maven va a funcionar 
#-Si lo invocamos desde otra ruta tentremos que ajustar esta variable
RUTA_ACTUAL=${PWD}/${FICHEROS}

echo "Ruta destino : ${RUTA_DESTINO} "
echo "Ficheros     : ${PWD}/${FICHEROS}  "

#-Esta funcion ha cambiado

#-Estrategia : cf - unlink - rm - mv - ln - ch


#- 1.Copiamos

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
cf_path_to_server ${USUARIO_CONEXION} ${SERVER} ${PORT} ${RUTA_ACTUAL} ${RUTA_DESTINO}  
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#- 2.Desenlazamos

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
ssh_unlink ${USUARIO_CONEXION} ${SERVER} ${PORT} ${RUTA_LASTVERSION}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#- 3.Borramos

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
ssh_rmdir ${USUARIO_CONEXION} ${SERVER} ${PORT} ${RUTA_VERSION}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#- 4.Movemos

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
ssh_mvdir ${USUARIO_CONEXION} ${SERVER} ${PORT} ${RUTA_FINAL_DESTINO} ${RUTA_VERSION}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#- 5.Enlazamos

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
ssh_lndir ${USUARIO_CONEXION} ${SERVER} ${PORT} ${RUTA_VERSION} ${RUTA_LASTVERSION}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#- 6.Cambiamos permisos

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
ssh_chmod ${USUARIO_CONEXION} ${SERVER} ${PORT} ${RUTA_DESTINO} 755
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_cf_path_to_arqserver}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_cf_path_to_arqserver}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_cf_path_to_arqserver}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


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
