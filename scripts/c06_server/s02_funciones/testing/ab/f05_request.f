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
#- dame_peticiones
#- peticiones_out
#
#-==================================================================
#+ Explicacion:
#-------------------------------------------------------------------

# Sacamos tres ficheros de salida
#
#-s: Por defecto sacamos un resumen
#-e: Sacamos un listado 
#-g: GNU plot output


#-------------------------------------------------------------------
#-e csv-file
#-==================================================================
#
#-- Tenemos siempre 100 lineas, se va dividiendo el porcentaje total en 
#   milisegundos y se va almacenando la carga
#
#-- Ejemplo Percentage served,Time in ms
#		0	,	5.155000e+03
#		1	,	5.161000e+03
#
#
#-------------------------------------------------------------------
#-g gnuplot-file
#-==================================================================
#-- Tenemos una linea por cada peticion , por tanto su resultado es variable
#
#-- Fuente : 
#	starttime \t seconds\t ctime\t dtime \t ttime \t wait

#-- Ejemplo Real:
#	starttime  seconds	ctime	dtime	ttime	wait
#	22:09:04   1226632144	1	2	3	2
#	22:09:05   1226632145	3	2	5	2
#
#-- Ejemplo Tratado: (Hora - Diferencia - Cpu - total - Espera )

#	17:40:50 181 4037 4218 2484
#	17:40:50 181 4154 4335 3635
#	17:40:50 177 4909 5086 3986
#	17:40:50 181 5773 5954 5281

#--      long starttime;             /* start time of connection in seconds since Jan. 1, 1970 */
#--      long waittime;              /* Between writing request and reading response */
#--      long ctime;                 /* time in ms to connect */
#--      long time;                  /* time in ms for connection */

#-- ab -c1000 -n10 [url]	command to simulate 10 clients sending a total of 1000 http requests to a server.


dame_peticiones()
{
PETICIONES=$1
CONCURRENCIA=$2
REFERENCIA=$3
URL=$4

# URL por defecto certi.everis/node/1
if [ "$URL" == "" ] ;  then
URL="certi.everis/node/1"
fi

# Referencia por defecto : ARCHIVO
if [ "$REFERENCIA" == "" ] ;  then
REFERENCIA="ARCHIVO"
fi


# Por defecto 10 ejecucciones
if [ "$PETICIONES" == "" ] ;  then
PETICIONES=10
fi

# Por defecto 10 ejecucciones
if [ "$CONCURRENCIA" == "" ] ;  then
CONCURRENCIA=5
fi



# Antes de llamar a ab, establecemos el formato de la fecha de salida

set timefmt '%H:%M:%S'

# Llamamos a ab con salida HTML

alias ab='/home/httpd-2.0.52/support/ab'

/home/httpd-2.0.52/support/ab -S -d -w -n ${PETICIONES} \
-c ${CONCURRENCIA} -e ${REFERENCIA}_peticiones_e \
-g ${REFERENCIA}_peticiones_g http://${URL} > ${REFERENCIA}_peticiones_s


# Preparacion archivo E

cat ${REFERENCIA}_peticiones_e < transf > ${REFERENCIA}_peticiones_esal
mv ${REFERENCIA}_peticiones_esal ${REFERENCIA}_peticiones_e

#=-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--#
# TRATAMIENTO G - PORCENTAJES
#=------------------------------------------------------------------------------------------------#

cat ${REFERENCIA}_peticiones_e < transf > ${REFERENCIA}_peticiones_esal
mv ${REFERENCIA}_peticiones_esal ${REFERENCIA}_peticiones_e



#=------------------------------------------------------------------------------------------------#
echo "Tupla prueba AB :"

}


peticiones_out()
{
RUTA_OUT=$PWD

#Se le pasa un identificativo - si no se pasa nada se pone de nombre archivo

ARCHIVO=$1

# Por defecto 10 ejecucciones
if [ "$ARCHIVO" == "" ] ;  then
ARCHIVO=archivo
fi

linea_carga=`uptime | tr -s " " `
CARGA_01_MIN=`echo $linea_carga |  cut -d " " -f10 | cut -d "," -f1`
CARGA_05_MIN=`echo $linea_carga |  cut -d " " -f11 | cut -d "," -f1`
CARGA_15_MIN=`echo $linea_carga |  cut -d " " -f12 | cut -d "," -f1`

HORA_ACTUAL=`date +%H_%M_%S`
echo "${HORA_ACTUAL}:${CARGA_01_MIN}" >> ${RUTA_OUT}/${ARCHIVO}_carga_sistema.dat

}


