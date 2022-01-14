#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2015
#-------------------------------------------------------------------
VERSION_SCRIPT="1.0.1" #  Version del Script actual
FECHA_SCRIPT="Junio 2015"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="server"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="mail"
CONCEPT_VARIANTE_04=""
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- system_email
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Envio mail 
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T envio mail send correos
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [SERVER] [TARGET] [clean or verbose] | [-?]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E system_email  	-- Envio mail a un servidor con arquitectura sendmail
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#Funcion de email a nivel de sistema sin adjuntos
#Deve permitir opcion limpia y opcion verbose
system_email()
{
IS_system_email="Envio de mail del estado de los servicios"
INFO_SCRIPT=${IS_system_email}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_system_email=${INFO_SCRIPT}

ENTRADA=${1}
SERVER_PASADO=${1}
TARGET_PASADO=${2}
CLEAN_OR_VERBOSE=${3}

INFOCLEAN=$(echo ${CLEAN_OR_VERBOSE:0:1} | tr "[A-Z]" "[a-z]" )

ISCLEAN=""		# Gestion de salida limpia - sin informacion adiccional
ISVERBOSE=""

#-Requiere que se hayan definido SERVER y TARGET (email)
if [ "${SERVER_PASADO}" != "" ] ; then
SERVER=${SERVER_PASADO}
fi

#-Si esta definido no pilla el segundo parametro
if [ "${TARGET_PASADO}" != "" ] ; then
TARGET=${TARGET_PASADO}
fi

#-Opcion limpia o verbose
if   [ "${INFOCLEAN}" == "c" ]					; then
ISCLEAN="Y"
elif [ "${INFOCLEAN}" == "v" ]					; then
#-Aqui igual puede ser un v
ISVERBOSE="Y"
elif [ "${CLEAN_OR_VERBOSE}" == ""  ]			; then
#-La salida es normal
ISCLEAN="N"
fi


if [ "${SERVER}" == ""  -o  "${TARGET}" == "" ] ; then
#-Si no se pasa o no estan definidos servidor o destino debe dar error
ENTRADA="-?"
fi

if [ "${ISVERBOSE}" == "Y" -a "${ISCLEAN}" == "Y" ]					; then
VERBOSE="-v"
else
VERBOSE=""
fi

#-Inicializamos las variables para que no falle la suma
SALIDA_system_email=0

NOMBRE_SCRIPT_system_email=system_email
PARAMETROS_SCRIPT_system_email="[SERVER] [TARGET] | [-?]"


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${ENTRADA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_system_email} ${PARAMETROS_SCRIPT_system_email}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Preparar lista de servicios
#-- [2] Enviar correo con servicios y su estado
#--------========--------========--------========--------========---

EMAIL_BODY="ALERT- Root Shell Access ${SERVER} on:  $(date) $(who)"
EMAIL_SUBJECT="Alert ${SERVER}: Root Access from $(who | cut -d'(' -f2 | cut -d')' -f1 )"

echo "${EMAIL_BODY}" | mail "${VERBOSE}" -s "${EMAIL_SUBJECT}" "${TARGET}"
SALIDA_mail=$?


if [ "${ISCLEAN}" != "Y" ] ; then

echo "Enviando email : "
echo "------------------------------------------------------"
echo "BODY           - ${EMAIL_BODY}" 
echo "SUBJECT        - ${EMAIL_SUBJECT}" 
echo "TARGET         - ${TARGET}"
echo "VERBOSE        - ${VERBOSE}"
echo "RETURN CODE    - ${SALIDA_mail}"
echo "------------------------------------------------------"

fi


if [ "${SALIDA_mail}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio chequeo envio correo
#----====----====----====----====----====----====----====----====---

MOTIVO_FUNCION="Correo enviado."

else

MOTIVO_FUNCION="Error enviando correo"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin chequeo envio correo
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_system_email}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_system_email}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_system_email}

#-Reportamos solo si no hemos pedido salida limpia

if [ "${ISCLEAN}" == "" ] ; then
e_pms 
fi


else
#- Si no se presenta se deben eliminar parametros del nivel actual

limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_system_email}
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

