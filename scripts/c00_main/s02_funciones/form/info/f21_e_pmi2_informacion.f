#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="5.3" #  Version del Script actual
FECHA_SCRIPT="Abril 2012"
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
#-- e_pmi2
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#- p_p
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Nos permite controla el formato de los errores - Evitando la redundancia de codigo
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E e_pmi2 f2 "busqueda con filtro" "Salida de la busqueda con ESC"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

# Te devuelve el archivo que contiene la funcion con la linea de la funcion 
# Podemos parametrizarla mucho mas
e_pmi2()
{
IS_e_pmi2="Permite parametrizar la salida de informacion de funciones. Inlcuye informacion adiccional"
EINFO_SCRIPT=${IS_e_pmi2}

# Funcion de informacion variable. No usa INFO_SCRIPT

NOMBRE_FUNCION=$1
TEXTO_INFORMACION=$( echo $2 | tr "_" " " )
INFORMACION_ADICCIONAL=$( echo $3 | tr "_" " " )
INFORMACION_ADICCIONAL_2=$( echo $4 | tr "_" " " )

#- No admite alias por tanto hay que usar funciones

if [ "${NOMBRE_FUNCION}" == "" ] ; then
NOMBRE_FUNCION="-?"
fi

if [ "${TITULO_FORMULARIO_GLOBAL}" != "" ] ; then
TITULO_FORMULARIO=${TITULO_FORMULARIO_GLOBAL}
fi

if [ "${NOMBRE_FUNCION}" == "-?" ] ; then

e2_pmt e_pmi2 "[NOMBRE_FUNCION] [INFORMACION] "
else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

NUM_PAR=7

ARGUMENTO_01="Funcion ${NOMBRE_FUNCION}"
ARGUMENTO_02="Informacion:"
ARGUMENTO_03=" ${INFO_SCRIPT}"
ARGUMENTO_04=" ${TEXTO_INFORMACION}"
ARGUMENTO_05="Informacion Adiccional :"
ARGUMENTO_06=" ${INFORMACION_ADICCIONAL}"
ARGUMENTO_07=" ${INFORMACION_ADICCIONAL_2}"

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

#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi

}

#-------------------------------------------------------------------