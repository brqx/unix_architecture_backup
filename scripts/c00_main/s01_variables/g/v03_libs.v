#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.1"          #  Version del Script actual
FECHA_SCRIPT="Mayo 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_01="script"
CONCEPT_MOLDE_01="variables"
CONCEPT_PRODUCTO_01="drupal"
#-------------------------------------------------------------------
CONCEPT_LEVEL_01="${CONCEPT_FORMATO_01} ${CONCEPT_MOLDE_01}  ${CONCEPT_ARQUETIPO_01}"
CONCEPT_LEVEL_01="${CONCEPT_LEVEL_01} ${CONCEPT_PRODUCTO_01} "
#-==================================================================
# -- ESTE FICHERO SE AJUSTA POR ENTORNO / EMPRESA
#-------------------------------------------------------------------
#- Variables Definidas : MATRIZ DE SERVIDORES
#-------------------------------------------------------------------
#-- LIBRERIAS
#-------------------------------------------------------------------

#-------------------------------------------------------------------
#- 
#-------------------------------------------------------------------

#-Ruta General de Librerias
LIBS_RCT=${RCT}libs/

#-Ruta General de SCRONS - Scripts que se lanzan con cron - 
SCRONS_RCT=${RCT}scrons/

#-Especificacion de librerias por lenguage

LIBS_JACL=${LIBS_RCT}jacl
LIBS_JYTHON=${LIBS_RCT}jython
LIBS_PERL=${LIBS_RCT}perl
LIBS_PHP=${LIBS_RCT}php
LIBS_PYTHON=${LIBS_RCT}python
