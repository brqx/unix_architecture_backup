#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Julio 2012"
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
#-- full_restart_server
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Inicia un servidor
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T linux restart server
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [-?]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E full_restart_server  	-- Inicio completo del servidor
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

full_restart_server()
{
IS_full_restart_server="Inicia servidor"
INFO_SCRIPT=${IS_full_restart_server}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_full_restart_server=${INFO_SCRIPT}

ID_WAS=${1}

SALIDA_full_restart_server=0

NOMBRE_SCRIPT_full_restart_server=full_restart_server
PARAMETROS_SCRIPT_full_restart_server="[-?]"

if [ "${ID_WAS}" == "" ]; then
	ID_WAS=soa7a
fi  

if [ "${FICHERO}" == "" ]; then
FICHERO=${RS_CONN}zwas_noproxy_login.dat
fi

if [ "${SEP}" == "" ]; then
SEP=":"
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${ID_WAS}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_full_restart_server} ${PARAMETROS_SCRIPT_full_restart_server}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Iniciar servicios - esta parte se debe hacer sola
#-- [2] Comprobar inico correcto
#-- [3] Enviar correo con informacion de estado
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
full_restart_services 
SALIDA_full_restart_server=${SALIDA_full_restart_services}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_full_rerestart_services}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio correcto de los servicios
#----====----====----====----====----====----====----====----====---

#-Chequea y envia correo correspondiente

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
check_server_services
SALIDA_full_restart_server=${SALIDA_check_server_services}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_check_server_services}" == "0" ] ; then
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [2] Inicio comprobacion servicios
#-----=====-----=====-----=====-----=====-----=====-----=====-----==

MOTIVO_FUNCION="Inicio Correcto. Chequeo correcto."
PARAMETROS_MOTIVO_01="Servidor    : ${SERVER}"

else

MOTIVO_FUNCION="Error en el chequeo de los servicios."
#-Los parametros han debido ser identificados previamente en el chequeo del servidor

#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [2] Inicio comprobacion servicios
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
fi
else

MOTIVO_FUNCION="Error en el reinicio de los servicios"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin Carga parametros Was
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_full_restart_server}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_full_restart_server}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_full_restart_server}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_full_restart_server}
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

