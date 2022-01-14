#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org - Unix - Linux - MacOS
# Brqx Org - Rct - 2022
# Adapted to MACOS
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.3"          #  Version del Script actual
FECHA_SCRIPT="Enero 2022"
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

dame_freemem

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

dame_freemem

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
# MACOS Ver
dame_freemem()
{
#  top -l 1 -s 0 | grep PhysMem
#  PhysMem: 15G used (2016M wired), 628M unused.
# vm_stat | grep free
# Pages free:                               40341.

# vm_stat | perl -ne '/page size of (\d+)/ and $size=$1; /Pages\s+([^:]+)[^\d]+(\d+)/ and printf("%-16s % 16.2f Mi\n", "$1:", $2 * $size / 1048576);'
# free:                      198.10 Mi
# active:                   6879.68 Mi

# 40446 * 4 / 1k = Mb
# MEM=$(vm_stat | grep free | tr -s " " | cut -d " " -f3 | cut -d "." -f1)

# Swapfiles are dynamically created as needed, until either the disk is full, or the kernel runs out of page table space.
# I do not think you can change the page table space limits in the Mac OS X kernel.  I have not seen anything in all the years I've been using OS X.

# EN MAC no se puede escribir en /tmp ... hay que usar el directorio especifico

TMP_FILE=${TMPDIR}tmp_brqx_tmp_file_operations
# Ejemplo : /var/folders/5d/c295pcdd0nlcdz_1szj5b29r0000gn/T/

linea_memoria=$( top -l 1 -s 0 | grep PhysMem | tr -d "(" | tr -d ")" | cut -d " " -f2,4,6 )
# Used - Wired - Inused
# 15G 1854M 539M

vm_stat | perl -ne '/page size of (\d+)/ and $size=$1; /Pages\s+([^:]+)[^\d]+(\d+)/ and printf("%-16s % 16.2f Mi\n", "$1:", $2 * $size / 1048576);' > ${TMP_FILE}

linea_swap=$( cat ${TMP_FILE} | egrep "free|active" | tr -s " " | cut -d " " -f2 | tr "\n" " ")
# Free - Active - Inactive
# 284.50 6911.33 6636.88

#-Return solo vale para campos numericos
#return ${linea_memoria};

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
