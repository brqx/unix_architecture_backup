#!/usr/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2010
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Enero 2010"
#-==================================================================
#+ Funciones:
#-------------------------------------------------------------------
#-Ej: testload
#
#- Chequea la carga del sistema cada 10 minutos
#-==================================================================
#+ Requerimientos:
#-------------------------------------------------------------------
#- Utiliza dame_carga_sistema
#-------------------------------------------------------------------

testload()
{
TIEMPO=$1
EJECUCIONES=$2
SELECTOR=$3 

# Por defecto 10 ejecucciones
if [ "$EJECUCIONES" == "" ] ;  then
EJECUCIONES=10
fi

# Por defecto 10 segundos
if [ "$TIEMPO" == "" ] ;  then
TIEMPO=10
fi


#Convertimos el tiempo en segundos

TIEMPO_SEGUNDOS=`expr ${TIEMPO} \* 60`;

echo "------------------------------------------------"
echo "Control de carga V 1.0"
echo "=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--"
echo "${EJECUCIONES} ejecucciones - cada ${TIEMPO} segundos"
echo "------------------------------------------------"

CONT=0;

while true
do

dame_carga_sistema ${SELECTOR};
sleep $TIEMPO
echo "Test $CONT"
CONT=`expr ${CONT} + 1`;
done

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



