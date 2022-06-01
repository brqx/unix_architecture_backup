#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 5.0"          #  Version del Script actual
FECHA_SCRIPT="Febrero 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="main"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="utils"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-==================================================================
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- cambiar_inicial
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- RANDOM
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Obtiene numeros aleatorios en Unix / bashCambia la inicial de todos los archivos de la carpeta actual 
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T cambio inicial
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [letra_inicial]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E cambiar_inicial  a - Cambia la inicial de los ficheros
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

cambiar_inicial()
{
IS_cambiar_inicial="Cambia la inicial de los ficheros"
INFO_SCRIPT=${IS_cambiar_inicial}

INICIAL=$1


if [ "${INICIAL}" == "" ] ; then
INICIAL="a"
fi

if [ "${INICIAL}" == "-?" ] ; then
	
e_pmt cambiar_inicial "letra"
else

#-Pendiente de ajustar a espacios
echo "Vamos a cambiar archivos al usuario : ${MULTIUSUARIO}"
for i in *; do mv $i ${INICIAL}$(echo "$i" | cut -c2-); done

fi  
}
