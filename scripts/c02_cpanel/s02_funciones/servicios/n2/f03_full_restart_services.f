#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Noviembre 2012"
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
#-- full_restart_services
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- full_stop_services - full_start_services
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Reinicia los servicios del servidor
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T restart server services reiniciar servicios
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [FICHERO_SERVICIOS]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E full_restart_services  	-- Reinicia servicios del servidor
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

full_restart_services()
{
IS_full_restart_services="Reinicia servicios del servidor"
INFO_SCRIPT=${IS_full_restart_services}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_full_restart_services=${INFO_SCRIPT}

FICHERO_SERVICIOS=${1}

#-Inicializamos las variables para que no falle la suma
SALIDA_full_restart_services=0

NOMBRE_SCRIPT_full_restart_services=full_restart_services
PARAMETROS_SCRIPT_full_restart_services="[FICHERO_SERVICIOS]"

if [ "${FICHERO_SERVICIOS}" == "" ]; then
FICHERO_SERVICIOS=${RS_SERV}zservicios_servidor_cpanel.dat
fi



#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${FICHERO_SERVICIOS}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_full_restart_services} ${PARAMETROS_SCRIPT_full_restart_services}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Parar los servicios
#-- [2] Arrancar servicios
#-- [3] Recopilar informacion estado
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
full_stop_services
SALIDA_full_restart_services=${SALIDA_full_stop_services}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

## echo "Salida parada : ${SALIDA_full_stop_services}"

if [ "${SALIDA_full_stop_services}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio chequeo parada completa de servicios
#----====----====----====----====----====----====----====----====---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
full_start_services
SALIDA_full_restart_services=${SALIDA_full_start_services}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

## echo "Salida arranque : ${SALIDA_full_start_services}"

if [ "${SALIDA_full_start_services}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [2] Inicio chequeo arranque completo de servicios
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Servicios reiniciados correctamente"

else

MOTIVO_FUNCION="Algun servicio no se ha arrancado correctamente"

#--------========--------========--------========--------========---
#----- [2] Fin chequeo parada completa de servicios
#--------========--------========--------========--------========---
fi
else

MOTIVO_FUNCION="Algun servicio no se ha parado correctamente"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin chequeo parada completa de servicios
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_full_restart_services}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_full_restart_services}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_full_restart_services}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_full_restart_services}
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

