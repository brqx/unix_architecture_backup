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
#-- procesa_linea_codigos
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
#E procesa_linea_codigos  -- Prepara las variables pendientes
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Partimos de un fichero con las columnas establecidas
#-------------------------------------------------------------------
#    1           2        3        4             5         6    7
# brqx_dia12sui;d120830;Suiza;Vico_Morcote;Swiss_Diamond;Lago;Hotel;
#    8           9            10     11       12
# t2012;Suiza_-_Swiss_Diamond;v;Vacaciones;Memorable
#-------------------------------------------------------------------

procesa_linea_codigos()
{
IS_procesa_linea_codigos="Genera las categorias pendientes en razon al codigo"
INFO_SCRIPT=${IS_procesa_linea_codigos}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_procesa_linea_codigos=${INFO_SCRIPT}

LINEA_PASADA_FICHERO="${1}"
SEP=$2

SALIDA_procesa_linea_codigos=0

NOMBRE_SCRIPT_procesa_linea_codigos=procesa_linea_codigos
PARAMETROS_SCRIPT_procesa_linea_codigos="codigo [fichero_codigos] [separador]"

if [ "${LINEA_PASADA_FICHERO}" == "" ]; then
LINEA_PASADA_FICHERO="-?"
fi

if [ "${SEP}" == "" ]; then
SEP=";"
fi

if [ "${LINEA_PASADA_FICHERO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

	if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
		e_pmt ${NOMBRE_SCRIPT_procesa_linea_codigos} ${PARAMETROS_SCRIPT_procesa_linea_codigos} 
	fi

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Parsear la entrada
#-- [2] Comprobar el codigo y actuar en consecuencia
#-- [3] Actualizar todas las variables de la cadena
#--------========--------========--------========--------========---


PENDIENTE_CODIGO=$(echo ${LINEA_PASADA_FICHERO} | cut -d ${SEP} -f1 )
codigo=$PENDIENTE_CODIGO

brqx_codigo=$(echo ${codigo} | cut -d "_" -f1,2 | cut -c1-4 )
len_codigo=${#codigo}

PARAMETROS_MOTIVO_01="Linea Pasada   : ${LINEA_PASADA_FICHERO}"
PARAMETROS_MOTIVO_02="Separador      : ${SEP}"


if [ "${brqx_codigo}" == "brqx" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio Posicion Codigo correcta
#----====----====----====----====----====----====----====----====---

if [ "${len_codigo}" == "13" ] ; then
#------======------======------======------======------======------=
#----- [2] Inicio Comprobacion longitud codigo
#------======------======------======------======------======------=

PENDIENTE_FECHA=$(echo ${LINEA_PASADA_FICHERO} | cut -d ${SEP} -f2 )
PENDIENTE_PAIS=$(echo ${LINEA_PASADA_FICHERO} | cut -d ${SEP} -f3 )
PENDIENTE_CIUDAD=$(echo ${LINEA_PASADA_FICHERO} | cut -d ${SEP} -f4 )
PENDIENTE_LUGAR=$(echo ${LINEA_PASADA_FICHERO} | cut -d ${SEP} -f5 )
PENDIENTE_NATURALEZA=$(echo ${LINEA_PASADA_FICHERO} | cut -d ${SEP} -f6 )
PENDIENTE_CONSTRUCCION=$(echo ${LINEA_PASADA_FICHERO} | cut -d ${SEP} -f7 )
PENDIENTE_TEMPORADA=$(echo ${LINEA_PASADA_FICHERO} | cut -d ${SEP} -f8 )
PENDIENTE_EVENTO=$(echo ${LINEA_PASADA_FICHERO} | cut -d ${SEP} -f9 )
PENDIENTE_LETRA=$(echo ${LINEA_PASADA_FICHERO} | cut -d ${SEP} -f10 )
PENDIENTE_CIRCUNSTANCIA=$(echo ${LINEA_PASADA_FICHERO} | cut -d ${SEP} -f11 )
PENDIENTE_ENCANTO=$(echo ${LINEA_PASADA_FICHERO} | cut -d ${SEP} -f12 )
PENDIENTE_SENDA=Impersonal

pais=$PENDIENTE_PAIS
ciudad=$PENDIENTE_CIUDAD
lugar=$PENDIENTE_LUGAR
naturaleza=$PENDIENTE_NATURALEZA
construccion=$PENDIENTE_CONSTRUCCION
temporada=$PENDIENTE_TEMPORADA
evento=$PENDIENTE_EVENTO
letra=$PENDIENTE_LETRA
circunstancia=$PENDIENTE_CIRCUNSTANCIA
encanto=$PENDIENTE_ENCANTO
senda=$PENDIENTE_SENDA

cadena_fotos="${codigo}${SEP}${fecha}${SEP}${pais}${SEP}${ciudad}${SEP}${lugar}${SEP}${naturaleza}${SEP}${temporada}${SEP}${evento}${SEP}${letra}${SEP}${senda}${SEP}${circunstancia}"

MOTIVO_FUNCION="Linea procesada de forma correcta."

PARAMETROS_MOTIVO_03="Codigo         : ${PENDIENTE_CODIGO}"
PARAMETROS_MOTIVO_04="Fecha          : ${PENDIENTE_FECHA}"
PARAMETROS_MOTIVO_05="Pais           : ${PENDIENTE_PAIS}"
PARAMETROS_MOTIVO_06="Ciudad         : ${PENDIENTE_CIUDAD}"
PARAMETROS_MOTIVO_07="Lugar          : ${PENDIENTE_LUGAR}"
PARAMETROS_MOTIVO_08="Naturaleza     : ${PENDIENTE_NATURALEZA}"
PARAMETROS_MOTIVO_09="Construccion   : ${PENDIENTE_CONSTRUCCION}"
PARAMETROS_MOTIVO_10="Temporada      : ${PENDIENTE_TEMPORADA}"
PARAMETROS_MOTIVO_11="Evento         : ${PENDIENTE_EVENTO}"
PARAMETROS_MOTIVO_12="Letra          : ${PENDIENTE_LETRA}"
PARAMETROS_MOTIVO_13="Encanto        : ${PENDIENTE_ENCANTO}"
PARAMETROS_MOTIVO_14="Circunstancia  : ${PENDIENTE_CIRCUNSTANCIA}"
PARAMETROS_MOTIVO_15="Senda          : ${PENDIENTE_SENDA}"

SALIDA_procesa_linea_codigos=0

else
MOTIVO_FUNCION="Codigo incorrecto. La longitud no se corresponde"
SALIDA_procesa_linea_codigos=1



#------======------======------======------======------======------=
#----- [2] Fin Comprobacion longitud codigo
#------======------======------======------======------======------=
fi
else
MOTIVO_FUNCION="Codigo incorrecto. El formato no es el adecuado"
SALIDA_procesa_linea_codigos=2


#----====----====----====----====----====----====----====----====---
#----- [2] Fin Existe el codigo para la foto
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_procesa_linea_codigos}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_procesa_linea_codigos}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_procesa_linea_codigos}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_procesa_linea_codigos}
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
