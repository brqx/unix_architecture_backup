#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Octubre 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="filtro"
CONCEPT_VARIANTE_04="find"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- fdl
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Hace busqueda de enlaces / links que contienen el patron de entrada
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T busqueda links enlaces
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P PATRON_NOMBRE
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E fdl unix  -- Lista todas los links que contienen la cadena unix
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 


#- Busca solo en links - FDL
fdl()
{

IS_fdl="Hace busquedas de links - enlaces simbolicos"
INFO_SCRIPT=${IS_fdl}

EXTENSION=$1 ;

if [ "${EXTENSION}" != "" ] ;  then

find . -type l -name "*${EXTENSION}*" 2> /dev/null ;

else

e_pmi fdl "filtro"

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

