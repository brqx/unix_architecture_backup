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
#-Ej: testmem 10 100
#
#- Chequea la memoria del sistema cada 10 minutos
#-==================================================================
#+ Requerimientos:
#-------------------------------------------------------------------
#- Utiliza freemem
#-------------------------------------------------------------------

testmem_finito()
{
TIEMPO=$1
EJECUCIONES=$2
SELECTOR=$3

# Por defecto 10 ejecucciones 
if [ "$EJECUCIONES" == "" ] ;  then EJECUCIONES=10
fi

# Por defecto 10 ejecucciones
if [ "$TIEMPO" == "" ] ;  then
TIEMPO=10
fi

#Convertimos el tiempo en segundos

TIEMPO_SEGUNDOS=`expr ${TIEMPO} \* 60`;

echo "------------------------------------------------"
echo "Control de memoria V 1.0"
echo "=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--"
echo "${EJECUCIONES} ejecucciones - cada ${TIEMPO} segundos"
echo "------------------------------------------------"

CONT=0;

while [ "${CONT}" != "${EJECUCIONES}" ]
do

freemem_out ${SELECTOR};
sleep $TIEMPO
echo "Test $CONT"
CONT=`expr ${CONT} + 1`;
done

}


