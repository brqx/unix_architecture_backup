#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
FECHA_SCRIPT="Marzo 2016"
STATUS_SCRIPT="all checked"
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
#L-- gdol
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- codir - ecode - dcode
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Accede a una ruta filtrando el inicio o conteniendo el parametro
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T acceso cd listado filtro
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [palabra_de_la_ruta]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E gdol syst   -- Entrara en la carpeta $system
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## - Filtra por el comienzo del parametro
#-- Falla con carpetas con parametros - vamos a cambiarlo

gdol()
{
IS_gend="Accede a una ruta filtrada con el comienzo del parametro"
INFO_SCRIPT=${IS_gend}

EXPR_PASADA=$1

if [ "${EXPR_PASADA}" == "" ] ;  then
EXPR_PASADA="-?"
fi


if [ "${EXPR_PASADA}" == "-?" ] ;  then

e_pmi gend "parametro"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------
#-Lo primero codificamos el parametro
RUTA_ACTUAL_cdd=${PWD}

ecode "${EXPR_PASADA}"
EXPR_CODIFICADA="${SALIDA_ECODE}"

codir

#-Necesitamos invocarlo dos veces para poder coger tanto el codigo de retorno como la primera fila
CARPETA_DESTINO=$(echo "${SALIDA_codir}" | tr " " "\n" | grep "${EXPR_CODIFICADA}") ;
SALIDA_gend=$?

CARPETA_DESTINO=$(echo "${SALIDA_codir}" | tr " " "\n" | grep "${EXPR_CODIFICADA}" | tail -1 ) ;

#- Al poner el tail ya no podemos considerar el codigo de retorno

if [ "${SALIDA_gend}" == "0" ] ; then 
#-Decodificamos la salida
dcode "${CARPETA_DESTINO}"

CARPETA_DECODIFICADA="${SALIDA_DCODE}"

echo "Llega aqui"

POS_REST="'$"$(echo "${CARPETA_DECODIFICADA}" | cut -c10-)"'"

cd ${POS_REST}

echo "-${POS_REST}-"
#-Ahora llamamos al tipo de listado
OLDPWD=${RUTA_ACTUAL_cdd}
fi

return ${SALIDA_gend}
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
