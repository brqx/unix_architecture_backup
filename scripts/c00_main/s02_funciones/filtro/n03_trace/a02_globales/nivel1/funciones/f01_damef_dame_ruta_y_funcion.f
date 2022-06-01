#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="5.1" #  Version del Script actual
FECHA_SCRIPT="Octubre 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="filtro"
CONCEPT_ARQUETIPO_04="trace"
CONCEPT_VARIANTE_04="globales"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- damef
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- f - S_RCT
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Devuelve la ruta de la funcion indicada
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T informacion funciones objetos
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P FUNCION
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
# damef   -- Las funciones de los archivos
#-------------------------------------------------------------------
#E damef f2 -- ./c00_main/s02_funciones/filtro/n01_find/files/f04_f2.f:f2()
#-==================================================================

#--------------------------------------------------------------------
# FUNCION damef
#--------------------------------------------------------------------

# Te devuelve el archivo que contiene la funcion con la linea de la funcion 
damef()
{
IS_damef="Devuelve la ruta de la funcion indicada y la funcion. Puede acceder a la misma siempre con scd"
INFO_SCRIPT=${IS_damef}

FILTRO=$1

#Debe ir a la ruta de las listas o no

RUTA_ACTUAL=$PWD


if [ "${FILTRO}" != "" ] ; then

cd ${S_RCT}

f f | xargs grep "^$FILTRO()" 

COD_RET=$?

if [ ${COD_RET} -gt 0 ] ; then
e_pmp damef "funcion" "No existe la funcion ${FILTRO}"
fi

cd ${RUTA_ACTUAL}
else
# Lo ideal seria llamar a e_pmt damef damef function

e_pmi damef "funcion"

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

