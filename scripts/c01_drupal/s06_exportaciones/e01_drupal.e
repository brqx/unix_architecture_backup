#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.0"          #  Version del Script actual
FECHA_SCRIPT="Junio 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_CARACTER="especifico"
CONCEPT_MOLDE="exportaciones"
CONCEPT_ARQUETIPO="acceso"
CONCEPT_LEVEL="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} ${CONCEPT_CARACTER}"
#-==================================================================
#- Zona Exportaciones Cooherente
#-==================================================================

#- PRODUCTOS - ENLACES - SCRIPTS
export BRQX_PROD BRQX_LNK BRQX_SCRIPT
export BRQX_PACK BRQX_PERS BRQX_PLIVE

#- Rutas - Arquitectura BRQX
export BRQX_UNIX BRQX_WEB BRQX_TEM
