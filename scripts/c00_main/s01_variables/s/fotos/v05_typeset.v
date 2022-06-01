#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.3"          #  Version del Script actual
FECHA_SCRIPT="Julio 2013"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_01="script"
CONCEPT_MOLDE_01="variables"
CONCEPT_PRODUCTO_01="main"
#-------------------------------------------------------------------
CONCEPT_LEVEL_01="${CONCEPT_FORMATO_01} ${CONCEPT_MOLDE_01}  ${CONCEPT_ARQUETIPO_01}"
CONCEPT_LEVEL_01="${CONCEPT_LEVEL_01} ${CONCEPT_PRODUCTO_01} "
#-==================================================================
#- Matrices Definidas 
#-------------------------------------------------------------------
#-- lugares_brqx - ciudades_brqx - paises_brqx 
#-------------------------------------------------------------------
#-- tlugares_brqx - tciudades_brqx - tpaises_brqx
#-------------------------------------------------------------------
#-- sw_ciudades - sw_lugares - 
#-------------------------------------------------------------------

#-Matrices requeridas para procesamientos - solo para ubuntu

uname -a | grep Ubuntu
ES_UBUNTU=$?

if [ "${ES_UBUNTU}" == "0" ] ; then
typeset -A lugares_brqx 
typeset -A ciudades_brqx 
typeset -A tlugares_brqx 
typeset -A tciudades_brqx 

typeset -A sw_ciudades 
typeset -A sw_lugares 
typeset -A tpaises_brqx 
typeset -A paises_brqx

typeset -A cinco_codigos
typeset -A cont_brqx_code

fi
#-------------------------------------------------------------------

