#!/usr/bin/bash
#-------------------------------------------------------------------
# Funciones Especificas Entornos Unix - Brqz - I+D
# BRQX NG - Rct - 2007
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.0"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2007"
#-==================================================================
# * Queremos como objetivo que cambie el archivo correspondiente al generico
#+ Funciones:

#- Funcion Changing / Testing Simuadores
#-- Recive como parametro :
#-- 1. Sistema pasado		 : HDN
#-- 2. Codigo pasado (2 cifras)  : 02 

schhdn()
{
##- Asumimos que se le pasa HDN

SISTEMA_PASADO=HDN
CODIGO_PASADO=$1

ARCHIVO_GENERICO=respuesta_generica.xml

#ARCHIVO_PRUEBA=HDN.9560.xml

##ARCHIVO_SOLICITADO=${SISTEMA_PASADO}.${CODIGO_PASADO}.xml

#-- Quitamos el HDN
ARCHIVO_SOLICITADO=${CODIGO_PASADO}.xml


clear 

echo "Se va a copiar el archivo ${ARCHIVO_SOLICITADO}"

cp ./${ARCHIVO_SOLICITADO} ./${ARCHIVO_GENERICO}

echo "=============================================================="
echo "Simulador ${SISTEMA_PASADO} listo para ejecutar ${ARCHIVO_SOLICITADO}"
echo "--------------------------------------------------------------"

echo "-- 1. Sistema pasado            : HDN "
echo "-- 2. Codigo pasado (4 cifras)  : 9002"

echo "=============================================================="

}

