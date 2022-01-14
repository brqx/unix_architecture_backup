#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.1"          #  Version del Script actual
FECHA_SCRIPT="Octubre 2010"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_MOLDE_04="exportaciones"
CONCEPT_PRODUCTO_04="server"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04}  ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-==================================================================
#+ Variables exportadas:
#-------------------------------------------------------------------
#-- AUTO_PROXY AUTO_PORT
#-------------------------------------------------------------------
#-- http_proxy
#-------------------------------------------------------------------

export AUTO_PROXY AUTO_PORT

#-Export especifico para sistemas sin proxy

#-Listo para wget
export http_proxy="http://${AUTO_PROXY}:${AUTO_PORT}"







