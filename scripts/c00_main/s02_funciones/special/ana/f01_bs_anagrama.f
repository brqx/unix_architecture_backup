#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2022
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Marzo 2022"
STATUS_SCRIPT="all checked"
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
#L-- bs_anagrama - brqz
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Establece un prompt que se basa en la ultima ruta de la estructura de directorios
#-------------------------------------------------------------------
#T generacion prompt
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E bs_anagrama   -- Prepara el prompt con una cadena indicada
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#SC-SERVER_CHANGE-  -- Cambios especificos de servidor

bs_anagrama()
{
IS_bs_anagrama="Prepara el prompt con la cadena indicada"
INFO_SCRIPT=${IS_bs_anagrama}

INFO=$1

if [ "${INFO}" == "-?" ]; then

e_pmt bs_anagrama

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Depende de la version de unix hay que ajustar el prompt
## PS1='\u@:[`basename ${PWD}`]>'	;
echo '$hostname@:[`basename ${PWD}`]>'	;

fi
}

#-------------------------------------------------------------------

# Short prompt
# D_brqz
brqz()
{
# if [ "${SHORT_PATHS}" == "0" ] ; then
brqz_enable
#else
#brqz_disable
#fi

}

brqz_enable()
{
IS_brqz_enable="Short prompt"
INFO_SCRIPT=${IS_bs_anagrama}

INFO=$1

if [ "${INFO}" == "-?" ]; then

e_pmt brqz_enable

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------
SHORT_PATHS=0

START='$(echo $PWD | cut -d "/" -f2)'
END='$(basename $PWD)'
#- Depende de la version de unix hay que ajustar el prompt

# Si tiene mas de 3 barras
COUNTBARS=$(echo $PWD | tr "/" "\n" | wc -l)

#Activamos formato corto si tiene más de 4 barras
if [ ${COUNTBARS} -gt 4 ] ; then
PS1="${START}/_-_/${END}>"
else
PS1='$hostname:$PWD>'
fi

fi
}

brqz_disable()
{
SHORT_PATHS=1
PS1='$hostname:$PWD>'
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
