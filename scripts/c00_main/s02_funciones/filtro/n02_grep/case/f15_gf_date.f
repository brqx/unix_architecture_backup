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
#-- gf
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#--
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Hace una busqueda por fecha
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T filtro fecha actual mes anno
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [MES] [ANNO]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E gf 03	-- Funcion de busqueda de archivos de Marzo
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

gf()
{
IS_gf="Hace una busqueda por fecha. Sin entrada parte de la fecha actual"
INFO_SCRIPT=${IS_gf}

# Filtra por defecto por la fecha actual
# Puede recibir dos parametros : mes - mes y temporada
MES=$1 ;
YEAR=$2 ;

if [ "${MES}" == "" ] ;  then
# No se pasa ningun parametro
MES=`date '+%m'`
YEAR=`date '+%Y'`
else
# Se pasa un parametro
if [ "${YEAR}" == "" ] ;  then
YEAR=`date '+%Y'`
fi

fi

ls -1 | grep "${YEAR}-${MES}"

}

