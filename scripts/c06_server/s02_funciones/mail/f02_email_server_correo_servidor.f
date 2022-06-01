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
CONCEPT_ARQUETIPO_04="servicios"
CONCEPT_VARIANTE_04=""
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- check_server_services_on
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- full_ckrun_services - enviar_correo_informacion_servicios
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Comprobacion arranque correcto servicios
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T linux server sure seguro checking test start check
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [-?]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E check_server_services_on  	-- Comprobacion arranque correcto servicios
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

check_server_services_on()
{
IS_check_server_services_on="Comprobacion de arranque servicios del servidor de forma correcta"
INFO_SCRIPT=${IS_check_server_services_on}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_check_server_services_on=${INFO_SCRIPT}

FICHERO_SERVICIOS=${1}

#-Inicializamos las variables para que no falle la suma
SALIDA_check_server_services_on=0
SALIDA_start_service=0

NOMBRE_SCRIPT_check_server_services_on=check_server_services_on
PARAMETROS_SCRIPT_check_server_services_on="[-?]"

if [ "${FICHERO_SERVICIOS}" == "" ]; then
FICHERO_SERVICIOS=${RS_SERV}zservicios_servidor_cpanel.dat
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${FICHERO_SERVICIOS}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_check_server_services_on} ${PARAMETROS_SCRIPT_check_server_services_on}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar servicios arrancados
#-- [2] Enviar correo confirmacion arranque servicios
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
full_ckrun_services ${FICHERO_SERVICIOS}
SALIDA_check_server_services_on=${SALIDA_full_ckrun_services}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_full_ckrun_services}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio chequeo inicio completa de servicios
#----====----====----====----====----====----====----====----====---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
enviar_correo_informacion_servicios
SALIDA_check_server_services_on=${SALIDA_enviar_correo_informacion_servicios}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_full_ckrun_services}" == "0" ] ; then
#------======------======------======------======------======------=
#----- [2] Inicio envio correo chequeo
#------======------======------======------======------======------=

MOTIVO_FUNCION="Servicios iniciados correctamente. Correo enviado."

else

MOTIVO_FUNCION="Error enviando correo"

#------======------======------======------======------======------=
#----- [2] Fin envio correo chequeo
#------======------======------======------======------======------=
fi
else

MOTIVO_FUNCION="Error al comprobar servicios arrancados"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin chequeo parada completa de servicios
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_check_server_services_on}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_check_server_services_on}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_check_server_services_on}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_check_server_services_on}
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

