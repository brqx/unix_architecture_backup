#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Octubre 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="cpanel"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="servidores"
CONCEPT_VARIANTE_04=""
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- full_stop_services_server
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- stop_service_seguro
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Para completamente los servicios de arquitectura del servidor
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T parada servicios servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [-?]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E full_stop_services_server  	-- Parada completa de los servicios
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

full_stop_services_server()
{
IS_full_stop_services_server="Para servicios del servidor de forma segura y comprobando"
INFO_SCRIPT=${IS_full_stop_services_server}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_full_stop_services_server=${INFO_SCRIPT}

ID_WAS=${1}

SALIDA_full_stop_services_server=0

NOMBRE_SCRIPT_full_stop_services_server=full_stop_services_server
PARAMETROS_SCRIPT_full_stop_services_server="[-?]"


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${ID_WAS}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_full_stop_services_server} ${PARAMETROS_SCRIPT_full_stop_services_server}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Conocer los servicios
#-- [2] Parar los servicios
#--------========--------========--------========--------========---

#-Aqui vaciaremos los logs ya sean de Mysql, Mongodb u otra
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
full_stop_services
SALIDA_full_stop_services_server=${SALIDA_full_stop_services}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_full_stop_services}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio chequeo logs BBDD
#----====----====----====----====----====----====----====----====---

MOTIVO_FUNCION="Servicios parados correctamente"

else

MOTIVO_FUNCION="Error al parar algun servicio"

#----====----====----====----====----====----====----====----====---
#----- [1] Inicio chequeo logs BBDD
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_full_stop_services_server}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_full_stop_services_server}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_full_stop_services_server}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_full_stop_services_server}
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

