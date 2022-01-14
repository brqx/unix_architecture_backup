#!/usr/bin/bash
#-------------------------------------------------------------------
# Funciones Especificas Entornos Unix - Brqz - I+D
# BRQX NG - Rct - 2007
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.0"          #  Version del Script actual
FECHA_SCRIPT="Septiembre 2007"
#-==================================================================
# * Queremos como objetivo que cambie el archivo correspondiente al generico
#+ Funciones:

#- Funcion Changing / Testing Simuadores
#-- Recive como parametro :
#-- 1. Sistema pasado		 : HDS - SCME - Etc
#-- 2. Codigo pasado (2 cifras)  : 02 
#-- 3. Tipo de Diagnostico : D - E
#-- 4. Segundo Codigo(2 cifras)  : 02 
sch()
{

SISTEMA_PASADO=$1
CODIGO_1_PASADO=$2
TIPO_DIAGNOSTICO=$3
CODIGO_2_PASADO=$4
ARCHIVO_GENERICO=respuesta_generica.xml

#ARCHIVO_PRUEBA=HDS.0002.D0003.xml

ARCHIVO_SOLICITADO=${SISTEMA_PASADO}.00${CODIGO_1_PASADO}.${TIPO_DIAGNOSTICO}00${CODIGO_2_PASADO}.xml

clear 

echo "Se va a copiar el archivo ${ARCHIVO_SOLICITADO}"

cp ${ARCHIVO_SOLICITADO} ${ARCHIVO_GENERICO}

echo "=============================================================="
echo "Simulador ${SISTEMA_PASADO} listo para ejecutar ${ARCHIVO_SOLICITADO}"
echo "--------------------------------------------------------------"

echo "-- 1. Sistema pasado            : HDS - SCME - Etc"
echo "-- 2. Codigo pasado (2 cifras)  : 02 "
echo "-- 3. Tipo de Diagnostico       : D - E"
echo "-- 4. Segundo Codigo(2 cifras)  : 02 "

echo "=============================================================="

}

