#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 7.1"          #  Version del Script actual
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
#-- APACHE_HOME - APACHE_GLOBAL - APACHE_AUTO
#-------------------------------------------------------------------
#- Servidores web y servicios - Apache

#- Ruta Base de Apache
APACHE_HOME=/opt/apache-2.0.54/

#- Ruta de acceso a la configuracion de Apache
APACHE_GLOBAL=/mnt/webconf/http2/

#- Ruta de acceso a los logs de los servidores sin conocer el mismo
APACHE_AUTO=/mnt/webconf/http2/auto_logs/


