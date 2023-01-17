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
#L-- parse_git_branch - brqadd_git_branch_large - add_git_branch_short
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

#-------------------------------------------------------------------

parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

#-------------------------------------------------------------------

add_git_branch_large() {
#Gitlab Include
# Add git branch if its present to PS1
git --version &> /dev/null
if [ "$?" == "0" -a "$(parse_git_branch)" != "" ] ; then

#if [ "$color_prompt" == yes ]; then
  # Esto no funciona
  #PS1='$yellow$hostname:$green$PWD-[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]>$textreset'
#else
  PS1='\[${yellow}\]${hostname}:\[${green}\]${PWD}-\[${magent}\]-git::\[${red}\]$(parse_git_branch)>\[$(textreset)\] '
#fi

fi
}

#-------------------------------------------------------------------

add_git_branch_short() {
#Gitlab Include
# Add git branch if its present to PS1
git --version &> /dev/null
if [ "$?" == "0" -a "$(parse_git_branch)" != "" ] ; then

#if [ "$color_prompt" == yes ]; then
  # Esto no funciona - igual es mun metodo antiguo
#  PS1="${START}/_-_/${END}-[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]>"
#else
  # Esto funciona en Mac y Linux

  PS1='\[${yellow}\]${START}\[${textreset}\]/_-_/\[${green}\] ${END}-\[${magent}\]-git::\[${red}\]$(parse_git_branch)>\[$(textreset)\] '
#fi

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
