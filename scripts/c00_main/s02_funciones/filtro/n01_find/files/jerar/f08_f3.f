#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
FECHA_SCRIPT="Junio 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="filtro"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- f3 - f4 - f5
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- f
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Filtra por extension y hace dos grep adicionales a la salida
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T busqueda filtro multiples parametros
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P EXTENSION FILTRO_1 FILTRO_2
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E f3 jsp gua dio -- Busca los archivos JSP cuya ruta tenta gua y dio
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-==================================================================

#
f3()
{
IS_f3="Filtra por extension y hace dos grep adicionales a la salida"
INFO_SCRIPT=${IS_f3}

EXTENSION=$1 ;
FILTRO_01=$2    ;
FILTRO_02=$3    ;

if [ "${EXTENSION}" != "" -a "${FILTRO_01}" != "" -a "${FILTRO_02}" != "" ] ;  then

f ${EXTENSION} | grep ${FILTRO_01} | grep ${FILTRO_02}   ;

else

e_pmt f3 "extension filtro1 filtro2"

fi
}

#-------------------------------------------------------------------

f4()
{
IS_f4="Filtra por extension y hace tres grep adicionales a la salida"
INFO_SCRIPT=${IS_f4}

EXTENSION=$1 ;
FILTRO_01=$2    ;
FILTRO_02=$3    ;
FILTRO_03=$4    ;

if [ "${EXTENSION}" != "" -a "${FILTRO_01}" != "" -a "${FILTRO_02}" != "" -a "${FILTRO_03}" != "" ] ;  then

f ${EXTENSION} | grep ${FILTRO_01} | grep ${FILTRO_02} | grep ${FILTRO_03}   ;

else

e_pmt f4 "extension filtro1 filtro2 filtro3"

fi

}

#-------------------------------------------------------------------

f5()
{
IS_f5="Filtra por extension y hace cuatro grep adicionales a la salida"
INFO_SCRIPT=${IS_f5}

EXTENSION=$1 ;
FILTRO_01=$2    ;
FILTRO_02=$3    ;
FILTRO_03=$4    ;
FILTRO_04=$5    ;

if [ "${EXTENSION}" != "" -a "${FILTRO_01}" != "" -a "${FILTRO_02}" != "" -a "${FILTRO_03}" != "" -a "${FILTRO_04}" != "" ] ;  then

f ${EXTENSION} | grep ${FILTRO_01} | grep ${FILTRO_02} | grep ${FILTRO_03} | grep ${FILTRO_04}   ;

else

e_pmt f5 "extension filtro1 filtro2 filtro3 filtro4"

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
