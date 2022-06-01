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
CONCEPT_ARQUETIPO_04="lpaq"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- xnp
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- xnp_exec
#-------------------------------------------------------------------
#+ Funciones definidos:
#-------------------------------------------------------------------
#-- xnp
#-------------------------------------------------------------------
#- Ejemplos
#-------------------------------------------------------------------
#- xnp bas	     : Debe generar el link de pathauto con la 5.0
#--
#- xnp bas 70
#- xnp m bas    
#--
#- xnp t dev 60  : Debe generar el link del paquete dev con la version 6.0
#-==================================================================


#- Enlace agil contra modulos de produccion
#-- Recive como parametro :
#-- 1. Tipo de componente
#-- 2. Nombre del paquete
#-- 3. Version de Drupal ( por defecto 7.0 )

xnp()
{
#- Vamos a preparar la secuencia de parametros para que sea unica
#- El tipo puede ser modules, themes
INICIAL_COMPONENTE=$1
PAQUETE_COMPONENTE=$2
VERSION_DRUPAL=$3
ERROR=""

NUMERO_PARAMETROS=$#

# No se han pasado los 3 parametros
case ${NUMERO_PARAMETROS} in 
'3' )
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Se han pasado los tres parametros y el tercero debe ser la version de Drupal
# El segundo debe ser el componente a enlazar
# El primero es o una m o una t
#-------------------------------------------------------------------
if [ "${INICIAL_COMPONENTE}" = "m" ] ; then
# Entonces se ha pasado el tipo de componente
TIPO_COMPONENTE=modules
elif [ "${INICIAL_COMPONENTE}" = "t" ] ; then
TIPO_COMPONENTE=themes
else
ERROR=TIPO_COMPONENTE
fi
COMPONENTE_PASADO=${PAQUETE_COMPONENTE}
;;
'2' )
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#- xnp bas 70
#- xnb m bas    
#-------------------------------------------------------------------
if [ "${INICIAL_COMPONENTE}" = "m" ] ; then
# Entonces se ha pasado el tipo de componente
#- xnp m bas
COMPONENTE_PASADO=${PAQUETE_COMPONENTE}
TIPO_COMPONENTE=modules
VERSION_DRUPAL=70

elif [ "${INICIAL_COMPONENTE}" = "t" ] ; then
#- xnp t dev
TIPO_COMPONENTE=themes
COMPONENTE_PASADO=${PAQUETE_COMPONENTE}
VERSION_DRUPAL=70

else
#- xnb path 60
# Entonces se ha pasado nombre de modulo
VERSION_DRUPAL=${PAQUETE_COMPONENTE} 
COMPONENTE_PASADO=${INICIAL_COMPONENTE}	
TIPO_COMPONENTE=modules
fi
;;
'1' )
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# En esta ocasion solo se le pasa el modulo
#-------------------------------------------------------------------
VERSION_DRUPAL=70
TIPO_COMPONENTE=modules
COMPONENTE_PASADO=${INICIAL_COMPONENTE}	
;;
esac


case $VERSION_DRUPAL in
'50' )
	echo "Seleccionado Drupal 5.0"
	;;
'60' )
	echo "Seleccionado Drupal 6.0"
	;;
'70' )
	echo "Seleccionado Drupal 7.0"
	;;
'80' )
	echo "Seleccionado Drupal 8.0"
	;;
'90' )
	echo "Seleccionado Drupal 9.0"
	;;

*)
	echo "Version de Drupal erronea"
	ERROR="${ERROR}	VERSION_DRUPAL:${VERSION_DRUPAL}"
	;;
esac

if [ "${ERROR}" == "" ] ; then
	echo "Sel: ${TIPO_COMPONENTE} ${COMPONENTE_PASADO} ${VERSION_DRUPAL}"
	xnp_exec ${TIPO_COMPONENTE} ${COMPONENTE_PASADO} ${VERSION_DRUPAL}
else
#- Informarmos del error
e_pmi xnp "Error : ${ERROR}"
fi


}
