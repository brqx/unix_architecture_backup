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
#-- get_ssh_var_raiz_home
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#- Obtiene una variable de un sitio remoto tras lanzar la arquitectura
#-------------------------------------------------------------------
#  Por desgracia, no podemos parametrizarlo
#-------------------------------------------------------------------
#-- Recive como parametros :
#-------------------------------------------------------------------
#-- 1. Variable a obtener
#-------------------------------------------------------------------
#-- Devuelve el valor en la variable RETURN_VALOR_VARIABLE_REMOTA
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E get_ssh_var_raiz_home ibm soa6 22 --> Acceso a soa6 con usuario ibm
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Configurada para intentar siempre la conexion sin que sea necesario parametrizarla

##ssh ricabel@soa7a "bash -l -c '.  \${HOME}/r_clean.x > /dev/null 2> /dev/null   &&  echo \${RAIZ} ' "  > ./entorno_remoto_brqx.dat

# Alias sshget
get_ssh_var_raiz_home()
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

e_pmt get_ssh_var_raiz_home "[usuario] [servidor] [puerto]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Como tenemos que incidar nombres que no deben ser cambiados por variables, no podemos parametrizarlo :-((

ssh -p ${PUERTO_CONEXION}  ${USUARIO_CONEXION}@${IP_CONEXION} "bash -l -c '.  \${HOME}/r.x > /dev/null 2> /dev/null   &&  echo \${HOME} ' "  > ./entorno_remoto_brqx.dat

RETURN_VALOR_VARIABLE_REMOTA=$( cat ./entorno_remoto_brqx.dat  | tail -1 )

rm -f ./entorno_remoto_brqx.dat

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
