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
#-- ver_oracle_jdbc_providers
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- WEBSPHERE_CELL
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Muestra los proveedores JDBC de la celda
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T oracle jdbc was
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E ver_oracle_jdbc_providers	-- Saca los alias definidas en la celda
#-------------------------------------------------------------------
#E vjdbcpro $WEBSPHERE_SERVER	-- Saca los proveedores JDBC definidas en el servidor
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias vjdbcpro
#-- Por defecto buscara en la celda, sino hay que pasarle la ruta para que sea nodo o servidor
ver_oracle_jdbc_providers()
{
IS_ver_oracle_jdbc_providers="Saca los proveedores JDBC definidos en la celda"
INFO_SCRIPT=${IS_ver_oracle_jdbc_providers}

# Le pasamos como parametro el numero de perfil - segun arquitectura

RUTA_VARIABLES=$1

if [ "${RUTA_VARIABLES}" == "" ] ; then
#- Si no se pasa ruta entonces coge la de la celda
RUTA_VARIABLES=${WEBSPHERE_CELL}
fi

#-Ahora vemos como componer la ruta
#
#- Tenemos tres posibles rutas 

FICHERO=${RUTA_VARIABLES}resources.xml

cat ${FICHERO} | grep "<resources.jdbc:JDBCProvider" >> /dev/null
HAY_VARIABLES=$?

if [ "${HAY_VARIABLES}" == "0" ] ; then 

cat $FICHERO | grep "<resources.jdbc:JDBCProvider" | while read LINEA_VARIABLE
do
#- La base vemos que funciona

NOMBRE_VARIABLE=$( echo ${LINEA_VARIABLE} | cut -d '"' -f6 )
VALOR_VARIABLE=$( echo ${LINEA_VARIABLE} | cut -d '"' -f10 )

echo "${NOMBRE_VARIABLE}  - ${VALOR_VARIABLE}"

done

else

e_pmi ver_oracle_jdbc_providers "No encuentra proveedores definidos en la ruta ${RUTA_VARIABLES}"

fi

}


