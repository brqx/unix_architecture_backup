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
#-- ver_librerias_app_was
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- linea_normal - linea_alterna - linea_caracter
#-------------------------------------------------------------------
#-- get_librerias_app_was
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lista las librerias definidas para la aplicacion indicada
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T listado perfiles websphere 
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P LINEA_CARPETA_Y_ARCHIVO
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E ver_librerias_app_was ARQ_GesSolPres_SMED		--		Ver el endpoint del wsdl
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 


#-La idea es que te muestre el endpoint de un servicio indicado
#-Mini alias verlibs

ver_librerias_app_was()
{
IS_ver_librerias_app_was="Devuelve las librerias asociadas a dicha aplicacion"
INFO_SCRIPT=${IS_ver_wsdl_endpoint}

SERVICIO_PASADO=${1}

if [ "${SERVICIO_PASADO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ver_librerias_app_was "Servicio Pasado"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

get_librerias_app_was ${SERVICIO_PASADO}
LISTADO_LIBRERIAS_APP=${SALIDA_get_librerias_app_was}

if [ "${LISTADO_LIBRERIAS_APP}" != "" ] ;  then
#-Devuelve librerias

linea_caracter "=="
echo "Librerias para el servicio ${SERVICIO_PASADO} "
linea_caracter "=-"

for i in ${LISTADO_LIBRERIAS_APP} ; do
#-Indicamos cada una de las librerias
echo "$i"

done
linea_caracter "=="

else
linea_caracter "=="
echo "Error en el servicio ${SERVICIO_PASADO}    "
linea_caracter "=-"

fi

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

