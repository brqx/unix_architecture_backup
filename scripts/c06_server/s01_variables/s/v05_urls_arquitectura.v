#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 7.2"          #  Version del Script actual
FECHA_SCRIPT="Marzo 20112"
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
#-- RUTA_NEXUS_GLOBAL - RUTA_NEXUS_RELEASES - RUTA_NEXUS_SNAPSHOTS
#-------------------------------------------------------------------
#-- RUTA_POLARION_GLOBAL
#-------------------------------------------------------------------

#-SERVER_CHANGE-  - Cambios especificos de servidor

#- Asociacion CVS - MAVEN - MVN - SVN 

RUTA_NEXUS_GLOBAL=http://nexus:8080/nexus/content/repositories/

#- Nexus Releases y Snapshots

RUTA_NEXUS_RELEASES=${RUTA_NEXUS_GLOBAL}releases/

RUTA_NEXUS_SNAPSHOTS=${RUTA_NEXUS_GLOBAL}snapshots/

#- Acceso librerias

RUTA_NEXUS_RELEASES_LIBS=${RUTA_NEXUS_RELEASES}com/mapfre/dgtp/aaa/arqos/

RUTA_NEXUS_SNAPSHOTS_LIBS=${RUTA_NEXUS_SNAPSHOTS}com/mapfre/dgtp/aaa/arqos/



#- Acceso aplicaciones releases / snapshots

##http://nexus:8080/nexus/content/repositories/releases/com/mapfre/dgtp/aaa/taller/AAA_TALLERARQOS_FEAR/11.2.0/

RUTA_NEXUS_RELEASES_APPS=${RUTA_NEXUS_RELEASES}com/mapfre/dgtp/aaa/taller/

RUTA_NEXUS_SNAPSHOTS_APPS=${RUTA_NEXUS_SNAPSHOTS}com/mapfre/dgtp/aaa/taller/

#- Acceso aplicacion Rest Dispatcher

RUTA_NEXUS_RELEASES_REST_DISPATCHER=${RUTA_NEXUS_RELEASES}com/mapfre/dgtp/cosym/dispatcher/

RUTA_NEXUS_SNAPSHOTS_REST_DISPATCHER=${RUTA_NEXUS_SNAPSHOTS}com/mapfre/dgtp/cosym/dispatcher/


#- Acceso aplicacion Gesautoriza

RUTA_NEXUS_RELEASES_GESAUTORIZA=${RUTA_NEXUS_RELEASES}com/mapfre/dgtp/gesautoriza/

RUTA_NEXUS_SNAPSHOTS_GESAUTORIZA=${RUTA_NEXUS_SNAPSHOTS}com/mapfre/dgtp/gesautoriza/

#- Acceso aplicaciones de Emision

RUTA_NEXUS_RELEASES_EVT21=${RUTA_NEXUS_RELEASES}com/mapfre/dgtp/otcid/productos/

RUTA_NEXUS_SNAPSHOTS_EVT21=${RUTA_NEXUS_SNAPSHOTS}com/mapfre/dgtp/otcid/productos/

#- Acceso aplicacion Area Clientes

##repositories/dgtp/com/mapfre/dgtp/cci/area_clientes/areaclientes_FEAR/0.0.1/areaclientes_FEAR-0.0.1.ear

RUTA_NEXUS_RELEASES_AREA_CLIENTES=${RUTA_NEXUS_RELEASES}com/mapfre/dgtp/cci/area_clientes/

RUTA_NEXUS_SNAPSHOTS_AREA_CLIENTES=${RUTA_NEXUS_SNAPSHOTS}com/mapfre/dgtp/cci/area_clientes/

#- Acceso Gestion de Tareas

RUTA_POLARION_GLOBAL=http://svndgtp/polarion/


