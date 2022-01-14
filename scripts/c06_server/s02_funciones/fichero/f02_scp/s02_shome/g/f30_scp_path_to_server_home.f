#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.2"          #  Version del Script actual
FECHA_SCRIPT="Octubre 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- cf_to_server_home
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - ch - get_ssh_var_raiz
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Copia ficheros a otro servidor de forma parametrizada
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T copia ficheros ssh servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [usuario] [servidor] [puerto] ficheros 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E cf_to_server_home ibm core 22 fich1.a
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------

#-------------------------------------------------------------------
#- Posible alias cth / cfh 
#- La idea es que copia el path actual respetando el home de cada servidor
#-------------------------------------------------------------------
# RAIZ=/brqx/arquitectura/
#-------------------------------------------------------------------
# RAIZ=/home/ibm/
#-------------------------------------------------------------------

#- Necesitamos una funcion para obtener una variable de un servidor destino

#- Mini Alias cfh 
cf_to_server_home()
{
IS_cf_to_server_home="Copia ficheros a un servidor via SSH respetando el home"
INFO_SCRIPT=${IS_cf_to_server_home}

##USUARIO_CONEXION=root
##USUARIO_CONEXION=ibm
##USUARIO_CONEXION=ricabel

#- Por defecto no se indicara puerto y el usuario sera el mio : ibm


USUARIO_CONEXION=${1}
SERVER=${2}
PORT=${3}
FICHEROS=${4}

if [ "${USUARIO_CONEXION}" == "" ]; then
## Activamos un servidor por defecto
	USUARIO_CONEXION=ibm
##	SERVER=ibrqx
fi  


if [ "${SERVER}" == "" ]; then
## Activamos un servidor por defecto
	SERVER=frontal
##	SERVER=ibrqx
fi  

#- No activamos puerto. Activar en casa

if [ "${PORT}" == "" ]; then
## Activamos un puerto por defecto
	PORT=22
fi  

#- Debemos asegurarnos primero que hay algo que copiar

if [ "${FICHEROS}" != "" ]; then
USUARIO_CONEXION="-?"
fi

if [ "${USUARIO_CONEXION}" == "-?" ]; then
e_pmt cf_to_server_home "usuario host port"
else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------


#- Copiara a la misma ruta
src=${PWD};
#- Aqui vamos a obtener la ruta remota

get_ssh_var_raiz_rct ${USUARIO_CONEXION} ${SERVER} ${PORT}

#- lA variable es RETURN_VALOR_VARIABLE_REMOTA

LONGITUD_RAIZ=$( echo ${RCT} | wc -c)
RUTA_SIN_RAIZ=$( echo ${PWD} | cut -c${LONGITUD_RAIZ}- )
RUTA_FINAL_REMOTA=${RETURN_VALOR_VARIABLE_REMOTA}${RUTA_SIN_RAIZ}


echo "Copiando Desde : ${src} : ${PORT} "
echo "Hacia ruta     : ${SERVER}::${RUTA_FINAL_REMOTA} : $PORT "

# Suponemos que lo hacemos desde la ruta actual en el servidor origen

scp -r -P ${PORT} ${FICHEROS}  ${USUARIO_CONEXION}@${SERVER}:${RUTA_FINAL_REMOTA}

#-------------------------------------------------------------------
#- Vaciamos variables pues no son de arquitectura
#-------------------------------------------------------------------
USUARIO_CONEXION=
FICHEROS=
SERVER=
PORT=
LONGITUD_RAIZ=
RUTA_SIN_RAIZ=
RUTA_FINAL_REMOTA=

#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi
}

#-------------------------------------------------------------------
#+ Sistema de trazado N5 - parametrizado
#-------------------------------------------------------------------
if [ "${N5}" != "" ] ; then
echo "${LEVEL_NIVEL_05}/${LEVEL_NIVEL}--${CONCEPT_LEVEL_05}"
fi
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================
