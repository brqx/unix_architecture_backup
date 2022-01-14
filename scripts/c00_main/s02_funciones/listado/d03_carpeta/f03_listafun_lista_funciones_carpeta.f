#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 5.2"          #  Version del Script actual
FECHA_SCRIPT="Junio 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_MOLDE="funcion"
CONCEPT_ARQUETIPO="listado"
CONCEPT_LEVEL="Script $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-==================================================================
#+ Funciones definidos:
#-------------------------------------------------------------------
#-- listafun - listapath - listacort
#-====----========----========----========----========----========--
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lista las funciones existentes en la ruta indicada
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T listado funciones ruta actual
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P EXTENSION [FILTRO]
#-------------------------------------------------------------------
#-- Ejemplos :
#-====----========----========----========----========----========--
#E listafun  - lista las funciones que hay en la ruta
#-==================================================================

#-Lista las funciones pasando una carpeta
#-Conseguimos salida bonita con column
listafun()
{
IS_listafun="Lista los nombres de las funciones de la ruta indicada"
INFO_SCRIPT=${IS_listafun}

#- Funciona de forma distinta si hay un sólo fichero o N ficheros
NUM_FICHEROS=$( ls -1 | wc -l )

#- Obtenemos los nombres de las funciones
cont_f=0
for i in $( find $PWD -type f | xargs grep "()$" )
do
#- No funciona porque cada fichero puede tener N funciones
#- Tenemos una salida como la siguiente (que contempla todas las funciones : 
# /home/ibm/scripts_ibm/scripts/c00_main/s02_funciones/acceso/direct/f01_cdd.f:cdd()

#- Sacamos la funcion y el archivo
#- Consideramos el caso de 1 fichero

if [ ${NUM_FICHEROS} -gt 1 ] ; then
FUNCION=$( echo $i | cut -d ":" -f2 | cut -d "(" -f1 )
FICHERO=$( echo $i  | cut -d ":" -f1 )
else
#- Caso particular para grep en el caso de un unico fichero
FUNCION=$i
FICHERO=$(find $PWD -type f )
fi


FUNCI[$cont_f]=${FUNCION}
DESCRI[$cont_f]=$( cat ${FICHERO} | egrep "^IS_${FUNCION}=" | cut -d "\"" -f2  | tr " " "_" )

let cont_f++
done

cont2=0
while [ $cont2 -lt $cont_f ]
do
echo "${FUNCI[$cont2]} :: ${DESCRI[$cont2]}  "

let cont2++

done | column -t -s " " | tr "_" " "

}

#-------------------------------------------------------------------
listapat()
{
IS_listapat="Lista ruta completa de las funciones"
INFO_SCRIPT=${IS_listapat}

#- Funciona de forma distinta si hay un sólo fichero o N ficheros
NUM_FICHEROS=$( ls -1 | wc -l )

if [ ${NUM_FICHEROS} -gt 1 ] ; then
find $PWD -type f | xargs grep "()$" | cut -d "(" -f1

else
FUNCION=$( find $PWD -type f | xargs  grep "()$" | cut -d "(" -f1 )
#- Ahora hay que sacar la ruta
RUTA=$( find $PWD -type f )

echo "${RUTA}:${FUNCION}"
fi
}

#-------------------------------------------------------------------
listacor()
{
IS_listacor="Lista ruta parcial de las funciones"
INFO_SCRIPT=${IS_listacor}

find . -type f | xargs grep "()$" | cut -d "(" -f1

}


#-------------------------------------------------------------------
#+ Sistema de trazado N4 - desactivado
#-------------------------------------------------------------------
#N4# echo "$LEVEL_NIVEL	-	Ejecutadas $CONCEPT_LEVEL"
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================
