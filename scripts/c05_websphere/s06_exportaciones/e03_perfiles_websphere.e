#!/usr/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2010
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.0"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2010"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_CARACTER="especifico"
CONCEPT_MOLDE="exportaciones"
CONCEPT_ARQUETIPO=""
CONCEPT_PRODUCTO="websphere"
CONCEPT_LEVEL="Script ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL="${CONCEPT_LEVEL} ${CONCEPT_PRODUCTO_04} ${CONCEPT_CARACTER_04}"
#-==================================================================
#- Zona Exportaciones Cooherente
#-==================================================================

#-------------------------------------------------------------------
#- Perfiles - IBM Websphere
#-------------------------------------------------------------------
export PERFIL_01 PERFIL_02 PERFIL_03 PERFIL_04

#-------------------------------------------------------------------
#- Rutas de los perfiles
#-------------------------------------------------------------------
export RUTA_PERFIL_01 RUTA_PERFIL_02 RUTA_PERFIL_03 RUTA_PERFIL_04


#-------------------------------------------------------------------
#+ Sistema de trazado N2 - desactivado
#-------------------------------------------------------------------
#N4# echo "$LEVEL_NIVEL - Ejecutadas $CONCEPT_LEVEL"
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================

