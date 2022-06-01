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
CONCEPT_ARQUETIPO_04="acceso"
CONCEPT_VARIANTE_04="zilists"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- fdep - fdir
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I listado de carpetas a nivel superficial, con o sin parametro
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T listado carpetas superficial
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P RUTA_DE_UNA_LISTA
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E fdep /aaaa/  -- Lista las carpetas que cuelgan de /aaa 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Ajuste a drupal o a cualquier otra necesidad con pase de parametro
fdep()
{
IS_fdep="listado de carpetas a nivel superficial con parametro"
INFO_SCRIPT=${IS_fdep}


RUTA_MODULO=$1

if [ "${RUTA_MODULO}" != "" ] ;  then

FN_FDEP_SALIDA=`find ${RUTA_MODULO}/*  -maxdepth 0 -type d`

else
e_pmi fdep "ruta"

fi

}


#-------------------------------------------------------------------

fdir()
{
IS_fdir="listado de carpetas a nivel superficial sin parametro"
INFO_SCRIPT=${IS_fdir}


find ${PWD}  -maxdepth 1 -type d
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
