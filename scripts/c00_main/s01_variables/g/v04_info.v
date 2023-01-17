#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2022
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.3"          #  Version del Script actual
FECHA_SCRIPT="Mayo 2022"
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
# -- ESTE FICHERO SE AJUSTA POR FECHA
#-------------------------------------------------------------------
#- Variables Definidas 
#-------------------------------------------------------------------
#-- TITULO_FORMULARIO
#-------------------------------------------------------------------

#-Texto general Informacion y Traceo

TITULO_FORMULARIO_GLOBAL="Control de Scripts 1.5 - Funciones - Brqx 2022/2023"

#-Variables de pantalla para generar resultados con contenido pre-generado

PANTALLA_SCRIPT=""
PANTALLA_EXTENDIDA_SCRIPT=""

#-Variable encargada de gestionar el nivel de llamada - profundidad
SW_LLAMADA_DESDE_NIVEL_SUPERIOR=0

# Gestion de colores

dim="$(tput dim)"

red="$(      tput setaf 1)"
green="$(    tput setaf 2)" 
yellow="$(   tput setaf 3)" 
blue="$(     tput setaf 4)" 
magent="$(   tput setaf 5)" 
cyan="$(     tput setaf 6)" 
white="$(    tput setaf 7)" 
black="$(    tput setaf 0)" 


main_console_color="black"

textreset_general="$(tput sgr0)" # reset the foreground colour
