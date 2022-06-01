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
#-- damecarga
#-------------------------------------------------------------------
#-- carga_out
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#- damecarga : Devuelve la carga del sistema en un momento dado
#- carga_out : Va insertando la carga del sistema en un fichero pasado 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
# damecarga
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 


carga()
{
dame_carga $@
linea_carga=${RETURN_LINEA_CARGA}

CARGA_01_MIN=`echo $linea_carga |  cut -d " " -f10 | cut -d "," -f1`
CARGA_05_MIN=`echo $linea_carga |  cut -d " " -f11 | cut -d "," -f1`
CARGA_15_MIN=`echo $linea_carga |  cut -d " " -f12 | cut -d "," -f1`

echo "Carga del sistema (Ultimo minuto) : ${CARGA_01_MIN} "
echo "Carga en los ultimos 5/15 minutos : ${CARGA_05_MIN} / ${CARGA_15_MIN}"

}

#-------------------------------------------------------------------

linea_carga()
{
dame_carga $@
linea_carga=${RETURN_LINEA_CARGA}

CARGA_01_MIN=`echo $linea_carga |  cut -d " " -f10 | cut -d "," -f1`
CARGA_05_MIN=`echo $linea_carga |  cut -d " " -f11 | cut -d "," -f1`
CARGA_15_MIN=`echo $linea_carga |  cut -d " " -f12 | cut -d "," -f1`

RETURN_LINEA_CARGA="${CARGA_01_MIN} / ${CARGA_05_MIN} / ${CARGA_15_MIN}"

}

#-------------------------------------------------------------------

carga_out()
{
RUTA_OUT=$PWD

#Se le pasa un identificativo - si no se pasa nada se pone de nombre archivo

ARCHIVO=$1

# Por defecto 10 ejecucciones
if [ "$ARCHIVO" == "" ] ;  then
ARCHIVO=archivo
fi

dame_carga $@
linea_carga=${RETURN_LINEA_CARGA}

CARGA_01_MIN=`echo $linea_carga |  cut -d " " -f10 | cut -d "," -f1`
CARGA_05_MIN=`echo $linea_carga |  cut -d " " -f11 | cut -d "," -f1`
CARGA_15_MIN=`echo $linea_carga |  cut -d " " -f12 | cut -d "," -f1`

HORA_ACTUAL=`date +%H_%M_%S`
echo "${HORA_ACTUAL}:${CARGA_01_MIN}" >> ${RUTA_OUT}/${ARCHIVO}_carga_sistema.dat

}

dame_carga()
{
linea_carga=`uptime | tr -s " " `

RETURN_LINEA_CARGA=${linea_carga}
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


