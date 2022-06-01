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
#-- codjar
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Codifica un fichero con espacios para facilitar su gestion
#-------------------------------------------------------------------
#T codificacion fichero code file spaces
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P FICHERO_A_CODIFICAR
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E codjar FICHERO	       -- Codifica esa fichero para poder tratarse
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Funcion para codificar
codjar()
{
IS_codjar="Codifica un fichero para poder tratarse"
INFO_SCRIPT=${IS_codjar}

FICHERO=$1
CGE=$2

#- El caracter general en el caso de un archivo si se le puede pasar
#  pero consideramos que el nombre del archivo no tiene espacios

if [ "${CGE}" == "" ]; then
#-Definimos el caracter general que no debe existir en la linea
CGE="@"
fi

if [ "${FICHERO}" == "" ]; then
FICHERO="-?"
fi

if [ "${FICHERO}" == "-?" ]; then

e_pmt codjar "FICHERO_A_CODIFICAR [CARACTER GENERAL]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-Falta ver que existe el fichero

#- Vamos a codificar

CSP=" "
CSL="_"
SGU="-"

#-Vamos a partir del tanto por ciento el cual es muy dificil encontrarlo en una cadena
# ya que se usa como comodin

jar tvf ${FICHERO} | grep ${CGE}
SALIDA_GREP=$?
#- Si que llega la linea
## echo "Entrada : $@ "

if [ "${SALIDA_GREP}" == "0" ]; then
#-Existe el caracter debemos notificar 
e_pmt codjar "LINEA CON CARACTER GENERAL \"${CGE}\""

else

jar tvf ${FICHERO} | tr ${CSL} ${CGE} | tr "${CSP}" ${CSL} 

fi
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
