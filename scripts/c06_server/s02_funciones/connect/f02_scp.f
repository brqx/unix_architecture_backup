#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
LEVEL_NIVEL_05=05
CONCEPT_MOLDE_05="funciones"
CONCEPT_ARQUETIPO_05="connect"
CONCEPT_LEVEL_05="Script $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- con_scp
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#- Hace una conexion segura contra un site
#-------------------------------------------------------------------
#-- Recive como parametros :
#-------------------------------------------------------------------
#-- 1. Usuario del host a conectarse
#-- 2. Ip del host a conectarse
#-- 3. Puerto del host a conectarse
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
# con_scp  --> Conexion por defecto al servidor 61
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-------------------------------------------------------------------
#- Este script esta para recordar como funciona scp, pues su parametrizacion
#  es demasiado compleja para usarse
#-------------------------------------------------------------------

con_scp()
{
USUARIO_CONEXION=$1
IP_CONEXION=$2
PUERTO_CONEXION=$3

FICHEROS_ORIGEN=$4
FICHEROS_DESTINO=$5

# Por defecto root
if [ "$USUARIO_CONEXION" == "" ] ;  then
USUARIO_CONEXION=root
fi

# Por defecto servidor 61
if [ "$IP_CONEXION" == "" ] ;  then
IP_CONEXION=204.61.222.61
fi

if [ "$PUERTO_CONEXION" == "" ] ;  then
PUERTO_CONEXION=65533
fi


if [ "${USUARIO_CONEXION}" == "" ] ;  then
#-==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
echo "Los parametros pasados no son correctos"

else
#-------------------------------------------------------------------

scp -P ${PUERTO_CONEXION} ${FICHEROS_ORIGEN}  ${USUARIO_CONEXION}@${IP_CONEXION}:${FICHEROS_DESTINO}
# scp -P 65533 ./script2010.tar.gz root@204.61.222.22:/root

#-==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
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
