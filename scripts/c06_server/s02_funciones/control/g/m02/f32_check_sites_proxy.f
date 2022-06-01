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
#-- check_sites_proxy
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - site_access_proxy - formatea - intelliformat
#-------------------------------------------------------------------
#-- linea_normal - linea_alterna - posiciona
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
#P [RUTA_SERVIDORES] 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E check_sites_proxy	--> Chequea todos los servidores indicados
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-La idea inicial es poder chequear puertos distintos al http como pueden ser 
# puertos de consola y puertos seguros. Nos vamos a basar en telnet

check_sites_proxy()
{
IS_check_sites_proxy="Comprueba los servidores. Puerto http."
INFO_SCRIPT=${IS_check_sites_proxy}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_check_sites_proxy=${INFO_SCRIPT}

RUTA_SERVIDORES=$1

SALIDA_check_sites_proxy=0

NOMBRE_SCRIPT_check_sites_proxy=check_sites_proxy
PARAMETROS_SCRIPT_check_sites_proxy="[RUTA_SITES]"


if [ "${RUTA_SERVIDORES}" == "" ] ;  then
RUTA_SERVIDORES=${RS_CONN}zsites_proxy.dat
fi


if [ "${RUTA_SERVIDORES}" == "-?" ] ;  then

e_pmt ${NOMBRE_SCRIPT_check_sites_proxy} ${PARAMETROS_SCRIPT_check_sites_proxy}


else

LISTA_SERVIDORES=
ESTADO_SERVIDORES=

LONGITUD_MAXIMA=0
cont_servidores=0

for nombre_servidor_con_puerto in $(cat ${RUTA_SERVIDORES} | grep -v "^#" | grep -v "^ " )
do
NOMBRE_SERVIDOR_CORTO=$(echo ${nombre_servidor_con_puerto} | cut -d ":" -f1)
NOMBRE_SERVIDOR_COMPLETO=$(echo ${nombre_servidor_con_puerto} | cut -d ":" -f2)
##SERVIDOR_CON_PUERTO=$(echo ${nombre_servidor_con_puerto} | cut -d ":" -f2-)

posiciona ${cont_servidores}-${NOMBRE_SERVIDOR_CORTO}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
#-Telnet no funciona con proxy
##telnet_access_proxy ${SERVIDOR_CON_PUERTO}
site_access_proxy ${NOMBRE_SERVIDOR_COMPLETO}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


#-Uniforma la salida para que todos los errores sean 1
uniforma_salida ${SALIDA_SITE_ACCESS}


LISTA_SERVIDORES=${LISTA_SERVIDORES}_${NOMBRE_SERVIDOR_CORTO}
ESTADO_SERVIDORES=${ESTADO_SERVIDORES}_${SALIDA_uniforma_salida}

#-Analizamos el numero de caracteres maximo
LON_CADENA=$(expr ${#NOMBRE_SERVIDOR_CORTO} + 1 )
if [ "${LON_CADENA}" -gt "${LONGITUD_MAXIMA}" ] ;then
LONGITUD_MAXIMA=${LON_CADENA}
fi
#-Contamos el numero de servidores
let cont_servidores++

#-Insertamos un control posicional de lanzamiento
posiciona ${cont_servidores}-${NOMBRE_SERVIDOR_CORTO}
done

#- La longitud debe ser el producto de la cadena mas larga por el numero de cadenas
LONGITUD_LINEA=$( expr ${cont_servidores} \* ${LONGITUD_MAXIMA} )

linea_alterna ${LONGITUD_LINEA}
echo "Inicio chequeo sites - Puerto $PUERTO"
linea_normal ${LONGITUD_LINEA}
echo "Fichero: ${RUTA_SERVIDORES} "
linea_normal ${LONGITUD_LINEA}
#---------------------------------------------------------------
CADENA_SERVIDORES=$(echo ${LISTA_SERVIDORES} | tr "_" " " )
CADENA_ESTADOS=$(echo ${ESTADO_SERVIDORES} | tr "_" " " )

LONGITUD_CADENA=${#CADENA_SERVIDORES}

intelliformat ${CADENA_SERVIDORES}
formatea ${CADENA_ESTADOS}

#---------------------------------------------------------------
linea_normal ${LONGITUD_LINEA}


fi
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
