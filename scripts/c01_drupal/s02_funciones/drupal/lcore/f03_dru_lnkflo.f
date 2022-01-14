#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
FECHA_SCRIPT="Junio 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="drupal"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="lcore"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- druflo
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#--
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Drupal Link - Enlace versiones certificads de drupal en proyectos
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generacion enlaces drupal pressflow
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P Version_Drupal
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E druflo  - Genera estructura de carpetas contra Pressflow
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 


druflo()
{
IS_druflo="Genera los links de una estructura de carpetas Pressflow"
INFO_SCRIPT=${IS_druflo}


VERSION_DRUPAL=$1

if [ "${VERSION_DRUPAL}" == "" ] ; then
VERSION_DRUPAL=60
fi

RUTA_ACTUAL=${PWD}
ENFOQUE_DEFECTO=test
SITUACION=OK

# Lo primero que hay que ver es que se lanze o no desde el home o desde una 
# ruta de subdominio

if [ "${RUTA_ACTUAL}" = "/home" ] ; then
#-====----========----========----========----========----========--
#-echo "Se lanza desde el home"
#- Se lanza desde el home y no se ha pasado parametro, es un error
SITUACION=FALLO

#-====----========----========----========----========----========--
fi

if [ "${VERSION_DRUPAL}" == "-?" ] ; then

e_pmp drul "version"

else
#--- INICIO FUNCION ---

if [ "${SITUACION}" = "FALLO"  ] ; then
#-====----========----========----========----========----========--
echo "No se puede enlazar proyectos desde el home del servidor"

#-------------------------------------------------------------------
else
#-------------------------------------------------------------------

unlink includes 
unlink misc 
unlink modules 
unlink profiles 
unlink themes 
unlink scripts

ln -s /brqx/lnk/druflo/v${VERSION_DRUPAL}/core/modules ./modules
ln -s /brqx/lnk/druflo/v${VERSION_DRUPAL}/core/themes ./themes
ln -s /brqx/lnk/druflo/v${VERSION_DRUPAL}/core/includes ./includes
ln -s /brqx/lnk/druflo/v${VERSION_DRUPAL}/core/profiles ./profiles
ln -s /brqx/lnk/druflo/v${VERSION_DRUPAL}/core/scripts ./scripts
ln -s /brqx/lnk/druflo/v${VERSION_DRUPAL}/core/misc ./misc

echo "Enlace agil Core Drupal - ${VERSION_DRUPAL} : $PWD"

fi
#-====----========----========----========----========----========--
fi
}


