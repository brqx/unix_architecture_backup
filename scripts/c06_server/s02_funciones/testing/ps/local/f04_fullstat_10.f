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
#- fullstat	  : Inserta en varios archivos la información del sistema
#		    con objeto de sacar luego estadísticas
#-==================================================================
#+ Requerimientos:
#-------------------------------------------------------------------
#- instancias_out : Va guardando las instancias de apache
#- freemem_out    : Almacenamos la memoria del sistema
#- carga_out      : Guardamos la carga actual del sistema
#-------------------------------------------------------------------

fullstat()
{
TIEMPO=$1
SELECTOR=$2


# Por defecto 10 ejecucciones
if [ "$TIEMPO" == "" ] ;  then
TIEMPO=10
fi

#Convertimos el tiempo en segundos

TIEMPO_SEGUNDOS=$(expr ${TIEMPO} \* 60);

echo " "
echo "------------------------------------------------"
echo "Control des sistema V 1.0"
echo "=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--"
echo "PROCESOS - MEMORIA - CARGA cada ${TIEMPO} segundos"
echo "------------------------------------------------"

CONT=0;

while true
do

#- Llamamos a los procesos
instancias_apache_out ${SELECTOR};
#- Llamamos a la memoria
freemem_out ${SELECTOR};
#- Llamamos a la carga
carga_out ${SELECTOR};

sleep $TIEMPO
#echo "Test $CONT"
CONT=`expr ${CONT} + 1`;
done

}


