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
#-- codir
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Codifica un listado de carpetas para facilitar su gestion
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T codificacion listado carpetas code file spaces
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [CARACTER GENERAL] [RUTA_A_CODIFICAR]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E codir X	       -- Codifica listado carpetas de la ruta actual con cambiando las X
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Funcion para codificar un listado
codir()
{
IS_codir="Codifica un listado carpetas para poder tratarse"
INFO_SCRIPT=${IS_codir}

#-En lugar de pasarse un fichero aqui se pasaria un listado o una ruta

CGE=$1
RUTA_PASADA=$2

#- El caracter general en el caso de un archivo si se le puede pasar
#  pero consideramos que el nombre del archivo no tiene espacios

if [ "${CGE}" == "" ]; then
#-Definimos el caracter general que no debe existir en la linea
CGE="@"
fi

if [ "${RUTA_PASADA}" == "" ]; then
#-Si no se indica la ruta entendemos la ruta actual
RUTA_PASADA="${PWD}"
fi

if [ "${CGE}" == "-?" ]; then

e_pmt codir "[CARACTER GENERAL] [RUTA_A_CODIFICAR]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

RUTA_ACTUAL=${PWD}

#-Aqui debemos considerar los espacios
cd "${RUTA_PASADA}"

#- Vamos a codificar

CSP=" "
CSL="_"
SGU="-"

#-Vamos a partir del tanto por ciento el cual es muy dificil encontrarlo en una cadena
# ya que se usa como comodin

#-Sacamos el listado de las carpetas
ls -1 | grep ${CGE} 

SALIDA_GREP=$?
#- Si que llega la linea
## echo "Entrada : $@ "

if [ "${SALIDA_GREP}" == "0" ]; then
#-Existe el caracter debemos notificar 
e_pmt codir "LINEA CON CARACTER GENERAL \"${CGE}\""

else

#- Filtramos solo las carpetas (undescores x GEN - spacios x underscores)
SALIDA_codir=$(ls -1p | grep "/" | cut -d "/" -f1 | tr ${CSL} ${CGE} | tr "${CSP}" ${CSL} | tr "\n" " ")

fi

#-Vuelta a la ruta de partida
cd "${RUTA_ACTUAL}"

#-Vaciamos variables
CGE=

fi
#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
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
