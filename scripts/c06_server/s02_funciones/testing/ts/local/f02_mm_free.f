#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org - Linux - MacOS
# Brqx Org - Rct - 2010
# Adapted to Linux - Ubuntu
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.2"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2022"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="funcion"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05}"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- freemem
#-------------------------------------------------------------------
#-- freemem_out
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#--
#-------------------------------------------------------------------
#- dame_freemem
#- linea_freemem
#- freemem      : Devuelve la memoria libre en un momento dado
#- freemem_out  : Inserta en un archivo la memoria libre
#-------------------------------------------------------------------
#+ Ejemplo :
#-------------------------------------------------------------------
# freemem ibrqx 22
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-


freemem()
{

case ${SYSTEM_OS} in
linux)
dame_freemem_linux
;;
mac)
dame_freemem_mac
;;
*)
dame_freemem_linux
esac 


mm_fisica_total=$(echo $linea_memoria | cut -d " " -f1)
mm_fisica_usada=$(echo $linea_memoria | cut -d " " -f2)
mm_fisica_libre=$(echo $linea_memoria | cut -d " " -f3)

mm_swap_total=$(  echo $linea_swap    | cut -d " " -f1)
mm_swap_usada=$(  echo $linea_swap    | cut -d " " -f2)
mm_swap_libre=$(  echo $linea_swap    | cut -d " " -f3)


echo "Memoria Fisica Total/Libre : ${mm_fisica_total} / ${mm_fisica_libre}"
echo "Memoria Swap Total/Libre   : ${mm_swap_total} / ${mm_swap_libre}"

}

linea_freemem()
{

dame_freemem

mm_fisica_total=$(echo $linea_memoria | cut -d " " -f1)
mm_fisica_libre=$(echo $linea_memoria | cut -d " " -f3)


mm_swap_total=$(  echo $linea_swap    | cut -d " " -f1)
mm_swap_libre=$(  echo $linea_swap    | cut -d " " -f3)


RETURN_LINEA_FREEMEM="${mm_fisica_total} / ${mm_fisica_libre} :: ${mm_swap_total} / ${mm_swap_libre}"

}



freemem_out()
{
RUTA_OUT=$PWD

#Se le pasa un identificativo - si no se pasa nada se pone de nombre archivo

ARCHIVO=$1

# Por defecto 10 ejecucciones
if [ "$ARCHIVO" == "" ] ;  then
ARCHIVO=archivo
fi

dame_freemem_linux

mm_fisica_total=$(echo $linea_memoria | cut -d " " -f1)
mm_fisica_usada=$(echo $linea_memoria | cut -d " " -f2)
mm_fisica_libre=$(echo $linea_memoria | cut -d " " -f3)


mm_swap_total=$(  echo $linea_swap    | cut -d " " -f1)
mm_swap_usada=$(  echo $linea_swap    | cut -d " " -f2)
mm_swap_libre=$(  echo $linea_swap    | cut -d " " -f3)

HORA_ACTUAL=`date +%H_%M_%S`
echo "${HORA_ACTUAL}:${mm_fisica_total}:${mm_fisica_libre}" >> ${RUTA_OUT}/${ARCHIVO}_memoria_fisica.dat
echo "${HORA_ACTUAL}:${mm_swap_total}:${mm_swap_libre}"     >> ${RUTA_OUT}/${ARCHIVO}_memoria_swap.dat

}

#-------------------------------------------------------------------

dame_freemem_linux()
{

TMP_FILE=${TMPDIR}/tmp_brqx_tmp_file_operations

free -m > ${TMP_FILE}

linea_memoria=$( cat ${TMP_FILE} | grep Mem  | tr -s " " | cut -d " " -f2-4 )

# El problema es que cut ordena
TMP_SWAP=$(cat ${TMP_FILE} | grep Swap | tr -s " ")

linea_swap="$( echo ${TMP_SWAP} | cut -d ' ' -f2-4 )"

}

dame_freemem_mac()
{

TMP_FILE=${TMPDIR}/tmp_brqx_tmp_file_operations

top -l 1 -s 0 | grep PhysMem  > ${TMP_FILE}

linea_memoria=$( cat ${TMP_FILE} | cut -d " " -f 2,3,6 )

# En MAC no hay swap
sysctl vm.swapusage | tr -s " " > ${TMP_FILE}
# vm.swapusage: total = 13312,00M  used = 12895,25M  free = 416,75M  (encrypted)

linea_swap="$( cat ${TMP_FILE} | cut -d ' ' -f 4,5,7 )"

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
