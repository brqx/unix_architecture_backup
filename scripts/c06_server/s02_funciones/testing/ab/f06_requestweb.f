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
#- dame_peticiones_WEB
#
#-==================================================================
#+ Explicacion:
#-------------------------------------------------------------------

#- Lanzamos apache bench para obtener la tupla de salida de dicha petición
#- Lanzariamos N peticiones para conformar una agenda
#
#-s: Por defecto sacamos un resumen


#-------------------------------------------------------------------
#-s Salida general
#-==================================================================
#- Queremos la siguiente Tupla : 
# URL    : PETICIONES : CONCURRENCIA : TIEMPO TOTAL : TIEMPO_MIN : TIEMPO_AVG : TIEMPO_MAX
# node/1 : 2000       : 15           :  0,779S	    :	168	 :    204     :   244


dame_peticiones_web()
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

/home/httpd-2.0.52/support/ab -S -d -w -n ${PETICIONES} -c ${CONCURRENCIA} -e ${REFERENCIA}_peticiones_e -g ${REFERENCIA}_peticiones_g http://${URL} > ${REFERENCIA}_peticiones_s

#=------------------------------------------------------------------------------------------------#
# TRATAMIENTO TUPLA GENERAL
#=-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--#


TUPLA_TOTAL=`cat  ${REFERENCIA}_peticiones_s | grep "Time taken" | \
tr "bgcolor=white" " " | tr "<" " " | tr ">" " " | tr "/" " " | tr "[a-zA-Z]" " " | tr -s " " | \
cut -d " " -f5`

TIEMPO_TOTAL="`echo ${TUPLA_TOTAL} |cut -d "." -f1`,`echo ${TUPLA_TOTAL} | cut -d "." -f2 | cut -c1-3`"

COMPLETAS=`cat  ${REFERENCIA}_peticiones_s | grep Complete | \
tr "bgcolor=white" " " | tr "<" " " | tr ">" " " | tr "/" " " | tr "[a-zA-Z]" " " | tr -s " " | \
cut -d " " -f5`

TUPLA_TIEMPO=`cat  ${REFERENCIA}_peticiones_s | grep "Total:" | \
tr "bgcolor=white" " " | tr "<" " " | tr ">" " " | tr "/" " " | tr "[a-zA-Z]" " " | tr -s " "`

TIEMPO_MIN="`echo ${TUPLA_TIEMPO} | cut -d " " -f2 | cut -d "." -f1`,`echo ${TUPLA_TIEMPO} | cut -d " " -f2 | cut -d "." -f2 | cut -c1-3`"  
TIEMPO_AVG="`echo ${TUPLA_TIEMPO} | cut -d " " -f3 | cut -d "." -f1`,`echo ${TUPLA_TIEMPO} | cut -d " " -f3 | cut -d "." -f2 | cut -c1-3`"  
TIEMPO_MAX="`echo ${TUPLA_TIEMPO} | cut -d " " -f4 | cut -d "." -f1`,`echo ${TUPLA_TIEMPO} | cut -d " " -f4 | cut -d "." -f2 | cut -c1-3`"  


#=-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--#
# TRATAMIENTO - FINAL
#=------------------------------------------------------------------------------------------------#

echo "Tupla prueba AB :\
${URL}:${PETICIONES}:${CONCURRENCIA}:${TIEMPO_TOTAL}s:${TIEMPO_MIN}ms:${TIEMPO_AVG}ms:${TIEMPO_MAX}ms"

}
