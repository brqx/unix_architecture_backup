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
#-- limpia_variables
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#- Limpiar variables temporales para evitar efectos laterales
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
# limpia_variables  -- Vacia las variables temporales usadas
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

limpia_variables()
{
INFO_SCRIPT="Limpia las variables comunes usadas en los scripts"

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
VERSION_SCRIPT=
FECHA_SCRIPT=


#-------------------------------------------------------------------
#-Parte estatica
#-------------------------------------------------------------------
CADENA=
EXTENSION=
FECHA_MODIFICACION=
#-------------------------------------------------------------------

#-------------------------------------------------------------------
#-Parte dinamica
#-------------------------------------------------------------------
eval CONCEPT_CARACTER_${LEVEL_NIVEL}=
eval CONCEPT_MOLDE_${LEVEL_NIVEL}=
eval CONCEPT_ARQUETIPO_${LEVEL_NIVEL}=
eval CONCEPT_PRODUCTO_${LEVEL_NIVEL}=
eval CONCEPT_LEVEL_${LEVEL_NIVEL}=

#-Scripts y listas - si lanzamos esto perdemos la variable de la lista

##eval SCRIPT_PARTICULAR_PATH_${LEVEL_NIVEL}=
##eval LSCRIPT_PARTICULAR_PATH_${LEVEL_NIVEL}=

#-------------------------------------------------------------------
#-==================================================================
}


