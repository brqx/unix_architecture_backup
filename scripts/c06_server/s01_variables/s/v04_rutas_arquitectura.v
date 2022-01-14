#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="V 7.4"          #  Version del Script actual
FECHA_SCRIPT="Mayo 2013"
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
#-- ARQ - ARQV2 - ARQWEB - ARQUNX - MAV
#-------------------------------------------------------------------
#-- BIBLIOTECAS_LOCALES - BIBLIOTECAS_MAVEN - ARTEFACTOS_MAVEN
#-------------------------------------------------------------------
#-- LOGS_APLICACIONES_ARQUITECTURA - WPS_LOGS_APLICACIONES
#-------------------------------------------------------------------
#-- WPS_LOGS_MAVEN
#-------------------------------------------------------------------

#-SERVER_CHANGE-  -- Cambios especificos de servidor

#-- Arquitectura Web

ARQWEB=/brqx/arquitectura/web/
ARQUNX=/brqx/arquitectura/unix/

#-- Ajuste para servidor - cambiado para pruebas en local 

ARQ=/opt/bibliotecas_arquitectura/arqos/
ARQV2=/opt/bibliotecas_arquitectura/v2/
MAV=/opt/bibliotecas_maven/

#-------------------------------------------------------------------
#- Ruta Bibliotecas de Mapfre - Arquitectura
#-------------------------------------------------------------------

#-Configuracion comun - Librerias WAS
BIBLIOTECAS_LOCALES=/opt/bibliotecas_arquitectura/
BIBLIOTECAS_MAVEN=/opt/bibliotecas_maven/

#-Repositorio Local de artefactos
LIBRERIAS_MAVEN=/opt/librerias_maven/
ARTEFACTOS_MAVEN=/opt/artefactos_maven/

HISTORICO_LIBRERIAS_MAVEN=${LIBRERIAS_MAVEN}zv/
HISTORICO_ARTEFACTOS_MAVEN=${ARTEFACTOS_MAVEN}zv/
#-------------------------------------------------------------------
#- Ruta Logs de Mapfre - Arquiectura
#-------------------------------------------------------------------

LOGS_APLICACIONES_ARQUITECTURA=/opt/logsARQUITECTURA/

WPS_LOGS_APLICACIONES=/opt/logsARQUITECTURA/

WPS_LOGS_MAVEN=/tmp/LOGS_ARQOS/

