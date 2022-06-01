#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.3"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2016"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
LEVEL_NIVEL_05=05
CONCEPT_MOLDE_05="funciones"
CONCEPT_ARQUETIPO_05="connect"
CONCEPT_LEVEL_05="Script $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- get_ssh_last_folder
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#- Obtiene la ruta actual de la ultima vez que hemos estado en el servidor
#-------------------------------------------------------------------
#-- Recive como parametros :
#-------------------------------------------------------------------
#-- 1. Variable a obtener
#-------------------------------------------------------------------
#-- Devuelve el valor en la variable RETURN_VALOR_VARIABLE_REMOTA
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E get_ssh_last_folder soa6 22 root --> Accede a soa6 con usuario root
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Configurada para intentar siempre la conexion sin que sea necesario parametrizarla

get_ssh_last_folder()
{
IP_CONEXION=$1
PUERTO_CONEXION=$2
USUARIO_CONEXION=$3


if [ "$USUARIO_CONEXION" == "" ] ;  then
USUARIO_CONEXION=root
fi


if [ "$IP_CONEXION" == "" ] ;  then
IP_CONEXION="pbrqx.com"
fi

if [ "$PUERTO_CONEXION" == "" ] ;  then
PUERTO_CONEXION=22
fi

if [ "$USUARIO_CONEXION" = "-?" ] ;  then

e_pmt get_ssh_last_folder "[servidor] [puerto] [usuario]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

FOLDER=$(ssh -p ${PUERTO_CONEXION} -l ${USUARIO_CONEXION} ${IP_CONEXION} 'cat /root/.last_dir' 2> /dev/null | tail -1 )

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
