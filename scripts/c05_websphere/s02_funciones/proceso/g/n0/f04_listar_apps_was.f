#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Enero 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="websphere"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="proceso"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- listar_apps_was
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- linea_normal - linea_alterna - linea_caracter
#-------------------------------------------------------------------
#-- WEBSPHERE_APPS
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lista los perfiles en el entorno websphere indicado
#-------------------------------------------------------------------
#A pensada para utilizar con ver_wsdl
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T listado aplicaciones instaladas
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E listar_apps_was 	--		Lista las aplicaciones del was
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 


#-La idea es que te muestre el endpoint de un servicio indicado
#-Mini alias wsdl

listar_apps_was()
{
IS_listar_apps_was="Lista las aplicaciones instaladas"
INFO_SCRIPT=${IS_listar_apps_was}

INFO=${1}

if [ "${INFO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt listar_apps_was 

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

RUTA_WSDL_GLOBAL=${WEBSPHERE_APPS}

LISTA_APLICACIONES=$(ls -1 ${RUTA_WSDL_GLOBAL} | grep App.ear | grep -v ivtApp.ear | grep -v BPCIVTApp.ear | sed "s/App.ear//g" | tr "\n" " " )

#-Devolvemos el listado de las aplicaciones

SALIDA_listar_apps_was=${LISTA_APLICACIONES}

#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi
}

#-------------------------------------------------------------------
#+ Sistema de trazado N4 - desactivado
#-------------------------------------------------------------------
#N4# echo "$LEVEL_NIVEL	-	Ejecutadas $CONCEPT_LEVEL"
#-------------------------------------------------------------------

