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
#-- listafuna 
#-====----========----========----========----========----========--
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lista las funciones existentes en un archivo
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T listado funciones archivo
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P EXTENSION [FILTRO]
#-------------------------------------------------------------------
#-- Ejemplos :
#-====----========----========----========----========----========--
#E listafuna  /ruta_archivo_funciones
#-==================================================================

#-Lista las funciones pasando un archivo
listafuna()
{
IS_listafuna="Lista los nombres de las funciones de la ruta indicada"
INFO_SCRIPT=${IS_listafuna}

ARCHIVO=$1

if [ "${ARCHIVO}" != "" ] ; then

#- Obtenemos los nombres de las funciones

LISTA_FUNCIONES=$( cat ${ARCHIVO} | grep "()$"  | cut -d "(" -f1 | tr "\n" " " )

cont_f=0
#-Iteramos por cada funcion en el archivo
for i in ${LISTA_FUNCIONES} ; do

FUNCION=$i

FUNCI[$cont_f]=${FUNCION}
DESCRI[$cont_f]=$( cat ${ARCHIVO} | egrep "^IS_${FUNCION}=" | cut -d "\"" -f2  | tr " " "_" )

let cont_f++

done

cont2=0
while [ $cont2 -lt $cont_f ]
do
echo "${FUNCI[$cont2]} :: ${DESCRI[$cont2]}  "

let cont2++

done | column -t -s " " | tr "_" " "

else

e_pmi listafuna "Ruta_funcion"

fi

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
