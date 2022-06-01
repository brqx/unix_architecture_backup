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
CONCEPT_LEVEL_05="Lista ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05}"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- r_freemem      
#-------------------------------------------------------------------
#-- r_freemem_out 
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#- r_dame_freemem
#- r_linea_freemem
#- r_freemem      : Devuelve la memoria libre en un momento dado
#- r_freemem_out  : Inserta en un archivo la memoria libre
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
# r_freemem ibrqx 22
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

r_freemem()
{
#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------
#- Queremos saber todo esto pero de una maquina remota

#- Esto funciona
r_dame_freemem $@
linea_memoria=${RETURN_LINEA_MEMORIA}

mm_fisica_total=`echo $linea_memoria | cut -d " " -f8`
mm_fisica_usada=`echo $linea_memoria | cut -d " " -f9`
mm_fisica_libre=`echo $linea_memoria | cut -d " " -f10`


mm_swap_total=`echo $linea_memoria | cut -d " " -f19`
mm_swap_usada=`echo $linea_memoria | cut -d " " -f20`
mm_swap_libre=`echo $linea_memoria | cut -d " " -f21`

echo "Memoria Fisica Total/Libre : ${mm_fisica_total} / ${mm_fisica_libre}"
echo "Memoria Swap Total/Libre   : ${mm_swap_total} / ${mm_swap_libre}"

}

#-------------------------------------------------------------------

r_linea_freemem()
{
#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------
#- Queremos saber todo esto pero de una maquina remota

#- Esto funciona
r_dame_freemem $@
linea_memoria=${RETURN_LINEA_MEMORIA}

mm_fisica_total=`echo $linea_memoria | cut -d " " -f8`
mm_fisica_libre=`echo $linea_memoria | cut -d " " -f10`

mm_swap_total=`echo $linea_memoria | cut -d " " -f19`
mm_swap_libre=`echo $linea_memoria | cut -d " " -f21`


RETURN_LINEA_FREEMEM="${mm_fisica_total} / ${mm_fisica_libre} :: ${mm_swap_total} / ${mm_swap_libre}"

}

#-------------------------------------------------------------------

freemem_out()
{
RUTA_OUT=$PWD

#Se le pasa un identificativo - si no se pasa nada se pone de nombre archivo

ARCHIVO=$1

# Por defecto 10 ejecucciones
if [ "$ARCHIVO" == "" ] ;  then
ARCHIVO=archivo
fi

r_dame_freemem $@
linea_memoria=${RETURN_LINEA_MEMORIA}


mm_fisica_total=`echo $linea_memoria | cut -d " " -f8`
mm_fisica_usada=`echo $linea_memoria | cut -d " " -f9`
mm_fisica_libre=`echo $linea_memoria | cut -d " " -f10`


mm_swap_total=`echo $linea_memoria | cut -d " " -f19`
mm_swap_usada=`echo $linea_memoria | cut -d " " -f20`
mm_swap_libre=`echo $linea_memoria | cut -d " " -f21`

HORA_ACTUAL=`date +%H_%M_%S`
echo "${HORA_ACTUAL}:${mm_fisica_total}:${mm_fisica_libre}" >> ${RUTA_OUT}/${ARCHIVO}_memoria_fisica.dat
echo "${HORA_ACTUAL}:${mm_swap_total}:${mm_swap_libre}" >> ${RUTA_OUT}/${ARCHIVO}_memoria_swap.dat

}

#-------------------------------------------------------------------

r_dame_freemem()
{
#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------
#- Queremos saber todo esto pero de una maquina remota

SERVER=${1}
PORT=${2}
USUARIO_CONEXION=${3}

if [ "${SERVER}" == "" ]; then
## Activamos un servidor por defecto
##	SERVER=ibrqx
SERVER=core
fi  

if [ "${PORT}" == "" ]; then
## Activamos un puerto por defecto
##	PORT=65533
PORT=22
fi  

if [ "${USUARIO_CONEXION}" == "" ]; then
#- Establecemos el usuario
USUARIO_CONEXION=ibm
fi  


#- Esto funciona
linea_memoria=$(ssh -oPort=${PORT} ${USUARIO_CONEXION}@${SERVER} "free -m | tr '\n' '\t' " )

RETURN_LINEA_MEMORIA=${linea_memoria}

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

