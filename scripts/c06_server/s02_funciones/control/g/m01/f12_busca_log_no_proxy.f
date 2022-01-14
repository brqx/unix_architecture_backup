#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
LEVEL_NIVEL_05=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="funcion"
CONCEPT_ARQUETIPO_05="control"
CONCEPT_LEVEL_05="Script $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- busca_log_no_proxy
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Busca logs concanenando contador
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T busca logs servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [servidor] [contador]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E busca_log_no_proxy soa7		  --> Busca logs colgando del servidor
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-La idea es hacer un chequeo de urls concatenando la cadenal de logs
busca_log_no_proxy()
{
IS_busca_log_no_proxy="Busca logs en el servidor indicado"
INFO_SCRIPT=${IS_busca_log_no_proxy}

URL=$1
cont=$2
MAX_CONT=$3

if [ "${URL}" == "" ] ;  then
#-Url por defecto
URL=soa7.desa.mapfre.net/logs
fi

if [ "${cont}" == "" ] ;  then
#-Iniciamos el contador en 100
cont=100
fi

if [ "${MAX_CONT}" == "" ] ;  then
MAX_CONT=1000
fi


if [ "${URL}" == "-?" ] ;  then

e_pmt busca_log_no_proxy "url [cont] [max_cont]"

else

echo "zBuscando: ${URL}${cont}"
echo "z-------------------------------------------------"
while [ "$cont" != "${MAX_CONT}" ]
do  
let cont++ ; 
##echo $cont
posiciona ${URL}${cont}

wget --no-proxy --timeout 2 -q ${URL}${cont}
if [ $? -eq 0 ];then 
	echo "Log encontrado : ${URL}${cont} " 
fi ; 
done
echo "z-------------------------------------------------"

fi

#-Vaciamos las variables para evitar efectos laterales
cont=
MAX_CONT=
}

#-------------------------------------------------------------------

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
