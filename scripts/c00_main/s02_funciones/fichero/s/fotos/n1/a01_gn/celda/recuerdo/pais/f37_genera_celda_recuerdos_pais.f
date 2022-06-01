#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="2.5" #  Version del Script actual
FECHA_SCRIPT="Febrero 2013"
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
#-- genera_celda_recuerdos_pais
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- posiciona - e_pmt - genera_cadena_fotos_pais
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Actualiza celda de matrices de lugares ciudades y paises
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generacion celda lugares ciudades paises temporadas
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P PAIS LINEA [CORTE] [URL] [NUM_REC]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E genera_celda_recuerdos_pais LINEA -- Genera la celda en matriz de localidades
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

##- GENERA CELDA PAISES LUGARES Y CIUDADES

genera_celda_recuerdos_pais()
{
IS_genera_celda_recuerdos_pais="Actualiza celda de matrices de recuerdos de un pais"
INFO_SCRIPT=${IS_genera_celda_recuerdos_pais}

INFO_SCRIPT_genera_celda_recuerdos_pais=${INFO_SCRIPT}

PAIS_PASADO=${1}
LINEA_PASADA=${2}
POSICION_CORTE_FICHERO=${3}
URL_BASE=${4}
NUM_RECUERDOS=${5}

SALIDA_genera_celda_recuerdos_pais=0

NOMBRE_SCRIPT_genera_celda_recuerdos_pais=genera_celda_recuerdos_pais
PARAMETROS_SCRIPT_genera_celda_recuerdos_pais="PAIS LINEA [POSICION_CORTE_FICHERO] [URL] "

#-Gestionamos el separador de campos
if [ "${SEP}" == "" ]; then
SEP=";"
fi

if [ "${LINEA_PASADA}" == "" ]; then
#-- Habilitamos una linea para prueba rapida
LINEA_PASADA=${LINLAST}
#LINEA_PASADA="-?"
fi  

if [ "${LINEA_PASADA}" == "" ]; then
PAIS_PASADO="-?"
fi  


if [ "${PAIS_PASADO}" == "" ]; then
PAIS_PASADO="-?"
fi  

if [ "${NUM_RECUERDOS}" == "" ]; then
NUM_RECUERDOS=5
fi


if [ "${PAIS_PASADO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_genera_celda_recuerdos_pais} ${PARAMETROS_SCRIPT_genera_celda_recuerdos_pais}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar la linea de entrada
#-- [2] Procesar el codigo y recuperar las categorias correspondientes
#-- [3] Preparar varias matrices con los lugares ciudades y paises indicados
#--------========--------========--------========--------========---

#-Ejemplo Linea Pasada:
# ./Suiza/f06_Montreux/120902_-_Mon--ury/brqx_fre12sui_-_--0048.JPG

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
genera_cadena_fotos_pais ${PAIS_PASADO} "${LINEA_PASADA}" ${POSICION_CORTE_FICHERO} ${URL_BASE}
SALIDA_genera_celda_recuerdos_pais=${SALIDA_genera_cadena_fotos_pais}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_genera_cadena_fotos_pais}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio Existe el codigo para la foto
#----====----====----====----====----====----====----====----====---

LINEA_ACTUAL=${LINEA_FINAL}
MOTIVO_FUNCION="Codigo correcto"

#-Esto en teoria nos ha devuelto la fecha

#-Ejemplo Linea Actual Generada:

# brqx_fre12sui;f06;Suiza;Montreux;Freddie_Mercury_Statue;Lago;Estatua;t2012;
# Suiza_-_Montreux_-Paraje_Freddie_Mercury_Statue;f;Impersonal;Vacaciones;Memorable;
# http://cica.kbrqx.com/files/pers/brqx_fre12sui_-_Suiza_-_Montreux_-_Fredy_Mercury_000048.JPG;

imagen=$(echo ${LINEA_ACTUAL} |  cut -d ${SEP} -f14 )


if [ "${codigo}" != "" ] ; then
#------======------======------======------======------======------=
#----- [2] Inicio Existe el codigo para la foto
#------======------======------======------======------======------=

#--- Inicio Recuerdos ----------------------------------------------

PARAMETROS_MOTIVO_01="Codigo         : ${codigo}"
PARAMETROS_MOTIVO_02="Fecha          : ${fecha}"
PARAMETROS_MOTIVO_03="Pais           : ${pais}"
PARAMETROS_MOTIVO_04="Ciudad         : ${ciudad}"
PARAMETROS_MOTIVO_05="Lugar          : ${lugar}"
PARAMETROS_MOTIVO_06="Naturaleza     : ${naturaleza}"
PARAMETROS_MOTIVO_07="Construccion   : ${construccion}"
PARAMETROS_MOTIVO_08="Temporada      : ${temporada}"
PARAMETROS_MOTIVO_09="Evento         : ${evento}"
PARAMETROS_MOTIVO_10="Circunstancia  : ${circunstancia}"

PARAMETROS_MOTIVO_11="Imagen         : ${imagen}"

#-Primero hay que ver si se ha metido el codigo. Si se ha metido entonces hay que ver cuantas fotos

let cont_celda_recuerdos++

if [ "${cont_brqx_code[${codigo}]}"  == "" ] ; then
posiciona "Normal : ${codigo}"
cont_brqx_code[${codigo}]=0
fecha_brqx_code[${codigo}]=$fecha
fi

cont_actual=${cont_brqx_code[${codigo}]}

##echo "Valores para el indice : ${codigo} y ${cont_actual}"
#-Ajustamos el indice del array
indice="${codigo}_${cont_actual}"

if [ "${cont_actual}" -lt "${NUM_RECUERDOS}" ] ; then

cinco_codigos[${indice}]=${imagen}

let cont_actual++

cont_brqx_code[${codigo}]=${cont_actual}

fi 

PARAMETROS_MOTIVO_12="Contador [${codigo}]  : ${cont_brqx_code[${codigo}]}"
MOTIVO_FUNCION="Codigo correcto. Contador actualizado y celdas procesadas."

SALIDA_genera_celda_recuerdos_pais=0

#-A ver como enfoco lo de la aletoriedad - pendiente

else

MOTIVO_FUNCION="Codigo inexistente. Celdas no procesadas."
SALIDA_genera_celda_recuerdos_pais=4
#------======------======------======------======------======------=
#----- [2] Inicio Existe el codigo para la foto
#------======------======------======------======------======------=
fi
else
#-Aqui hay que poner otro case

case ${SALIDA_genera_celda_recuerdos_pais} in
'1' )
MOTIVO_FUNCION="Codigo incorrecto. Celdas no procesadas."
;;
'2' )
MOTIVO_FUNCION="Error en posicion linea de entrada. Celdas no procesadas."
;;
esac

#----====----====----====----====----====----====----====----====---
#----- [1] Fin Proceso Salida Cadena Fotos
#----====----====----====----====----====----====----====----====---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_genera_celda_recuerdos_pais}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_genera_celda_recuerdos_pais}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_genera_celda_recuerdos_pais}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_genera_celda_recuerdos_pais}
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
