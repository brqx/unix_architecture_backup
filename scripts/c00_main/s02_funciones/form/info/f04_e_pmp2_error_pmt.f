#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="5.1" #  Version del Script actual
FECHA_SCRIPT="Febrero 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="form"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- e_pmp2
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#- p_p - INFO_SCRIPT
#-------------------------------------------------------------------
#- Nos permite controla el formato de los errores
#  Evitando la redundancia de codigo
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
# e_pmp damef "function" "Funcion no existe"  -- Imprime la traza de error con damef y function
#-------------------------------------------------------------------

# Te devuelve el archivo que contiene la funcion con la linea de la funcion 
e_pmp2()
{
IS_e_pmp2="Permite parametrizar la salida de informacion de funciones. Incluye Formato y particularidades"
EINFO_SCRIPT=${IS_e_pmp2}

# Usara la variable general INFO_SCRIPT, que se redefine en cada funcion ejecutada
# Se permite invocar sin argumentos

NOMBRE_FUNCION=$1
ARGUMENTOS=$2
TEXTO_ERROR=$3
TEXTO_ERROR_2=$4


if [ "${TEXTO_ERROR}" == "" ] ; then
TEXTO_ERROR=Formato
fi

if [ "${NOMBRE_FUNCION}" == "" ] ; then
NOMBRE_FUNCION="-?"
fi

if [ "${TITULO_FORMULARIO_GLOBAL}" != "" ] ; then
TITULO_FORMULARIO=${TITULO_FORMULARIO_GLOBAL}
fi

if [ "${NOMBRE_FUNCION}" == "-?" ] ; then

e2_pmt e_pmt "Error de parametros. Mirar"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

NUM_PAR=8

ARGUMENTO_01="Funcion ${NOMBRE_FUNCION}"
ARGUMENTO_02="Informacion:"
ARGUMENTO_03=" ${INFO_SCRIPT}"
ARGUMENTO_04="Formato:"
ARGUMENTO_05=" ${NOMBRE_FUNCION} <${ARGUMENTOS}>"
ARGUMENTO_06="Particularidades :"
ARGUMENTO_07=" ${TEXTO_ERROR}"
ARGUMENTO_08=" ${TEXTO_ERROR_2}"

#-Presentamos la informacion
p_p ${NUM_PAR}


#-Vaciar variables

ARGUMENTO_01=
ARGUMENTO_02=
ARGUMENTO_03=
ARGUMENTO_04=
ARGUMENTO_05=
ARGUMENTO_06=
ARGUMENTO_07=
ARGUMENTO_08=

#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------

fi

}

#-------------------------------------------------------------------