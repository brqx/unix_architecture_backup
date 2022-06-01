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
#-- gene
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- codir - ecode - dcode
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Entra en el primer directorio que contenga la expresion indicada
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
#E gene apli  ( entraria en la carpeta aplicaciones )
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

gene()
{
IS_gene="Entra en el primer directorio que contenga la expresion indicada"
INFO_SCRIPT=${IS_gene}

EXPR_PASADA=$1

if [ "${EXPR_PASADA}" == "" ] ;  then
EXPR_PASADA="-?"
fi

if [ "${EXPR_PASADA}" == "-?" ] ;  then
#- Informar de los parametros
e_pmi gene "subcadena_nombre_carpeta"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------
#-Lo primero codificamos el parametro
RUTA_ACTUAL_gene=${PWD}

ecode "${EXPR_PASADA}"
EXPR_CODIFICADA="${SALIDA_ECODE}"

codir

#-Necesitamos invocarlo dos veces para poder coger tanto el codigo de retorno como la primera fila
CARPETA_DESTINO=$(echo "${SALIDA_codir}" | tr " " "\n" | grep "${EXPR_CODIFICADA}") ;
SALIDA_gene=$?

#-El tema es que tail coge el ultimo
CARPETA_DESTINO=$(echo "${SALIDA_codir}" | tr " " "\n" | grep "${EXPR_CODIFICADA}" | head -1) ;

#- Al poner el tail ya no podemos considerar el codigo de retorno

if [ "${SALIDA_gene}" == "0" ] ; then 
#-Decodificamos la salida
dcode "${CARPETA_DESTINO}"

CARPETA_DECODIFICADA="${SALIDA_DCODE}"
cd "${CARPETA_DECODIFICADA}" 
#-Ahora llamamos al tipo de listado
OLDPWD=${RUTA_ACTUAL_gene}
fi

return ${SALIDA_gene}
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
