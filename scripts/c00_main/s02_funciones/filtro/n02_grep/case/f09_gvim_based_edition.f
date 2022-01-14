#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
FECHA_SCRIPT="Octubre 2011"
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
#-- gvi - gvim
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#--
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Busca cadenas dentro de los archivos y los visualiza
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T busqueda cadenas interior archivos ediccion
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P cadena 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E gvim cadena	-- Busca la cadena y carga el archivo posteriormente
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

gvim()
{
IS_gvim="Busca cadenas dentro de los archivos y los visualiza"
INFO_SCRIPT=${IS_gvim}

CONTENIDO=$1 ;

if [ "${CONTENIDO}" != "" ] ;  then

LINEAS=$(g ${CONTENIDO} )

#- Al hacer un echo concatenamos los saltos de linea con un espacio
#NUM_LINEAS=$(echo ${LINEAS} | wc -l )
NUM_LINEAS=$(g ${CONTENIDO} | wc -l )

if [ "${NUM_LINEAS}" -eq "1" ] ;  then
echo ${LINEAS}
vim ${LINEAS}
fi

else

e_pmt gvim "cadena"

fi

}

#-------------------------------------------------------------------

gvi()
{
IS_gi="Busca cadenas dentro de los archivos. No diferencia mayusculas y minusculas"
INFO_SCRIPT=${IS_gi}

CONTENIDO=$1 ;

if [ "${CONTENIDO}" != "" ] ;  then

LINEAS=$(g ${CONTENIDO} )
NUM_LINEAS=$(g ${CONTENIDO} | wc -l )


if [ "${NUM_LINEAS}" -eq "1" ] ;  then
echo ${LINEAS}
vi ${LINEAS}
fi

else

e_pmt gvi "cadena"

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

