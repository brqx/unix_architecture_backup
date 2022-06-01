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
#-- restart_service
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- cleansys_completo
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Limpieza de logs del sistema y servicios
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T sistema system clean logs drupal services
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [-?]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E restart_service  	-- Limpieza de logs del servidor
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

restart_service()
{
IS_restart_service="Limpia los logs del servidor y sus servicios"
INFO_SCRIPT=${IS_restart_service}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_restart_service=${INFO_SCRIPT}

SERVICIO=${1}
COMANDO="${2} ${3}"

SALIDA_restart_service=0

NOMBRE_SCRIPT_restart_service=restart_service
PARAMETROS_SCRIPT_restart_service="[-?]"


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${SERVICIO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_restart_service} ${PARAMETROS_SCRIPT_restart_service}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Parada del servicio
#-- [2] Arranque del servicios
#--------========--------========--------========--------========---

#-Aqui paramos el servicio
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
stop_service ${SERVICE} "${COMANDO}"
SALIDA_restart_service=${SALIDA_stop_service}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

PARAMETROS_MOTIVO_01="Servicio    : ${SERVICIO}"
PARAMETROS_MOTIVO_02="Comando     : ${COMANDO}"

if [ "${SALIDA_stop_service}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio parada servicio
#----====----====----====----====----====----====----====----====---

#-Aqui paramos el servicio
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
start_service ${SERVICE} "${COMANDO}"
SALIDA_restart_service=${SALIDA_start_service}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_start_service}" == "0" ] ; then
#------======------======------======------======------======------=
#----- [2] Inicio arranque servicio
#------======------======------======------======------======------=

MOTIVO_FUNCION="Servicio reiniciado correctamente"

else

MOTIVO_FUNCION="Error al iniciar el servicio"

#------======------======------======------======------======------=
#----- [2] Inicio arranque servicio
#------======------======------======------======------======------=
fi
else

MOTIVO_FUNCION="Error al parar el servicio"


#----====----====----====----====----====----====----====----====---
#----- [1] Fin parada servicio
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_restart_service}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_restart_service}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_restart_service}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_restart_service}
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

