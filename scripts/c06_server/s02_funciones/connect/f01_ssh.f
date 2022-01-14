#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.2"          #  Version del Script actual
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
#-- con_ssh
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
# con_ssh  --> Conexion por defecto al servidor 22
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Configurada para intentar siempre la conexion sin que sea necesario parametrizarla

con_ssh()
{
USUARIO_CONEXION=$1
IP_CONEXION=$2
PUERTO_CONEXION=$3


if [ "$USUARIO_CONEXION" == "" ] ;  then
USUARIO_CONEXION=root
fi


if [ "$IP_CONEXION" == "" ] ;  then
IP_CONEXION=204.61.222.61
fi

if [ "$PUERTO_CONEXION" == "" ] ;  then
PUERTO_CONEXION=65533
fi

if [ "$USUARIO_CONEXION" = "-?" ] ;  then

e_pmt con_ssh "[usuario] [servidor] [puerto]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

ssh -p ${PUERTO_CONEXION}  ${USUARIO_CONEXION}@${IP_CONEXION}

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
