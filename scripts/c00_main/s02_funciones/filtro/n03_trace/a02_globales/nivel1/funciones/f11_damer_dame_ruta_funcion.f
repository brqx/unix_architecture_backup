#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="5.1" #  Version del Script actual
FECHA_SCRIPT="Mayo 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="filtro"
CONCEPT_ARQUETIPO_04="trace"
CONCEPT_VARIANTE_04="nivel1"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- damer
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- f - S_RCT
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Devuelve la ruta de la funcion
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T informacion ruta funcion
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P FUNCION
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E damer fa3 -- ./c00_main/s02_funciones/filtro/n01_find/f08_fa3.f
#-==================================================================

#--------------------------------------------------------------------
# FUNCION damer
#--------------------------------------------------------------------

# Te devuelve solo la ruta (path) del archivo que contiene la funcion 
damer()
{
IS_damer="Devuelve solo la ruta de la funcion indicada. Puede acceder a la misma siempre con scd"
INFO_SCRIPT=${IS_damer}

FILTRO=$1

if [ "${FILTRO}" != "" ] ; then

RUTA_ACTUAL=$PWD

cd ${S_RCT}

f f | xargs grep "^$FILTRO()" | cut -d ":" -f1 

COD_RET=$?

if [ ${COD_RET} -gt 0 ] ; then
e_pmp xamep "funcion" "No existe la funcion ${FILTRO}"
fi

cd ${RUTA_ACTUAL}

else
# Lo ideal seria llamar a e_pmt damef damef function

e_pmi damer "funcion"

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

