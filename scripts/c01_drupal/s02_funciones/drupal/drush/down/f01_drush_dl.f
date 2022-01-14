#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="5.1" #  Version del Script actual
FECHA_SCRIPT="Febrero 2011"
STATUS_SCRIPT="Pendiente"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="drupal"
CONCEPT_MOLDE_04="funcion"
CONCEPT_ARQUETIPO_04="drush"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- ddl		--> Drush download
#-====----========----========----========----========----========--
#- Drupal Drush - La shell de drupal (requiere que esté instalada )
#-====----========----========----========----========----========--
#-- Parametros :
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- 1. Componente a descargar ( por defecto el de la ruta actual )
#-------------------------------------------------------------------
#-- Ejemplos :
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- ddl 
#-------------------------------------------------------------------
#-- ddl cck
#-------------------------------------------------------------------
#-- ddl cck 6.x-1.x-dev
#-==================================================================

ddl()
{
INFO_SCRIPT="baja la ultima version del modulo indicado o por ruta o por parametro"

# La idea es generar drush dl modulo-version-subversion
#

NUMERO_PARAMETROS=$#
MODULO=
VERSION=


# No se han pasado los 3 parametros
case ${NUMERO_PARAMETROS} in
'2' )
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#- Estamos en este caso
#-------------------------------------------------------------------
#- ddl cck 6.x-1.x-dev
#-------------------------------------------------------------------

MODULO=$1
VERSION=$2
;;
'1' )
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#- Estamos en este caso
#-------------------------------------------------------------------
#- ddl cck 
#-------------------------------------------------------------------
MODULO=$1
VERSION=1.x
;;
'0' )
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#- Estamos en este caso
#-------------------------------------------------------------------
#- ddl
#-------------------------------------------------------------------
MODULO=`basename $PWD`
VERSION=1.x
;;
esac

#- Lanzamos Drush

drush dl ${MODULO} ${VERSION}

#-====----========----========----========----========----========--
}

#-------------------------------------------------------------------
#+ Sistema de trazado N4 - desactivado
#-------------------------------------------------------------------
#N4# echo "$LEVEL_NIVEL	-	Ejecutadas $CONCEPT_LEVEL"
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================
