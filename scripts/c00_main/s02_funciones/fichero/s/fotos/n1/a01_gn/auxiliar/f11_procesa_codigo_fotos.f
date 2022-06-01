#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Enero 2013"
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
#-- procesa_codigo_fotos
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera una cadena de fotos para luego parsearla en razon a una ruta establecida
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T listado total ficheros fotos
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P CODIGO	[ FICH_CONFIG ]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E procesa_codigo_fotos  -- Prepara las variables pendientes
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Partimos de un fichero con las columnas establecidas
#-------------------------------------------------------------------
# brqx_codigo:ciudad:lugar:naturaleza
# brqx_saf11bot:::animales

#- Posible fn/alias procesa_codigo_fotos
procesa_codigo_fotos()
{
IS_procesa_codigo_fotos="Genera las categorias pendientes en razon al codigo"
INFO_SCRIPT=${IS_procesa_codigo_fotos}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_procesa_codigo_fotos=${INFO_SCRIPT}

CODIGO_PASADO=$1
FICHERO=$2
SEP=$3

SALIDA_procesa_codigo_fotos=0

NOMBRE_SCRIPT_procesa_codigo_fotos=procesa_codigo_fotos
PARAMETROS_SCRIPT_procesa_codigo_fotos="codigo [fichero_codigos] [separador]"

if [ "${CODIGO_PASADO}" == "" ]; then
CODIGO_PASADO="-?"
fi

if [ "${SEP}" == "" ]; then
SEP=";"
fi

if [ "${FICHERO}" == "" ]; then
FICHERO=${RECFOTOS}zpart/full/entidad/zfoto_codigos.dat
fi

if [ "${CODIGO_PASADO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_procesa_codigo_fotos} ${PARAMETROS_SCRIPT_procesa_codigo_fotos} 

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

PARAMETROS_MOTIVO_01="Codigo      : ${codigo}"
PARAMETROS_MOTIVO_02="Fichero     : ${FICHERO}"
PARAMETROS_MOTIVO_03="Separador   : ${SEP}"

if [ -f  ${FICHERO} ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio Ruta fichero correcta
#----====----====----====----====----====----====----====----====---

LINEA_FICHERO=$(cat ${FICHERO} | grep "^${CODIGO_PASADO}" )
ERROR_grep=$?

if [ "${ERROR_grep}" == "0" ] ; then
#------======------======------======------======------======------=
#----- [2] Inicio Existe el codigo para la foto
#------======------======------======------======------======------=

MOTIVO_FUNCION="Codigo Correcto"

PENDIENTE_FECHA=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f2 )
PENDIENTE_PAIS=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f3 )
PENDIENTE_CIUDAD=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f4 )
PENDIENTE_LUGAR=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f5 )
PENDIENTE_NATURALEZA=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f6 )
PENDIENTE_CONSTRUCCION=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f7 )
PENDIENTE_TEMPORADA=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f8 )
PENDIENTE_EVENTO=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f9 )
PENDIENTE_LETRA=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f10 )
PENDIENTE_CIRCUNSTANCIA=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f11 )
PENDIENTE_ENCANTO=$(echo ${LINEA_FICHERO} | cut -d ${SEP} -f12 )
PENDIENTE_SENDA=Impersonal

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

PARAMETROS_MOTIVO_04="Fecha          : ${PENDIENTE_FECHA}"
PARAMETROS_MOTIVO_05="Pais           : ${PENDIENTE_PAIS}"
PARAMETROS_MOTIVO_06="Ciudad         : ${PENDIENTE_CIUDAD}"
PARAMETROS_MOTIVO_07="Lugar          : ${PENDIENTE_LUGAR}"
PARAMETROS_MOTIVO_08="Naturaleza     : ${PENDIENTE_NATURALEZA}"
PARAMETROS_MOTIVO_09="Construccion   : ${PENDIENTE_CONSTRUCCION}"
PARAMETROS_MOTIVO_10="Temporada      : ${PENDIENTE_TEMPORADA}"
PARAMETROS_MOTIVO_11="Evento         : ${PENDIENTE_EVENTO}"
PARAMETROS_MOTIVO_12="Circunstancia  : ${PENDIENTE_CIRCUNSTANCIA}"

SALIDA_procesa_codigo_fotos=0

else

SALIDA_procesa_codigo_fotos=1

MOTIVO_FUNCION="Codigo incorrecto"

#----====----====----====----====----====----====----====----====---
#----- [2] Fin Existe el codigo para la foto
#----====----====----====----====----====----====----====----====---
fi
else

SALIDA_procesa_codigo_fotos=2

MOTIVO_FUNCION="Fichero de datos no existe"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin Ruta fichero correcta
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_procesa_codigo_fotos}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_procesa_codigo_fotos}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_procesa_codigo_fotos}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_procesa_codigo_fotos}
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
