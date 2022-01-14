#!/usr/bin/bash
#-------------------------------------------------------------------
# Funciones Especificas Entornos Unix - Brqz - I+D
# BRQX NG - Rct - 2007
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.0"          #  Version del Script actual
FECHA_SCRIPT="Septiembre 2007"
#-==================================================================
#+ Funciones:

#-- No Recibe parametros :
#-- Se encarga de procesar la salida de los simuladores, se basa en una serie de
#-- parametros ya establecidos.
#-- Parseando el mismo en razon a una cadena : "cod_diagnostico" 

#-- Require : codigosim
#-- Necesita variables : NOMBRE_SIMULADOR - TIPO_ERROR - CODIGO_SIMULADOR

outsim_clean()
{
###NOMBRE_SIMULADOR=$1			;
###TIPO_ERROR=$2				;
###CODIGO_SIMULACION=$3			;

echo "${NOMBRE_SIMULADOR} ==>  ${TIPO_ERROR} - : ${CODIGO_SIMULADOR}"
}

