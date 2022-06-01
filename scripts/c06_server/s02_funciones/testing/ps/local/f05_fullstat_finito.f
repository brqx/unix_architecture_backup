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
#- fullstat_finito  : Inserta en varios archivos la información del sistema
#		      con objeto de sacar luego estadísticas
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#+ Parametros:
#-------------------------------------------------------------------
#- [1] - Tiempo entre cada ejecuccion
#- [2] - Numero de ejecuciones
#- [3] - Fichero donde se almacenan los datos de salida
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#+ Requerimientos:
#-------------------------------------------------------------------
#- instancias_out : Va guardando las instancias de apache
#- freemem_out    : Almacenamos la memoria del sistema
#- carga_out      : Guardamos la carga actual del sistema
#-------------------------------------------------------------------

fullstat_finito()
{
TIEMPO=$1
EJECUCIONES=$2
SELECTOR=$3


# Por defecto 10 ejecucciones
if [ "$TIEMPO" == "" ] ;  then
TIEMPO=10
fi

# Por defecto 10 ejecucciones 
if [ "$EJECUCIONES" == "" ] ;  then EJECUCIONES=10
fi

#Convertimos el tiempo en segundos

TIEMPO_SEGUNDOS=`expr ${TIEMPO} \* 60`;

echo " "
echo "------------------------------------------------"
echo "Control Del Sistema V 1.0"
echo "=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--"
echo "PROCESOS - MEMORIA - CARGA cada ${TIEMPO} segundos"
echo "------------------------------------------------"

CONT=0;

while [ "${CONT}" != "${EJECUCIONES}" ]
do

#- Llamamos a los procesos
instancias_out ${SELECTOR};
#- Llamamos a la memoria
freemem_out ${SELECTOR};
#- Llamamos a la carga
carga_out ${SELECTOR};

sleep $TIEMPO
#echo "Test $CONT"
CONT=`expr ${CONT} + 1`;
done

}


