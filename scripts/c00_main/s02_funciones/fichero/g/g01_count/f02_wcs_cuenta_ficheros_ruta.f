#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
FECHA_SCRIPT="Febrero 2012"
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
#-- wcs
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lista el total de ficheros por cada ruta
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T listado total ficheros
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E wcs  -- Listado ficheros en carpetas
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Funcion de listado de carpetas usando profundidad superficial
wcs()
{
IS_wcs="Lista el total de archivos por cada carpeta (profundo)"
INFO_SCRIPT=${IS_wcs}

INFO=$1

#- Permitimos solicitar info de la funcion
if [ "${INFO}" == "-?" ]; then

e_pmt wcs 

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-Con el titulo sabemos el numero de items para la linea
LINEA_TITULO="Contenido : Ficheros - Carpetas - Enlaces"
NUM_ITEMS_TITULO=6

#-Antes de generar la salida para conseguir que quede bonito hay que averiguar la cadena mas larga 

#-Llamamos a ls
codir
LINEA_CARPETAS=${SALIDA_codir} 

#- Esta linea de carpetas puede tener espacios


#-Tenemos preparado los valores de NUM_CRC_TITULO y NUM_CRC_COLUMNA
establece_longitud_titulo_y_columnas ${LINEA_TITULO}

#-Y ahora que tenemos configuradas las columnas vamos a ajustar los titulos

NUM_CRC=
establece_maxima_longitud ${LINEA_TITULO}
establece_maxima_longitud ${LINEA_CARPETAS}

NUM_CRC_TITULO=${NUM_CRC}

#-Ajustamos la longitud de las lineas : Titulo + (N * Columnas)

LONGITUD_LINEA=$( expr ${NUM_CRC_COLUMNA} \* ${NUM_ITEMS_TITULO} )
LONGITUD_LINEA=$( expr ${LONGITUD_LINEA} + ${NUM_CRC_TITULO}  )

#-Usaremos esta variable para poder gestionar todas las lineas de una salida
LONGITUD_ESTABLECIDA=${LONGITUD_LINEA}

linea_caracter "=="
formatea_titulo_y_columnas ${LINEA_TITULO}
linea_caracter "=-"

#-Aqui la lista esta codificada
for carpeta_listada in ${LINEA_CARPETAS}
do
#-Vamos a eliminar el CR
dcode ${carpeta_listada}
carpeta_decodificada=$( echo ${SALIDA_DCODE}  )

cd "${carpeta_decodificada}"
num_archivos_carpeta=$( find . -type f | wc -l )
num_carpetas_nivel_01=$( find . -maxdepth 1 -mindepth 1 -type d  | wc -l )
num_enlaces_nivel_01=$( find  . -maxdepth 1 -mindepth 1 -type l  | wc -l )

INFO_CARPETA="${num_archivos_carpeta} - ${num_carpetas_nivel_01} - ${num_enlaces_nivel_01}"

#-Codificamos antes de mostrar
ecode "${carpeta_listada} : ${INFO_CARPETA}"

formatea_titulo_y_columnas "${SALIDA_ECODE}"
cd ..
done

linea_caracter "="

fi
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

