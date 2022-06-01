#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
FECHA_SCRIPT="Julio 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="websphere"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="proceso"
CONCEPT_VARIANTE_04="celda"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- ver_variables
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- WEBSPHERE_CELL
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Muestra las variables de la celda
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T variables was
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E ver_variables	-- Saca las librerias definidas en la celda
#-------------------------------------------------------------------
#E vv $WEBSPHERE_SERVER	-- Saca las librerias definidas en el servidor
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias vv
#-- Por defecto buscara en la celda, sino hay que pasarle la ruta para que sea nodo o servidor
ver_variables()
{
IS_ver_variables="Saca las variables definidas en la celda"
INFO_SCRIPT=${IS_ver_variables}

RUTA_VARIABLES=$1

if [ "${RUTA_VARIABLES}" == "" ] ; then
#- Si no se pasa ruta entonces coge la de la celda
RUTA_VARIABLES=${WEBSPHERE_CELL}
fi

#-Ahora vemos como componer la ruta
##./config/cells/LES000900304Node02Cell/nodes/LES000900304Node02/servers/server1/variables.xml
#
#- Tenemos tres posibles rutas 
##./cells/LES000900304Node02Cell/nodes/LES000900304Node02/variables.xml
##./cells/LES000900304Node02Cell/nodes/LES000900304Node02/servers/server1/variables.xml
##./cells/LES000900304Node02Cell/variables.xml

FICHERO=${RUTA_VARIABLES}variables.xml

cat ${FICHERO} | grep "entries" >> /dev/null
HAY_VARIABLES=$?

if [ "${HAY_VARIABLES}" == "0" ] ; then 

cat $FICHERO | grep entries | while read LINEA_VARIABLE
do
#- La base vemos que funciona

NOMBRE_VARIABLE=$( echo ${LINEA_VARIABLE} | cut -d '"' -f4 )
VALOR_VARIABLE=$( echo ${LINEA_VARIABLE} | cut -d '"' -f6 )

echo "${NOMBRE_VARIABLE}  - ${VALOR_VARIABLE}"

done

else

e_pmi ver_variables "No encuentra variables definidas en la ruta ${RUTA_VARIABLES}"

fi

}


