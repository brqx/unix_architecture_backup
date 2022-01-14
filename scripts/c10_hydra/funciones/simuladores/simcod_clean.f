#!/usr/bin/ksh
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
simcod_clean()
{
ARCHIVO_GENERICO=$1    ;
TIPO_ERROR=$2      ;

NUM_LINEAS=1           ;

#- Conseguimos el Codigo del Simulador

CODIGO_SIMULADOR=`cat ${ARCHIVO_GENERICO} | grep ${TIPO_ERROR}  \
| cut -d ">" -f2 | cut -d "<" -f1  `            ;

if [ "$CODIGO_SIMULADOR" == ""  ] 
then
NUM_LINEAS=0    
fi

export CODIGO_SIMULADOR NUM_LINEAS TIPO_ERROR	;
}
