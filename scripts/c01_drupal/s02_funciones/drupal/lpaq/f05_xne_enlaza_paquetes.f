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
#-- xne
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- xne_exec
#-------------------------------------------------------------------
#- Ejemplos
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#- xne pathauto		: Debe generar el link de pathauto en el paquete bas
#- xne pathauto dev     : Debe generar el link de pathauto en el paquete dev
#--
#- xne pathauto bas 70  : Debe generar link pathauto, paquete bas y version 7.0 de Drupal
#--
#- xne t activesite bas	   : Debe generar el link de activesite para el paquete de temas bas
#- xne t activesite bas 60 : Debe generar el link de (activesite, bas, 60 )

#-==================================================================

#- Enlace agil contra modulos de produccion
#-- Recive como parametro :
#-- 1. Tipo de componente ( por defecto modules )
#-- 2. Nombre del componente
#-- 3. Paquete ( por defecto bas )
#-- 4. Version de Drupal ( por defecto 5.0 )

xne()
{
#- Vamos a preparar la secuencia de parametros para que sea unica

INICIAL_COMPONENTE=$1
NOMBRE_COMPONENTE=$2
PAQUETE_PASADO=$3
VERSION_DRUPAL=$4
ERROR=""

NUMERO_PARAMETROS=$#

# No se han pasado los 3 parametros
case ${NUMERO_PARAMETROS} in 
'4' )
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Se han pasado los cuatro parametros y el cuarto debe ser la version de Drupal
# El tercero debe ser el paquete
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
PAQUETE_COMPONENTE=${PAQUETE_PASADO}
;;


'3' )
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Se han pasado los tres parametros y el tercero debe ser la version de Drupal
# El segundo debe ser el componente a enlazar
# El primero es o una m o una t
#-------------------------------------------------------------------
#- xne pathauto bas 70
#- xne m pathauto bas   
#-------------------------------------------------------------------
##INICIAL_COMPONENTE=$1
##NOMBRE_COMPONENTE=$2
##PAQUETE_PASADO=$3

##${TIPO_COMPONENTE} ${COMPONENTE_PASADO} ${PAQUETE_COMPONENTE} ${VERSION_DRUPAL}
#-------------------------------------------------------------------
if [ "${INICIAL_COMPONENTE}" = "m" ] ; then
##--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
# Entonces se ha pasado el tipo de componente
TIPO_COMPONENTE=modules
COMPONENTE_PASADO=${NOMBRE_COMPONENTE}

#- Necesitamos saber de alguna forma si el tecer parametro es una version de drupal
#- Una forma puede ser un cero al final
CERO_FINAL=`echo ${PAQUETE_PASADO}  | cut -c2`

if [ "${CERO_FINAL}" == "0" ]; then
#- Es la version de Drupal
VERSION_DRUPAL=${PAQUETE_PASADO}
else
#- Sabemos que no es la version de drupal, en tonces sera el paquete
VERSION_DRUPAL=70
PAQUETE_COMPONENTE=${PAQUETE_PASADO}
fi
##----====----====----====----====----====----====----====----====--
elif [ "${INICIAL_COMPONENTE}" = "t" ] ; then
##--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
TIPO_COMPONENTE=themes
COMPONENTE_PASADO=${NOMBRE_COMPONENTE}

if [ "${CERO_FINAL}" == "0" ]; then
#- Es la version de Drupal
VERSION_DRUPAL=${PAQUETE_PASADO}
else
#- Sabemos que no es la version de drupal, en tonces sera el paquete
VERSION_DRUPAL=70
PAQUETE_COMPONENTE=${PAQUETE_PASADO}
fi
##----====----====----====----====----====----====----====----====--
else
#- xne pathauto bas 70
##--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#- Sabemos que no es ninguna inicial ni m ni t
VERSION_DRUPAL=${PAQUETE_PASADO}
PAQUETE_COMPONENTE=${NOMBRE_COMPONENTE}
COMPONENTE_PASADO=${INICIAL_COMPONENTE}
##----====----====----====----====----====----====----====----====--
fi
;;
'2' )
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#- xne pathauto bas
#- xne m pathauto    
#-------------------------------------------------------------------
if [ "${INICIAL_COMPONENTE}" = "m" ] ; then
##--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
# Entonces se ha pasado el tipo de componente
#- xne m pathauto
COMPONENTE_PASADO=${NOMBRE_COMPONENTE}
TIPO_COMPONENTE=modules
VERSION_DRUPAL=70
PAQUETE_COMPONENTE=bas
##----====----====----====----====----====----====----====----====--
elif [ "${INICIAL_COMPONENTE}" = "t" ] ; then
##--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#- xne t activesite
TIPO_COMPONENTE=themes
COMPONENTE_PASADO=${NOMBRE_COMPONENTE}
VERSION_DRUPAL=70
PAQUETE_COMPONENTE=bas
##----====----====----====----====----====----====----====----====--
else
##--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#- xne path bas
#- xne patuto 70
##INICIAL_COMPONENTE=$1
##NOMBRE_COMPONENTE=$2
##${TIPO_COMPONENTE} ${COMPONENTE_PASADO} ${PAQUETE_COMPONENTE} ${VERSION_DRUPAL}

# Entonces se ha pasado nombre de modulo

CERO_FINAL=`echo ${NOMBRE_COMPONENTE}  | cut -c2`

if [ "${CERO_FINAL}" == "0" ]; then
#- Es la version de Drupal
VERSION_DRUPAL=${NOMBRE_COMPONENTE}
PAQUETE_COMPONENTE=bas
else
#- Sabemos que no es la version de drupal, en tonces sera el paquete
VERSION_DRUPAL=70
PAQUETE_COMPONENTE=${NOMBRE_COMPONENTE}
fi
COMPONENTE_PASADO=${INICIAL_COMPONENTE}	
TIPO_COMPONENTE=modules

##----====----====----====----====----====----====----====----====--
fi
;;
'1' )
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# En esta ocasion solo se le pasa el modulo
#-------------------------------------------------------------------
VERSION_DRUPAL=70
TIPO_COMPONENTE=modules
COMPONENTE_PASADO=${INICIAL_COMPONENTE}	
PAQUETE_COMPONENTE=bas
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
	echo "Sel: ${TIPO_COMPONENTE} ${COMPONENTE_PASADO} ${PAQUETE_COMPONENTE} ${VERSION_DRUPAL}"
	xne_exec ${TIPO_COMPONENTE} ${COMPONENTE_PASADO} ${PAQUETE_COMPONENTE} ${VERSION_DRUPAL}
else

e_pmi xne "Error : ${ERROR}"
fi



#-------------------------------------------------------------------

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
