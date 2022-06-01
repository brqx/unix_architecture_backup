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
CONCEPT_MOLDE_05="funcion"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Script ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- cf_path_to_mav_frontal6b
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - cf_path_to_arqserver
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Actualiza la libreria maven en el servidor remoto
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T actualizar libreria ssh servidor remoto maven
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [libreria] version
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E cf_path_to_arq_core7b ARQOS 11_2 -- Actualiza la libreria con la version 11_2
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Posible alias cfs
cf_path_to_mav_frontal6b()
{
IS_cf_path_to_mav_frontal6b="Actualiza la libreria en el servidor Frontal 6b"
INFO_SCRIPT=${IS_cf_path_to_mav_frontal6b}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_cf_path_to_mav_frontal6b=${INFO_SCRIPT}


##Debe componer lo siguiente : 

# cf_path_to_arqserver ricabel core7b  22 
# /opt/bibliotecas_arquitectura/MAPFRE_ARQOS_CORE_DIST  
# MAPFRE_ARQOS_CORE_DIST v11_2

LIBRERIA=${1}
VERSION=${2}

USUARIO_CONEXION=ibm
SERVER=frontal6b
PORT=22
RUTA_DESTINO=/opt/bibliotecas_maven/${LIBRERIA}

SALIDA_cf_path_to_mav_frontal6b=0

NOMBRE_SCRIPT_cf_path_to_mav_frontal6b=cf_path_to_mav_frontal6b
PARAMETROS_SCRIPT_lb_site_to_server_force="Libreria [Version]"


#- Debemos asegurarnos primero que hay algo que copiar

if [ "${LIBRERIA}" == "" ] ; then
	USUARIO_CONEXION="-?"
fi

if [ "${VERSION}" == "" ] ; then
	VERSION=${VERSION_ARQOS}
fi


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${USUARIO_CONEXION}" == "-?" ] ; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_cf_path_to_mav_frontal6b} ${PARAMETROS_SCRIPT_cf_path_to_mav_frontal6b}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

cf_path_to_arqserver ${USUARIO_CONEXION} ${SERVER} ${PORT} ${RUTA_DESTINO} ${LIBRERIA} ${VERSION}

#-Falta gestionar la salida de arqserver

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_lb_site_to_server_force}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_lb_site_to_server_force}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_lb_site_to_server_force}

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
