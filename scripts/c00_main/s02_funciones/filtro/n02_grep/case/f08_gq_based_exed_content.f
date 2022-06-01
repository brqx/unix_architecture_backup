#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2022
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Marzo 2022"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="filtro"
CONCEPT_VARIANTE_04="grep"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- gq - gqg
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#--
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Busca cadenas dentro de los archivos. Basado en find -exec (busqueda recursiva)
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
#E gq cadena	-- Funcion de busqueda de archivos basandose en contenidos
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

gq()
{
IS_gq="Busca cadenas dentro de los archivos. Obtiene contenido. Basada en exec"
INFO_SCRIPT=${IS_gq}

CONTENIDO=$1 ;

if [ "${CONTENIDO}" != "" ] ;  then

find . -type f -exec grep ${CONTENIDO} {} \;  2> /dev/null

else

echo "Error en gq ${CONTENIDO}"
##e_pmt g "cadena"

fi

}

# A power variant for Linux
#-------------------------------------------------------------------

gqg()
{
IS_gq="Busca cadenas dentro de los archivos. Obtiene contenido. Basada en gq"
INFO_SCRIPT=${IS_gq}

CONTENIDO=$1 
FILTRO=$2
FILTRO2=$3

if [ "${CONTENIDO}" != "" ] ;  then

    if [ "${FILTRO2}" != "" ] ;  then

    gq "${CONTENIDO} ${CONTENIDO}" | grep ${FILTRO} | ${FILTRO2}

    else

        if [ "${FILTRO}" != "" ] ;  then

        gq "${CONTENIDO} ${CONTENIDO}" | grep ${FILTRO} 

        else
#        echo "Lanzando Gf"
        gq "${CONTENIDO} ${CONTENIDO}"         
#        find . -type f -exec grep ${CONTENIDO} ${CONTENIDO} {} \;  2> /dev/null

        fi
    fi
else
echo "Error en gq ${CONTENIDO}"
##e_pmt g "cadena"

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

