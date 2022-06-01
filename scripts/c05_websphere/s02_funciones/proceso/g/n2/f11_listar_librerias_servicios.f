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
#-- listar_librerias_servicios
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- linea_normal - linea_alterna - linea_caracter
#-------------------------------------------------------------------
#-- WEBSPHERE_APPS
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lista las librerias del was definidas por aplicacion
#-------------------------------------------------------------------
#A pensada para utilizar con ver_libreria_was_app
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
#E listar_librerias_servicios 	--	Lista las librerias del was definidas por cada app
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 


#-La idea es que te muestre el endpoint de un servicio indicado
#-Mini alias wsdl

listar_librerias_servicios()
{
IS_listar_librerias_servicios="Lista las aplicaciones instaladas"
INFO_SCRIPT=${IS_listar_librerias_servicios}

INFO=${1}

if [ "${INFO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt listar_librerias_servicios

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-Sacamos el listado de todas las aplicaciones
listar_apps_was
LISTA_SERVICIOS=${SALIDA_listar_apps_was}

for i in ${LISTA_SERVICIOS}
do
#-Mostramos las librerias de los servicios
ver_librerias_app_was ${i}

#-Debemos saber si el servicio no esta disponible

echo " "

done

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

