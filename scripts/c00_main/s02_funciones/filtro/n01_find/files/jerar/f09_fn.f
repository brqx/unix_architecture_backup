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
#-- fn
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- f
#-------------------------------------------------------------------
#I Super filtro que admiten tantos parametros como queramos
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T filtro busqueda n parametros
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P P1 [P2] .. [Pn]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E fn a b c d   -- Busca ficheros que contienen las cadenas a b c d
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#
fn()
{
IS_fn="Super filtro que admiten tantos parametros como queramos"
INFO_SCRIPT=${IS_fn}

#- Falta por hacer, la idea es que admita N parametros de filtrado
#- hay que usar shift ( creo que es de DOS )
EXTENSION=$1 ;

cont=0;

#- Para que funcione como minimo tiene que tener dos parametros

if [ $# -gt 1 ] ; then

## echo "Numero parametros : $#"
## echo "Parametros : $@"

LISTAPAR=(${@})

len=$#
let len--
CADENA=

while [ ${cont} -lt ${len} ] ; do
## echo " $cont : ${LISTAPAR[$cont]}"
let cont++
CADENA="${CADENA} | grep ${LISTAPAR[$cont]}"
done

## cont=$( expr $cont + 1 )

CADENA="f ${EXTENSION} ${CADENA}"

#- Aqui tambien metemos un bucle - conseguimos que se puedan pasar todos los parametros
## f ${EXTENSION} | grep ${LISTAPAR[1]} | grep ${FILTRO[2} | grep ${FILTRO_03}   ;

eval ${CADENA} 

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
