#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2022
#-------------------------------------------------------------------
VERSION_SCRIPT="0.0.0.1" #  Version del Script actual
FECHA_SCRIPT="Julio 2022"
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
#L-- brqz_enable - brqz_disable - check_short_paths - isbrqz - manage_short_paths
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- git - colors
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

# Short prompt
# D_brqz
check_short_paths()
{
if [ "${SHORT_PATHS}" == "0" ] ; then
manage_short_paths
fi
}

#-------------------------------------------------------------------

isbrqz()
{
if [ "${SHORT_PATHS}" == "0" ] ; then
echo "Brqz ${yellow}( short paths ) ${green}ENABLED$(textreset)"
else
echo "Brqz ${yellow}( short paths ) ${red}disabled$(textreset)"
fi

}


#-------------------------------------------------------------------
## Brqz Manage
manage_short_paths()
{
IS_manage_short_paths="Short prompt"
INFO_SCRIPT=${IS_manage_short_paths}

INFO=$1

if [ "${INFO}" == "-?" ]; then

e_pmt manage_short_paths

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

# Managed in colors.x

START="$(echo $PWD | cut -d "/" -f2)"
END="$(  basename $PWD)"
#- Depende de la version de unix hay que ajustar el prompt

# Si tiene mas de 3 barras
COUNTBARS=$(echo $PWD | tr "/" "\n" | wc -l)

#Activamos formato corto si tiene más de 4 barras
if [ ${COUNTBARS} -gt 4 ] ; then
PS1='\[${yellow}\]${START}\[$(textreset)\]/_-_/\[${green}\]${END}>\[$(textreset)\] '
add_git_branch_short

else
PS1='\[${yellow}\]${hostname}:\[${green}\]${PWD}>\[$(textreset)\] '
add_git_branch_large

fi


fi
}

#-------------------------------------------------------------------

brqz_enable()
{
SHORT_PATHS="0"
manage_short_paths
}

#-------------------------------------------------------------------

brqz_disable()
{
SHORT_PATHS="1"
PS1='\[$yellow\]$hostname:\[$green\]$PWD>\[$(textreset)\] '
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
