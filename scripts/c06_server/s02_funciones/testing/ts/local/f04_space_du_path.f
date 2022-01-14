#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.2"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="funcion"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Script ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05}"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- espacio
#-------------------------------------------------------------------
#-- dame_espacio_ruta
#-------------------------------------------------------------------
#-- espacio_out
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#- dame_espacio_ruta : Devuelve el espacio ocupado en esa ruta
#- espacio      : Informa del espacio ocupado
#- espacio_out  : Inserta en un archivo la informacion sobre el espacio
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
# espacio
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

espacio()
{
#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------

RUTA_ESPACIO=$1

#- Cambiar httpd x apache -- servidor x work
dame_espacio_ruta $@
linea_espacio=${RETURN_ESPACIO_RUTA}

HORA_ACTUAL=`date +%H_%M_%S`
echo "Espacio en ruta ${RUTA_ESPACIO} - ${HORA_ACTUAL} : ${linea_espacio} "

}

#-------------------------------------------------------------------

espacio_out()
{
RUTA_OUT=$PWD

#Se le pasa un identificativo - si no se pasa nada se pone de nombre archivo

RUTA_ESPACIO=$1
ARCHIVO=$2

# Por defecto 10 ejecucciones
if [ "$ARCHIVO" == "" ] ;  then
ARCHIVO=archivo
fi

dame_espacio_ruta $@
linea_espacio=${RETURN_ESPACIO_RUTA}

HORA_ACTUAL=$(date +%H_%M_%S)
echo "${HORA_ACTUAL}:${linea_instancias}" >> ${RUTA_OUT}/${ARCHIVO}_espacio_servidor.dat
}

#-------------------------------------------------------------------

#- Devuelve solo el valor
dame_espacio_ruta()
{
#-Ajuste servidor - httpd - apache

RUTA_ESPACIO=$1

if [ "${RUTA_ESPACIO}" == "" ]; then
## Activamos un proceso por defecto
##	RUTA_ESPACIO=/tmp
RUTA_ESPACIO="/"
fi  

linea_espacio=$(df -h ${RUTA_ESPACIO} | tail -1 | tr -s ' ' | cut -d' ' -f4-5 )
RETURN_ESPACIO_RUTA=${linea_espacio}

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

