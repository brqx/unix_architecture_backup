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
#-- ver_jdbc
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- WEBSPHERE_CELL
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Muestra los datasources JDBC de la celda
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
#E ver_jdbc	-- Saca los datasources definidos en la celda
#-------------------------------------------------------------------
#E ver_jdbc $WEBSPHERE_SERVER	-- Saca los datasources JDBC definidas en el servidor
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias vj
ver_jdbc()
{
IS_ver_jdbc="Saca los datasources JDBC definidos en la celda"
INFO_SCRIPT=${IS_ver_jdbc}

RUTA_VARIABLES=$1

if [ "${RUTA_VARIABLES}" == "" ] ; then
#- Si no se pasa ruta entonces coge la de la celda
RUTA_VARIABLES=${WEBSPHERE_CELL}
fi

# Primer bucle - resources

FICHERO=${RUTA_VARIABLES}resources.xml

cat ${FICHERO} | grep "resources.jdbc:DataSource" >> /dev/null
HAY_VARIABLES=$?

if [ "${HAY_VARIABLES}" == "0" ] ; then 

cont=0

#- Eliminamos el archivo transporte
rm -f $HOME/resoborra_2011.bor
rm -f $HOME/resoborro_2011.bor

# "<factories"

#-- Este formato es un poco chungo porque no conseguimos recuperar los valores

cat $FICHERO | grep "resources.jdbc:DataSource" | grep -v "Timer Service" | while read LINEA_VARIABLE
do
#- La base vemos que funciona - pero ahondando vemos que las variables no son visibles fuera

DATASOURCE[$cont]=$( echo ${LINEA_VARIABLE} | cut -d '"' -f6 )
NOMBRE_JNDI[$cont]=$( echo ${LINEA_VARIABLE} | cut -d '"' -f8 )
ALIAS_USUARIO[$cont]=$( echo ${LINEA_VARIABLE} | cut -d '"' -f16 )

echo "${cont}:${DATASOURCE[$cont]}:${NOMBRE_JNDI[$cont]}:${ALIAS_USUARIO[$cont]}" >> $HOME/resoborra_2011.bor

let cont++

done

#- Segundo bucle - 
cont=0

cat $FICHERO | grep "<resourceProperties" | grep jdbc:oracle:thin | while read LINEA_VARIABLE
do
#- La base vemos que funciona


URL_CONEXION[$cont]=$( echo ${LINEA_VARIABLE} | cut -d '"' -f8 )


echo "${cont}:${URL_CONEXION[$cont]}" >> ${HOME}/resoborro_2011.bor

let cont++

done

totalcont=$( cat $HOME/resoborro_2011.bor | wc -l )


#- Ahora el bucle salida
cont=0

while [ ${cont} -lt  ${totalcont} ]
do
LINEA_VARIABLE=$( cat $HOME/resoborra_2011.bor | grep "^${cont}" )
LINEA_VARIABLO=$( cat $HOME/resoborro_2011.bor | grep "^${cont}" )

DATASOURCE_A=$(echo ${LINEA_VARIABLE} | cut -d ":" -f2 )
NOMBRE_JNDI_A=$(echo ${LINEA_VARIABLE} | cut -d ":" -f3 )
ALIAS_USUARIO_A=$(echo ${LINEA_VARIABLE} | cut -d ":" -f4 )
URL_CONEXION_A=$(echo ${LINEA_VARIABLO} | cut -d ":" -f2- )

echo "${DATASOURCE_A}  - ${NOMBRE_JNDI_A} - ${ALIAS_USUARIO_A} - ${URL_CONEXION_A}"
let cont++
done

else

e_pmi ver_jdbc "No encuentra datasources definidos en la ruta ${RUTA_VARIABLES}"

fi

}


