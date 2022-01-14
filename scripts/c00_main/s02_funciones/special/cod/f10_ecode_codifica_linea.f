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
#L-- ecode
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Codifica una linea con espacios para facilitar su gestion
#-------------------------------------------------------------------
#T generacion prompt
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P LINEA_A_CODIFICAR
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E ecode LINEA	       -- Codifica esa linea para poder tratarse
#E CGE=@;ecode LINEA   -- Codifica esa linea con caracter generar @
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Funcion para codificar
ecode()
{
IS_ecode="Codifica"
INFO_SCRIPT=${IS_ecode}

INFO=$1

#- El caracter general no se lo podemos pasar como parametro pero si como variable
if [ "${CGE}" == "" ]; then
#-Definimos el caracter general que no debe existir en la linea
CGE="@"
fi

if [ "${INFO}" == "" ]; then
INFO="-?"
fi

if [ "${INFO}" == "-?" ]; then

e_pmt ecode "LINEA_A_CODIFICAR"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Vamos a codificar

CSP=" "
CSL="_"
SGU="-"

#-Vamos a partir del tanto por ciento el cual es muy dificil encontrarlo en una cadena
# ya que se usa como comodin

LINEA_PASADA="$@"

echo "${LINEA_PASADA}" | grep ${CGE}
SALIDA_GREP=$?
#- Si que llega la linea
## echo "Entrada : $@ "

if [ "${SALIDA_GREP}" == "0" ]; then
#-Existe el caracter debemos notificar 
SALIDA_ECODE="LINEA CON CARACTER GENERAL \"${CGE}\""
e_pmt ecode "LINEA CON CARACTER GENERAL \"${CGE}\""

else

LINEA_CODIFICADA=$(echo "${LINEA_PASADA}" | tr ${CSL} ${CGE} | tr "${CSP}" ${CSL} )

SALIDA_ECODE=${LINEA_CODIFICADA}

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
