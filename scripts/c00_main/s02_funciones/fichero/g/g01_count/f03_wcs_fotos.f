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
#-- wcs_fotos
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lista el total de ficheros por cada resolucion
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T listado total ficheros fotos
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E wcs_fotos  -- Listado ficheros en carpetas
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Funcion de listado de resoluciones de imágenes 
#  la idea es mostrar el numero de archivos de cada carpeta de resolucion

## PATH actual : /home/za/www/brqxng/pelona/files/images/preimport/Pareja/1024x0768/2005/Espana

wcs_fotos()
{
IS_wcs_fotos="Lista el total de ficheros por cada resolucion"
INFO_SCRIPT=${IS_wcs_fotos}

echo "======================================================================================"
echo "            GESTION DE IMAGENES Y RESOLUCIONES - BRQX PHOTO ARCHITECTURE           "
echo "--------------------------------------------------------------------------------------"
echo "    150  - 320  - 640 - 1024 - 2048                         Paraje Fotografico"
echo "======================================================================================"

RUTA_INICIAL_PARTIDA=$PWD
for i in *
do
SELECCION="$i"
#- Es solo la seleccion, hay que formar la ruta


#- Guardamos la ruta actual
RUTA_RESOLUCION_INICIAL="${RUTA_INICIAL_PARTIDA}/${SELECCION}"


RUTA[4]=$RUTA_RESOLUCION_INICIAL

RUTA[3]=`echo $RUTA_RESOLUCION_INICIAL | sed "s/1024x0768/0640x0480/g" `
RUTA[2]=`echo $RUTA_RESOLUCION_INICIAL | sed "s/1024x0768/0320x0240/g" `
RUTA[1]=`echo $RUTA_RESOLUCION_INICIAL | sed "s/1024x0768/0150x0090/g" `
RUTA[5]=`echo $RUTA_RESOLUCION_INICIAL | sed "s/1024x0768/2048x1536/g" `

#-------------------------------------------------------------------
cnt=1

while [ $cnt -le ${#RUTA[@]} ];
do
RUTA_ACTUAL="${RUTA[$cnt]}"

cd "$RUTA_ACTUAL"
archivos[$cnt]=`ls -1 | wc -l `

## En unix hay que contar el punto y dos puntos
# total_unix=ls -1 | wc -l ( en ejecucion)
# total_unix=expr total_unix - 2 ( con variable y en ejecuccion )

archivos_inicial=${archivos[$cnt]}
letras=`echo ${archivos_inicial} | tr -s " " | wc -m`

total[$cnt]=`expr 7 - $letras`

total_actual=${total[$cnt]}
archivos_actual=${archivos[$cnt]}

case $total_actual in
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

numarchivos[$cnt]=${spaces}${archivos_actual}

cnt=`expr $cnt + 1`;
done
#-------------------------------------------------------------------


numarchivos_final="${numarchivos[1]}${numarchivos[2]}${numarchivos[3]}${numarchivos[4]}${numarchivos[5]}"


echo "$numarchivos_final - - - - - - - - - - $i "

#- Nos situamos en la resolucion inicial
## cd $RUTAA #- No se que ruta es

#- Volvemos de la ruta actual
cd ..
done
cd $RUTA_INICIAL_PARTIDA

echo "======================================================================================"
}

#-------------------------------------------------------------------
#+ Sistema de trazado N4 - desactivado
#-------------------------------------------------------------------
#N4# echo "$LEVEL_NIVEL	-	Ejecutadas $CONCEPT_LEVEL"
#-------------------------------------------------------------------
