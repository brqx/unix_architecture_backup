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
#E damela f2  -- Las listas del tipo de archivo
#-------------------------------------------------------------------
#E xamela lf captura  -- Devuelve las funciones de captura
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

# Te la lineas donde aparece el archivo - Vamos a mejorarlo pero de momento solo funcion
damela()
{
IS_damela="Devuelve la lista que invoca al archivo."
INFO_SCRIPT=${IS_damela}

#- Debe establecer la ruta de las listas
#  Sabemos que por defecto es L_RCT
#- Por defecto debe darte las listas de funciones

FUNCION=$1

if [ "${FUNCION}" != "" ] ;  then

#-Obtenemos el archivo

ARCHIVO=$( xamef ${FUNCION} )

#-Hacemos la busqueda

RUTA_ACTUAL=$PWD

cd ${L_RCT}

g ${ARCHIVO}

cd ${RUTA_ACTUAL}

else

e_pmp damela "funcion" "No existe el objeto ${ARCHIVO} en el filtro ${FILTRO}"

fi

}

#--------------------------------------------------------------------


# Te la lineas donde aparece el archivo ( la ruta completa )
xamela()
{
IS_xamela="Devuelve el nombre de la lista que invoca al archivo."
INFO_SCRIPT=${IS_xamela}

#- Debe establecer la ruta de las listas
#  Sabemos que por defecto es L_RCT

FUNCION=$1

if [ "${FUNCION}" != "" ] ;  then


LISTA_ARCHIVO_COMPLETO=$( damela ${FUNCION} )


basename ${LISTA_ARCHIVO_COMPLETO} 

else

e_pmp xamela "funcion" "No existe el objeto ${ARCHIVO} en el filtro ${FILTRO}"

fi

}


