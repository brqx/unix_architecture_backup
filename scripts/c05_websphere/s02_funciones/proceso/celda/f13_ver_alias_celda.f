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
#-- ver_alias
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- WEBSPHERE_CELL
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Muestra los alias de la celda
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T alias was
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E ver_alias	-- Saca los alias definidas en la celda
#-------------------------------------------------------------------
#E va $WEBSPHERE_SERVER	-- Saca los alias definidas en el servidor
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias va
#-- Por defecto buscara en la celda, sino hay que pasarle la ruta para que sea nodo o servidor
ver_alias()
{
IS_ver_alias="Saca las variables definidas en la celda"
INFO_SCRIPT=${IS_ver_alias}

# Le pasamos como parametro el numero de perfil - segun arquitectura
#- Este es mas especial, pues solo existe a nivel de celda

RUTA_VARIABLES=

if [ "${RUTA_VARIABLES}" == "" ] ; then
#- Si no se pasa ruta entonces coge la de la celda
RUTA_VARIABLES=${WEBSPHERE_CELL}
fi

#-Ahora vemos como componer la ruta
#
#- Tenemos tres posibles rutas 

FICHERO=${RUTA_VARIABLES}security.xml

cat ${FICHERO} | grep "<authDataEntries" >> /dev/null
HAY_VARIABLES=$?

if [ "${HAY_VARIABLES}" == "0" ] ; then 

cat $FICHERO | grep "<authDataEntries" | while read LINEA_VARIABLE
do
#- La base vemos que funciona

ALIAS_VARIABLE=$( echo ${LINEA_VARIABLE} | cut -d '"' -f4 )
USUARIO_VARIABLE=$( echo ${LINEA_VARIABLE} | cut -d '"' -f6 )
DESC_VARIABLE=$( echo ${LINEA_VARIABLE} | cut -d '"' -f10 )
CLAVE_VARIABLE=$( ${RCT}decri.pl `echo ${LINEA_VARIABLE} | cut -d '"' -f8 ` )

echo "${ALIAS_VARIABLE}  - ${USUARIO_VARIABLE} - ${DESC_VARIABLE} - ${CLAVE_VARIABLE}"

done

else

e_pmi ver_alias "No encuentra alias definidos en la ruta ${RUTA_VARIABLES}"

fi

}


