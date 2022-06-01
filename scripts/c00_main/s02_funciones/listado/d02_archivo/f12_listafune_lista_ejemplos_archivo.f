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
#-- listafune
#-====----========----========----========----========----========--
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lista los ejemplos de las funciones existentes en un archivo
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T listado ejemplos funciones archivo
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P ARCHIVO
#-------------------------------------------------------------------
#-- Ejemplos :
#-====----========----========----========----========----========--
#E listafune  /ruta_archivo_ejemplo_funciones
#-==================================================================

#-Lista las funciones pasando un archivo
listafune()
{
IS_listafune="Lista los nombres de las funciones de la ruta indicada"
INFO_SCRIPT=${IS_listafune}

ARCHIVO=$1

if [ "${ARCHIVO}" != "" ] ; then

#- Necesitamos sacar los ejemplos definidos. Nos de igual la lista de fundiones

cat ${ARCHIVO} | grep "^#E "  | cut -d " " -f2-

else

e_pmi listafune "Ruta_funcion_con_ejemplos"

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
