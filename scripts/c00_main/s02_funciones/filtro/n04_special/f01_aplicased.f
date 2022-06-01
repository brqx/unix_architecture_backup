#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="5.1" #  Version del Script actual
FECHA_SCRIPT="Mayo 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="filtro"
CONCEPT_ARQUETIPO_04="special"
CONCEPT_VARIANTE_04=""
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- aplicased
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Aplica el comenado sed a unos parametros pasados
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T recuerdo uso sed
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P FUNCION
#-------------------------------------------------------------------
#+ Ejemplo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#E aplicased cadena par1 par2 -- Aplica sed a la cadena indicadas
#-==================================================================

aplicased()
{
IS_aplicased="Aplica sed a tres parametros indicados"
INFO_SCRIPT=${IS_aplicased}


CADENA=$1                            ;
PAR1=$2                              ;
PAR2=$3                              ;
 
if [ "${CADENA}" != "" -a "${PAR1}" != "" -a "${PAR1}" != "" ] ; then

echo $CADENA | sed "s/$PAR1/$PAR2/g" ;

else
# Lo ideal seria llamar a e_pmt damef damef function

e_pmi damef "cadena expresion_1 expresion_2"

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

