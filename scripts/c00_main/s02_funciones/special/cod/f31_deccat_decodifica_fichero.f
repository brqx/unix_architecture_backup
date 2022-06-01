#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Enero 2012"
STATUS_SCRIPT="pending"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="special"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- deccat
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Decodifica una linea con espacios para facilitar su gestion
#-------------------------------------------------------------------
#T decodificacion decode linea espacios
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P LINEA_A_DECODIFICAR
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E dcode LINEA   -- Decodifica esa linea para poder tratarse
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Decodifica una linea previamente codificada
# El objetivo es facilitar la gestion de espacios
deccat()
{
IS_deccat="Decodifica un fichero"
INFO_SCRIPT=${IS_deccat}

INFO=$1

#- El caracter general no se lo podemos pasar como parametro pero si como variable
if [ "${CGE}" == "" ]; then
#-Definimos el caracter general que no debe existir en la linea
# El % no vale ya que se usa como comodin y se autosustituye la cadena siguiente a la expresion
# La @ tampoco vale - tambien hace una sustitucion rara
CGE="@"
fi

if [ "${INFO}" == "" ]; then
INFO="-?"
fi

if [ "${INFO}" == "-?" ]; then

e_pmt deccat "FICHERO_A_DECODIFICAR"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Espacio
CSP=" "
#- Guion bajo o slash o underscore
CSL="_"
#- Guion medio
SGU="-"

LINEA_ENTRADA="$@"

#-Vamos a partir del tanto por ciento el cual es muy dificil encontrarlo en una cadena
# ya que se usa como comodin

cat ${FICHERO} | tr ${CSL} "${CSP}" | tr ${CGE} ${CSL} 

#-Vaciamos variables
CGE=
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
