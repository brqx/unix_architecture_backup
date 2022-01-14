#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 7.3"          #  Version del Script actual
FECHA_SCRIPT="Octubre 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_MOLDE_04="variables"
CONCEPT_PRODUCTO_04="server"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04}  ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-==================================================================
#+ Variables definidas:
#-------------------------------------------------------------------
#-- BRQX_ROOT - BRQX_TMP - BRQX_SHM
#-------------------------------------------------------------------

#SC-SERVER_CHANGE-  -- Cambios especificos de servidor

BRQX_ROOT=/root/
BRQX_TMP=/tmp/
BRQX_SHM=/dev/shm/

#- Ruta nueva para controlar las ejecuciones
BRQXTMP=/tmp/zcontrol_brqx/

#-------------------------------------------------------------------
