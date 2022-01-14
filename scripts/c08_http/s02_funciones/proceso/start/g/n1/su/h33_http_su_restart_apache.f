#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="2.6" #  Version del Script actual
FECHA_SCRIPT="Marzo 2013"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="cpanel"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="servicios"
CONCEPT_VARIANTE_04=""
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- http_su_restart_apache
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- codcat
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Inicia un servicio
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T start inicio servicio
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P SERVICIO
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E http_su_restart_apache s1 	-- Inicia el servicio indicado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

http_su_restart_apache()
{
IS_http_su_restart_apache="Inicia el servidor web apache"
INFO_SCRIPT=${IS_http_su_restart_apache}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_http_su_restart_apache=${INFO_SCRIPT}

#-Comando es un espacio por defecto
COMANDO="${1} ${2}"

SALIDA_http_su_restart_apache=0

#-Se trata de un texto de informacion a devolver al llamante
INFOSALIDA_http_su_restart_apache=""

NOMBRE_SCRIPT_http_su_restart_apache=http_su_restart_apache
PARAMETROS_SCRIPT_http_su_restart_apache="[-?]"


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${SERVICIO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_http_su_restart_apache} ${PARAMETROS_SCRIPT_http_su_restart_apache}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Lanzar comando de arranque
#-- [2] Comprobar que se ha iniciado e informar
#--------========--------========--------========--------========---

PARAMETROS_MOTIVO_01="Servicio    : ${SERVICIO}"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
http_su_stop_apache
SALIDA_http_su_restart_apache=${SALIDA_http_su_stop_apache}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_http_su_stop_apache}" != "0" ] ; then
#------======------======------======------======------======------=
#----- [1] Inicio chequeo stop
#------======------======------======------======------======------=

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
http_su_start_apache
SALIDA_http_su_restart_apache=${SALIDA_http_su_start_apache}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_http_su_start_apache}" != "0" ] ; then
#--------========--------========--------========--------========---
#----- [2] Inicio chequeo start
#--------========--------========--------========--------========---


MOTIVO_FUNCION="Servicio re-arrancado correctamente"

else

MOTIVO_FUNCION="Error al iniciar el servicio"

#------======------======------======------======------======------=
#----- [2] Fin chequeo start
#------======------======------======------======------======------=
fi
else

MOTIVO_FUNCION="Error al detener el servicio"

#------======------======------======------======------======------=
#----- [1] Fin chequeo stop
#------======------======------======------======------======------=
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_http_su_restart_apache}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_http_su_restart_apache}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_http_su_restart_apache}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
INFOSALIDA_http_su_restart_apache=${MOTIVO_FUNCION}
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_http_su_restart_apache}
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

