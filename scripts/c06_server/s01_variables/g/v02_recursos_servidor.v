#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 7.3"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2012"
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
#-- RECURSOS - RECSERVS - RS_CONN - RS_SITE - RECFOTOS
#-------------------------------------------------------------------

#SC-SERVER_CHANGE-  -- Cambios especificos de servidor

#-Ruta acceso a recursos del servidor. Ficheros de propiedades de control
RECURSOS=${RCT}zrecursos/

#-Recursos - Gestion de servidores
RECSERVS=${RECURSOS}servidores/

#-Debemos ajustar mas los recursos indicando si es para test o connect o informacion de los sites

#-- Recursos enfocados a conectividad
RS_CONN=${RECSERVS}conn/

#-- Recursos enfocados en configuracion de servidores
RS_SERV=${RECSERVS}server/

#-- Recursos enfocados en configuracion de sites
RS_SITE=${RECSERVS}site/

#-Recursos - Gestion de fotos
RECARQ=${RECURSOS}arquitectura/


#-Recursos - Gestion de fotos
RECFOTOS=${RECURSOS}fotos/

#-Recursos - Colecciones cards - servilletas - palillos
RECCARDS=${RECURSOS}colecciones/

#-Repositorio listado de viajes

REPO_VIAJES=/brqx/images/fotos/


#-------------------------------------------------------------------
