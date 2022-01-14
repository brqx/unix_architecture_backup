#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="5.1" #  Version del Script actual
FECHA_SCRIPT="Febrero 2011"
STATUS_SCRIPT="testing"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="informaciones"
CONCEPT_ARQUETIPO_04="general"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- dameg - xameg
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- f
#-------------------------------------------------------------------
#I Devuelve los objetos definidos ( Variables - Alias - Funciones ... )
#I Por defecto devolvera las variables o los alias
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T listado objetos funciones alias variables
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P filtro [tipo_archivo]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E xame2g web    -- Listado de variables que contengan web
#-------------------------------------------------------------------
#E xame2g a web  -- Listado de alias que contengan web
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Por defecto devuelve las variables

xame2g()
{
IS_xame2g="Lista los objetos existentes partiendo de la ruta actual ( por defecto variables )"
INFO_SCRIPT=${IS_xame2g}

TIPO_ARCHIVO=$2 ;
FILTRO=$1

if [ "${FILTRO}" != "" ] ;  then

if [ "${TIPO_ARCHIVO}" == "" ] ;  then
TIPO_ARCHIVO=v
fi

f ${TIPO_ARCHIVO} | xargs grep "=" | grep -v "==" | grep -v "\-\-" | grep -v "CONCEPT" | grep -v "NIVEL" | grep -v "FECHA" | grep -v "VERSION" | cut -d ":" -f2- | grep "$FILTRO"

else

e_pmt xame2g "filtro [tipo_archivo]"

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

