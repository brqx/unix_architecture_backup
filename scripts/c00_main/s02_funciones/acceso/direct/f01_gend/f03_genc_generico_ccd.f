#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
FECHA_SCRIPT="Julio 2011"
STATUS_SCRIPT="all_checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="acceso"
CONCEPT_VARIANTE_04="direct"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- genc
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- codir - ecode - dcode
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Entra en el padre de la ruta indicada
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T acceso cd parametros
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [subcadena_nombre_carpeta]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E gene /padre/apli  ( entraria en la carpeta padre )
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Generico para ccd
genc()
{
IS_genc="Entra en el padre de la ruta indicada"
INFO_SCRIPT=${IS_genc}

EXPR_PASADA=$1

if [ "${EXPR_PASADA}" == "" ] ;  then
EXPR_PASADA="-?"
fi

if [ "${EXPR_PASADA}" == "-?" ] ;  then
#- Informar de los parametros
e_pmi genc "ruta indicada"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------
#-Esta funcion lo recibe en claro

RUTA_ACTUAL_ccd=${PWD}

RUTA_PASADA="$@"

CARPETA_DESTINO=$(dirname "${RUTA_PASADA}") ;

if [ -d ${CARPETA_DESTINO} ] ; then 
#-Existe la carpeta
SALIDA_genc=0
cd "${CARPETA_DESTINO}"
else
#-No existe la carpeta - No se hace nada
SALIDA_genc=1
fi

OLDPWD=${RUTA_ACTUAL_ccd}

return ${SALIDA_genc}

#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
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
