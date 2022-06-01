#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.5" #  Version del Script actual
FECHA_SCRIPT="Febrero 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="websphere"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="proceso"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- fix_wsdl_endpoint
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- linea_normal - linea_alterna - linea_caracter
#-------------------------------------------------------------------
#-- WEBSPHERE_APPS
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lista los perfiles en el entorno websphere indicado ajustando urls
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T ver informacion wsdl endpoint ajustado servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P SERVICIO [SERVIDOR] [PUERTO]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E fix_wsdl_endpoint ARQ_GesSolPres_SMED	--	Ver el endpoint del wsdl ajustado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Mini alias fixwsdl

fix_wsdl_endpoint()
{
IS_fix_wsdl_endpoint="Muestra el endpoint del servicio indicado ajustado al servidor"
INFO_SCRIPT=${IS_fix_wsdl_endpoint}

SERVICIO_PASADO=${1}
SERVIDOR_PASADO=${2}
PUERTO_PASADO=${3}

if [ "${SERVIDOR_PASADO}" == "" ]; then
SERVIDOR_PASADO=les000900202
fi

if [ "${PUERTO_PASADO}" == "" ]; then
PUERTO_PASADO=9081
fi


if [ "${SERVICIO_PASADO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt fix_wsdl_endpoint "Servicio Pasado"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-Mostramos los servicios - Habra que presentarle una cabecera pero eso ya tomorrow
ver_wsdl_endpoint "${SERVICIO_PASADO}" | sed "s/localhost/${SERVIDOR_PASADO}/g" | sed "s/9080/${PUERTO_PASADO}/g"

#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi
}

#-------------------------------------------------------------------
#+ Sistema de trazado N4 - desactivado
#-------------------------------------------------------------------
#N4# echo "$LEVEL_NIVEL	-	Ejecutadas $CONCEPT_LEVEL"
#-------------------------------------------------------------------

