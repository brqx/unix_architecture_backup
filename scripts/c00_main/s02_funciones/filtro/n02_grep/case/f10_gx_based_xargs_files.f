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
#-- gx
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#--
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Busca cadenas dentro de los archivos. Basado en xargs (busqueda no recursiva)
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T busqueda cadenas interior archivos
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P cadena 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E gx cadena	-- Funcion de busqueda de archivos basandose en contenidos
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

ggx()
{
IS_ggx="Busca cadenas dentro de los archivos. Basada en xargs "
INFO_SCRIPT=${IS_ggx}

CONTENIDO=$1 ;

if [ "${CONTENIDO}" != "" ] ;  then

find . -type f | xargs grep -l "${CONTENIDO}" {} \;  2> /dev/null

else

e_pmt "ggx" "cadena"

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


