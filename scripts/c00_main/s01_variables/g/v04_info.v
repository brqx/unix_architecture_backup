#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.2"          #  Version del Script actual
FECHA_SCRIPT="Mayo 2012"
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

TITULO_FORMULARIO_GLOBAL="Control de Scripts 1.4 - Funciones - Brqx 2012/2013"

#-Variables de pantalla para generar resultados con contenido pre-generado

PANTALLA_SCRIPT=""
PANTALLA_EXTENDIDA_SCRIPT=""

#-Variable encargada de gestionar el nivel de llamada - profundidad
SW_LLAMADA_DESDE_NIVEL_SUPERIOR=0