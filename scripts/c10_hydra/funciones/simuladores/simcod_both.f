#!/usr/bin/bash
#-------------------------------------------------------------------
# Funciones Especificas Entornos Unix - Brqz - I+D
# BRQX NG - Rct - 2007
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.0"          #  Version del Script actual
FECHA_SCRIPT="Septiembre 2007"
#-==================================================================
# * Queremos como objetivo que obtenga el codigo del simulador actual
#+ Funciones:

#- Funcion Changing / Testing Simuadores
#-- Recibe parametros :
#-- Recibe el archivo generico y el tipo de error
#--  
#-- Devuelve el Nombre del simulador y el codigo de error configurado para tal 
#
#- Ej : codigosim Fich_Xml Tipo_Error
#
simcod_both()
{
ARCHIVO_GENERICO=$1
TIPO_ERROR=cod_diagnostico

NUM_LINEAS=0

simcod_clean ${ARCHIVO_GENERICO} ${TIPO_ERROR}

if [ $NUM_LINEAS = 0 ]
then
TIPO_ERROR=cod_error
##echo "Numero de lineas : $NUM_LINEAS"
simcod_clean ${ARCHIVO_GENERICO} ${TIPO_ERROR}
fi

export TIPO_ERROR
}

