#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="5.2" #  Version del Script actual
FECHA_SCRIPT="Abril 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="informaciones"
CONCEPT_ARQUETIPO_04="form"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- p_p
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#- p_pNp
#-------------------------------------------------------------------
#- Nos permite imprimir pantallas de informacion 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
# p_p 3 -- Lanza p_p3p
#-------------------------------------------------------------------

# Imprime el formulario con un parametro de entrada
p_p()
{
IS_p_p="Imprime el formulario con un parametro de entrada"
EINFO_SCRIPT=${IS_p_p}

# Usara la variable general INFO_SCRIPT, que se redefine en cada funcion ejecutada
# Se permite invocar sin argumentos

NUM_PRINT=$1

if [ "${NUM_PRINT}" == "" ] ; then
NUM_PRINT="1"
fi

if [ "${NUM_PRINT}" == "-?" ] ; then

e2_pmt p_p "[NUMERO_PARAMETROS]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

clear

p_p${NUM_PRINT}p

#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi

}

#-------------------------------------------------------------------