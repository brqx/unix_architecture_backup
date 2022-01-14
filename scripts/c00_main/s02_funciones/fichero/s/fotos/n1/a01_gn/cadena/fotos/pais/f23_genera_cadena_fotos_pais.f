#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="2.5" #  Version del Script actual
FECHA_SCRIPT="Junio 2013"
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
#-- genera_cadena_fotos_pais
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- procesa_codigo_fotos_pais
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
#P PAIS LINEA [posicion_corte] [sep] [url_base]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E genera_cadena_fotos_pais alemania AAAA/bbb	-- Genera una linea con la cadena
#-------------------------------------------------------------------
#E genera_cadena_fotos_pais zimbawe AAAA/bbb 7	-- Genera una linea con la cadena
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias genpais
genera_cadena_fotos_pais()
{
IS_genera_cadena_fotos_pais="Genera cadena con categorias en razon de la ruta"
INFO_SCRIPT=${IS_genera_cadena_fotos_pais}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_genera_cadena_fotos_pais=${INFO_SCRIPT}

PAIS_PASADO=${1}
LINEA_PASADA=${2}
POSICION_CORTE_FICHERO=${3}
URL_BASE=${4}
SEP=${5}

SALIDA_genera_cadena_fotos_pais=0

NOMBRE_SCRIPT_genera_cadena_fotos_pais=genera_cadena_fotos_pais
PARAMETROS_SCRIPT_genera_cadena_fotos_pais="PAIS LINEA [posicion_corte] [sep] [url_base]"

if [ "${POSICION_CORTE_FICHERO}" == "" ]; then
POSICION_CORTE_FICHERO=5
fi  

#-Gestionamos el separador de campos
if [ "${SEP}" == "" ]; then
SEP=";"
fi

if [ "${URL_BASE}" == "" ]; then
URL_BASE="http://cica.kbrqx.com/files/pers/"
fi  

if [ "${LINEA_PASADA}" == "" ]; then
PAIS_PASADO="-?"
fi  


if [ "${PAIS_PASADO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_genera_cadena_fotos_pais} ${PARAMETROS_SCRIPT_genera_cadena_fotos_pais} 

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Parsear la entrada
#-- [2] Recuperar informacion en relacion al codigo
#-- [3] Generar cadena de informacion a procesar
#--------========--------========--------========--------========---

POSICION_FECHA=$( expr ${POSICION_CORTE_FICHERO} - 2 )

imagen=$(echo $LINEA_PASADA |  cut -d "/" -f${POSICION_CORTE_FICHERO}- )
fecha=$(echo $LINEA_PASADA |  cut -d "/" -f${POSICION_FECHA} | cut -d "_" -f1 )

codigo=$(echo ${imagen} | cut -d "_" -f1,2 )

brqx_codigo=$(echo $codigo | cut -c1-4 )

if [ "$brqx_codigo" == "brqx" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio Posicion Codigo correcta
#----====----====----====----====----====----====----====----====---

#- Actualizamos los pendientes - aqui igual importa la procedencia
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
procesa_codigo_fotos_pais ${PAIS_PASADO} $codigo
SALIDA_genera_cadena_fotos_pais=${SALIDA_procesa_codigo_fotos_pais}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

PARAMETROS_MOTIVO_01="Pais        : ${pais}"
PARAMETROS_MOTIVO_02="Pais pasado : ${PAIS_PASADO}"

PARAMETROS_MOTIVO_03="Codigo			: ${codigo}"
PARAMETROS_MOTIVO_04="Linea				: ${LINEA_PASADA}"
PARAMETROS_MOTIVO_05="Corte				: ${POSICION_CORTE_FICHERO} "
PARAMETROS_MOTIVO_06="Url Base			: ${URL_BASE}"
PARAMETROS_MOTIVO_07="Separador			: ${SEP}"

if [ "${SALIDA_procesa_codigo_fotos_pais}" == "0" ] ; then
#------======------======------======------======------======------=
#----- [2] Inicio Existe el codigo para la foto
#------======------======------======------======------======------=

MOTIVO_FUNCION="Codigo Correcto"

pais=$PENDIENTE_PAIS
ciudad=$PENDIENTE_CIUDAD
lugar=$PENDIENTE_LUGAR
naturaleza=$PENDIENTE_NATURALEZA
construccion=$PENDIENTE_CONSTRUCCION
temporada=$PENDIENTE_TEMPORADA
senda=$PENDIENTE_SENDA
evento=$PENDIENTE_EVENTO
letra=$PENDIENTE_LETRA
circunstancia=$PENDIENTE_CIRCUNSTANCIA
encanto=$PENDIENTE_ENCANTO

imagen=$(echo $LINEA_PASADA |  cut -d "/" -f6- )

LINEA_FINAL="${codigo}${SEP}${fecha}${SEP}${pais}${SEP}${ciudad}${SEP}${lugar}${SEP}${naturaleza}${SEP}${construccion}${SEP}${temporada}${SEP}${evento}${SEP}${letra}${SEP}${senda}${SEP}${circunstancia}${SEP}${encanto}${SEP}${URL_BASE}${imagen}${SEP}"

PARAMETROS_MOTIVO_08="Imagen      : ${imagen}"
PARAMETROS_MOTIVO_09="Linea Final : ${LINEA_FINAL}"

##echo "${LINEA_FINAL}"

else

SALIDA_genera_cadena_fotos_pais=1

MOTIVO_FUNCION="Codigo incorrecto"

#------======------======------======------======------======------=
#----- [2] Fin Existe el codigo para la foto
#------======------======------======------======------======------=
fi
else
SALIDA_genera_cadena_fotos_pais=2

MOTIVO_FUNCION="Posicion de filtro de codigo incorrecta.Revisar listado."

#----====----====----====----====----====----====----====----====---
#----- [1] Fin Posicion Codigo correcta
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_genera_cadena_fotos_pais}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_genera_cadena_fotos_pais}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_genera_cadena_fotos_pais}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_genera_cadena_fotos_pais}
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
