#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="6.1" #  Version del Script actual
FECHA_SCRIPT="Julio 2011"
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
#-- damela - xamela
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- g - L_RCT - xamef
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Devuelve las listas que contienen el archivo
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T listado listas
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [EXTENSION_LISTA] [FILTRO]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E damell f03_filtro.l2f  -- Las listas del tipo de archivo
#-------------------------------------------------------------------
#E xamell f03_filtro.l2f  -- Devuelve las funciones de captura
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

# Te la lineas donde aparece el archivo - Vamos a mejorarlo pero de momento solo funcion
damell()
{
IS_damela="Devuelve la lista que invoca a la lista."
INFO_SCRIPT=${IS_damell}

ARCHIVO=$1

if [ "${ARCHIVO}" != "" ] ;  then

#-Hacemos la busqueda

RUTA_ACTUAL=$PWD

cd ${L_RCT}

g ${ARCHIVO}

cd ${RUTA_ACTUAL}

else

e_pmp damell "funcion" "No existe el objeto ${ARCHIVO} en el filtro ${FILTRO}"

fi

}

#--------------------------------------------------------------------


# Te la lineas donde aparece el archivo ( la ruta completa )
xamell()
{
IS_xamell="Devuelve el nombre de la lista que invoca a la lista."
INFO_SCRIPT=${IS_xamell}

#- Debe establecer la ruta de las listas
#  Sabemos que por defecto es L_RCT

FUNCION=$1

if [ "${FUNCION}" != "" ] ;  then


LISTA_ARCHIVO_COMPLETO=$( damell ${FUNCION} )

if [ "${LISTA_ARCHIVO_COMPLETO}" != ""  ] ; then

basename ${LISTA_ARCHIVO_COMPLETO} 

fi

else

e_pmp xamell "funcion" "No existe el objeto ${ARCHIVO} en el filtro ${FILTRO}"

fi

}


