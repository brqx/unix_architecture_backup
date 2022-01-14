#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
FECHA_SCRIPT="Junio 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="fichero"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- wcd
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lista el total de direcotrios por cada ruta (superficial)
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T cuenta listado total directorios
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E wcd  -- Cuenta total de archivos por cada carpeta
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------

#-Alias de directorios - Cambiar 8 por 9 en (ubuntu) x (red hat)
#- Funcion de listado de carpetas usando profundidad superficial
wcd()
{
IS_wcd="Lista el numero de entradas por cada ruta (superficial)"
INFO_SCRIPT=${IS_wcd}

echo "Carpetas   -----------------    Ruta "
echo "=================================================="
for i in $( ls -la  | grep "^d"  | tr -s " " | cut -d " " -f${LS_FILTRO} | grep -v "^\." )
do
cd "$i"
num_archivos_carpeta=$( ls -1  | wc -l )
long_num=$( echo $num_archivos_carpeta | wc -m  )
total=$( expr 7 - ${long_num} )

case $total in
0)
spaces=" ";;
1)
spaces="  ";;
2)
spaces="   ";;
3)
spaces="    ";;
4)
spaces="     ";;
5)
spaces="      " ;;
*)
spaces="       ";;
esac

numarchivos=${spaces}${num_archivos_carpeta}

echo "$numarchivos - - - - - - - - - - $i "
cd ..
done

}

#-------------------------------------------------------------------
#+ Sistema de trazado N4 - desactivado
#-------------------------------------------------------------------
#N4# echo "$LEVEL_NIVEL	-	Ejecutadas $CONCEPT_LEVEL"
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================

