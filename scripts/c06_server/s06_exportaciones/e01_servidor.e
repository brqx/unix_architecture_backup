#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 7.1"          #  Version del Script actual
FECHA_SCRIPT="Febrero 2012"
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
#-- Rutas del servidor 
#-------------------------------------------------------------------
#-- Librerias
#-------------------------------------------------------------------
#-- Recursos
#-------------------------------------------------------------------
#-- Variables de Apache
#-==================================================================

export BRQX_ROOT BRQX_TMP BRQX_SHM BRQX_BK BRQX_BKDB BRQX_BKFS BRQXTMP

export LIBRERIAS RECURSOS RECFOTOS RECARQ

export RECSERVS RS_CONN RS_SITE RS_SERV

export LIBRERIAS_PHP LIBRERIAS_PERL LIBRERIAS_PYTHON LIBRERIAS_JYTHON

export COMMON_SERVER_USER COMMON_SERVER_GROUP APACHE_SERVER_USER APACHE_SERVER_GROUP

#-------------------------------------------------------------------
