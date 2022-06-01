#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
FECHA_SCRIPT="Junio 2016"
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
#-- xnb
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- xnb_exec
#-------------------------------------------------------------------
#- Ejemplos
#-------------------------------------------------------------------
#- xnb pathauto	     : Debe generar el link de pathauto con la 5.0
#--
#- xnb pathauto 70
#- xnb pathauto 80   : Link to 80 yml
#- xnb m pathauto    
#--
#- xnb t activesite  : Debe generar el link de activesite con la version 5.0
#- xnb m pathauto 70 : Debe generar el link de pathauto con la version 70 
#-==================================================================
#- Debe actualizar la ruta ZRU con el modulo o lista de modulos a probar

#- Enlace agil contra modulos de produccion
#-- Recive como parametro :
#-- 1. Tipo de componente
#-- 2. Nombre del componente
#-- 3. Version de Drupal ( por defecto 5.0 )

xnb()
{
#- Vamos a preparar la secuencia de parametros para que sea unica
#- El tipo puede ser modules, themes
INICIAL_COMPONENTE=$1
NOMBRE_COMPONENTE=$2
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
COMPONENTE_PASADO=${NOMBRE_COMPONENTE}
;;
'2' )
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#- xnb pathauto 70
#- xnb m pathauto    
#-------------------------------------------------------------------
if [ "${INICIAL_COMPONENTE}" = "m" ] ; then
# Entonces se ha pasado el tipo de componente
#- xnb m pathauto
COMPONENTE_PASADO=${NOMBRE_COMPONENTE}
TIPO_COMPONENTE=modules
VERSION_DRUPAL=70

elif [ "${INICIAL_COMPONENTE}" = "t" ] ; then
#- xnb t activesite
TIPO_COMPONENTE=themes
COMPONENTE_PASADO=${NOMBRE_COMPONENTE}
VERSION_DRUPAL=70

else
#- xnb path 60
# Entonces se ha pasado nombre de modulo
VERSION_DRUPAL=${NOMBRE_COMPONENTE} 
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
	xnb_exec ${TIPO_COMPONENTE} ${COMPONENTE_PASADO} ${VERSION_DRUPAL}
else
#- No se han pasado los argumentos correctos
	e_pmi xnb "Error : ${ERROR}"
fi



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
