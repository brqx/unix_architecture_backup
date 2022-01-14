#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.1"          #  Version del Script actual
FECHA_SCRIPT="Enero 2012"
STATUS_SCRIPT="checking"
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
#-- check_servidores_apache_proxy
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - site_access_proxy - intelliformat - formatea
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
#E check_servidores_apache_proxy	--> Chequea todos los servidores indicados
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-La idea es hacer un chequeo de urls concatenando la cadenal de logs
check_servidores_apache_proxy()
{
IS_check_servidores_apache_proxy="Comprueba los servidores via proxy. Puerto http."
INFO_SCRIPT=${IS_check_servidores_apache_proxy}

RUTA_SERVIDORES=$1

if [ "${RUTA_SERVIDORES}" == "" ] ;  then
RUTA_SERVIDORES=${RS_CONN}zservers_proxy.dat
fi

if [ "${RUTA_SERVIDORES}" == "-?" ] ;  then

e_pmt check_servidores_apache_proxy "[RUTA_SERVIDORES]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

LISTA_SERVIDORES=
ESTADO_SERVIDORES=

LONGITUD_MAXIMA=0
cont_servidores=0

echo "Control de servidores via proxy"

for nombre_servidor in $(cat ${RUTA_SERVIDORES} | grep -v "^#" )
do
NOMBRE_SERVIDOR_CORTO=$(echo ${nombre_servidor} | cut -d ":" -f1)
SERVIDOR_SIN_PUERTO=$(echo ${nombre_servidor} | cut -d ":" -f2)

posiciona ${cont_servidores}-${NOMBRE_SERVIDOR_CORTO}

site_access_proxy ${SERVIDOR_SIN_PUERTO}

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

done

#- La longitud debe ser el producto de la cadena mas larga por el numero de cadenas
LONGITUD_LINEA=$( expr ${cont_servidores} \* ${LONGITUD_MAXIMA} )

linea_alterna ${LONGITUD_LINEA}
echo "Inicio chequeo servidores - Puerto $PUERTO"
linea_normal ${LONGITUD_LINEA}
echo "Fichero: ${RUTA_SERVIDORES} "
linea_normal ${LONGITUD_LINEA}
#---------------------------------------------------------------
CADENA_SERVIDORES=$(echo ${LISTA_SERVIDORES} | tr "_" " " )
CADENA_ESTADOS=$(echo ${ESTADO_SERVIDORES} | tr "_" " " )

LONGITUD_CADENA=${#CADENA_SERVIDORES}

intelliformat $CADENA_SERVIDORES
formatea $CADENA_ESTADOS

#---------------------------------------------------------------
linea_normal ${LONGITUD_LINEA}

#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
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
