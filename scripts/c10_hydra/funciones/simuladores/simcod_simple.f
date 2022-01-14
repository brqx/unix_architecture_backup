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
#-- No Recibe parametros :
#-- Actua en razon de la ruta actual buscando un archivo : respuesta_generica.xml
#-- Parseando el mismo en razon a una cadena : "cod_diagnostico" 
#
#- Ej : codigosim Fich_Xml Tipo_Error
#
simcod_simple()
{
ARCHIVO_GENERICO=$1
CADENA_BUSCADA=$2

CODIGO_SIM=`cat ${ARCHIVO_GENERICO} | grep ${CADENA_BUSCADA}  \
| cut -d ">" -f2 | cut -d "<" -f1  `            ;

NOMBRE_SIM=`dirname $PWD | cut -d "_" -f2`      ;

outsim_simple     ;
}

