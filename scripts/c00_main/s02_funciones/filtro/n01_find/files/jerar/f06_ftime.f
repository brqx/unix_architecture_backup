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
#-- ftime
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Filtra por extension y fecha
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T busqueda filtro parametros fecha
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P EXTENSION FECHA_MODIFICACION
#-------------------------------------------------------------------
#+ Ejemplo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#E ftime a --> Filtra por extension filtrando por fecha de modificacion
#-------------------------------------------------------------------
## find . -mtime 1 encontrará archivos que han sido modificados entre las últimas 24 y 48 horas.
#-------------------------------------------------------------------
## find . -mtime +1 encontrará archivos que han sido modificados hace más de 48 horas.
#-------------------------------------------------------------------
## find . -mtime +2 -mtime -5 encontrará archivos que han sido modificados hace más de 48 horas y menos de 5 dias.
#-------------------------------------------------------------------

ftime()
{
IS_ftime="Filtra por extension y fecha"
INFO_SCRIPT=${IS_ftime}

INFO_SCRIPT="Filtro de ficheros por extension y antiguedad"

EXTENSION=$1 ;
FECHA_MODIFICACION=$2 ;

if [ "${EXTENSION}" != "" -a "${FECHA_MODIFICACION}" != ""  ] ;  then

find . -type f -name "*.${EXTENSION}" -mtime ${FECHA_MODIFICACION} 2> /dev/null ;

else

e_pmi ftime "extension antiguedad"

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
