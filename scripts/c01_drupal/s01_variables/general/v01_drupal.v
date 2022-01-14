#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2010
#-------------------------------------------------------------------
VERSION_SCRIPT="V 7.1"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_MOLDE_04="variables"
CONCEPT_PRODUCTO_04="drupal"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04}  ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-==================================================================
#+ Variables definidas:
#-------------------------------------------------------------------
#-- BRQX_PROD - BRQX_LNK - BRQX_PACK - BRQX_PERS - BRQX_PLIVE
#-------------------------------------------------------------------
#-- BRQX_UNIX - BRQX_WEB - BRQX_TEM
#-------------------------------------------------------------------

#-Variables enlazado BRQX
# Debemos mantenerlas pues se usan como referencia (BRQX_PROD)

BRQX_PROD=/brqx/base/
BRQX_BASE=${BRQX_PROD}
BRQX_LNK=/brqx/lnk/
BRQX_PACK=/brqx/pack/
BRQX_PLIVE=/brqx/plive/
BRQX_PERS=/brqx/pers/

#-Variables arquitectura BRQX
#- Hay cambios a nivel de contemplates

BRQX_UNIX=/brqx/arquitectura/unix/
BRQX_WEB=/brqx/arquitectura/web/
BRQX_TEM=/brqx/arquitectura/drupal/contemplates/



