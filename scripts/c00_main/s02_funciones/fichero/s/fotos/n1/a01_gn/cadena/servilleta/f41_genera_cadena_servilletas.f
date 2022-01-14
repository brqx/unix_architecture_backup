#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Abril 2012"
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
#-- genera_cadena_servilletas
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- dame_servi_datos_pendientes
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera una cadena de fotos para luego parsearla en razon a una ruta establecida
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generacion cadena fotos categorias
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P LINEA_CARPETA_Y_ARCHIVO
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E genera_cadena_servilletas AAAA/bbb -- Genera una linea con la cadena
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias genfoto
genera_cadena_servilletas()
{
IS_genera_cadena_servilletas="Genera cadena con categorias en razon de la ruta"
INFO_SCRIPT=${IS_genera_cadena_servilletas}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_genera_cadena_servilletas=${INFO_SCRIPT}

LINEA_PASADA=${1}
POSICION_CORTE_FICHERO=${2}
SEP=${3}
URL_BASE=${4}

#-Desactivamos la salida de informacion
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

SALIDA_genera_cadena_servilletas=0

NOMBRE_SCRIPT_genera_cadena_servilletas=genera_cadena_servilletas
PARAMETROS_SCRIPT_genera_cadena_servilletas="linea_carpeta_y_fichero [posicion_corte] [sep] [url_base]"

if [ "${POSICION_CORTE_FICHERO}" == "" ]; then
POSICION_CORTE_FICHERO=8
fi  

#-Gestionamos el separador de campos
if [ "${SEP}" == "" ]; then
SEP=";"
fi

if [ "${URL_BASE}" == "" ]; then
URL_BASE="http://servilletas.kbrqx.com/files/servi/"
fi  

if [ "${LINEA_PASADA}" == "" ]; then
LINEA_PASADA="-?"
fi  


if [ "${LINEA_PASADA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_genera_cadena_servilletas} ${PARAMETROS_SCRIPT_genera_cadena_servilletas} 

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

imagen=$(echo $LINEA_PASADA |  cut -d "/" -f${POSICION_CORTE_FICHERO}-  )
codigo=$(echo $imagen |  cut -d "_" -f2 )

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

#- Actualizamos los pendientes
dame_servi_datos_pendientes $codigo
SALIDA_genera_cadena_servilletas=${SALIDA_dame_servi_datos_pendientes}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_dame_servi_datos_pendientes}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio Existe el codigo para la foto
#----====----====----====----====----====----====----====----====---

MOTIVO_FUNCION="Codigo Correcto"

Titulo=$PENDIENTE_TITULO
C1=$PENDIENTE_C1
C2=$PENDIENTE_C2
C3=$PENDIENTE_C3
C4=$PENDIENTE_C4
C5=$PENDIENTE_C5
Color=$PENDIENTE_COLOR
Pais=$PENDIENTE_PAIS
Provincia=$PENDIENTE_PROVINCIA
Poblacion=$PENDIENTE_POBLACION
Modelo=$PENDIENTE_MODELO
Clave=$PENDIENTE_CLAVE
Subclave=$PENDIENTE_SUBCLAVE

echo "${Titulo}${SEP}${C1}${SEP}${C2}${SEP}${C3}${SEP}${C4}${SEP}${C5}${SEP}${Color}${SEP}${Pais}${SEP}${Provincia}${SEP}${Poblacion}${SEP}${Modelo}${SEP}${Clave}${SEP}${Subclave}${SEP}${URL_BASE}${imagen}${SEP}"

else

SALIDA_genera_cadena_fotos=1

MOTIVO_FUNCION="Codigo incorrecto"
PARAMETROS_MOTIVO_01="Codigo : ${codigo}"
PARAMETROS_MOTIVO_02="Linea  : ${LINEA_PASADA}"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin Existe el codigo para la foto
#----====----====----====----====----====----====----====----====---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_genera_cadena_servilletas}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_genera_cadena_servilletas}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_genera_cadena_servilletas}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_genera_cadena_servilletas}
#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi
}

#-------------------------------------------------------------------
#+ Sistema de trazado N5 - parametrizado
#-------------------------------------------------------------------
if [ "${N5}" != "" ] ; then
echo "${LEVEL_NIVEL_05}/${LEVEL_NIVEL}--${CONCEPT_LEVEL_05}"
fi
#-------------------------------------------------------------------


#-------------------------------------------------------------------
#+ Sistema de trazado N4 - desactivado
#-------------------------------------------------------------------
#N4# echo "$LEVEL_NIVEL	-	Ejecutadas $CONCEPT_LEVEL"
#-------------------------------------------------------------------
