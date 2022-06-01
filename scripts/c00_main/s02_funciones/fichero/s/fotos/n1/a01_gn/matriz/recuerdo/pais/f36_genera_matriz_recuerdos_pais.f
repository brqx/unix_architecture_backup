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
#-- genera_matriz_recuerdos_pais
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- posiciona - e_pmt - genera_celda_localidades_temporada
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera las matrices necesarias para generar los recuerdos
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generacion matrices matriz arrays tabla recuerdos
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [PAIS] [CORTE] [URL] [FICHERO_DATOS]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E genera_matriz_recuerdos_pais alemania -- Genera la las matrices para pais alemania
#-------------------------------------------------------------------
#E genera_matriz_recuerdos_pais zimbawe 7 - Matrices pais zimbawe con posicion corte 7 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

##- GENERA PAISES LUGARES Y CIUDADES

#-- Vamos a generar una generacion de celda y un proceso general

genera_matriz_recuerdos_pais()
{
IS_genera_matriz_recuerdos_pais="Genera las matrices necesarias para generar los lugares"
INFO_SCRIPT=${IS_genera_matriz_recuerdos_pais}

INFO_SCRIPT_genera_matriz_recuerdos_pais=${INFO_SCRIPT}


PAIS_PASADO=${1}
POSICION_CORTE_FICHERO=${2}
FICHERO_PASADO=${3}
URL_BASE=${4}


SALIDA_genera_matriz_recuerdos_pais=0

NOMBRE_SCRIPT_genera_matriz_recuerdos_pais=genera_matriz_recuerdos_pais
PARAMETROS_SCRIPT_genera_matriz_recuerdos_pais="PAIS [POS_CORTE] [FICHERO] [URL]  "

if [ "${PAIS_PASADO}" == "" ]; then
PAIS_PASADO=zimbawe
fi

#-Gestionamos el separador de campos
if [ "${SEP}" == "" ]; then
SEP=";"
fi

if [ "${FICHERO_PASADO}" == "" ]; then
FICHERO_PASADO=${REPO_VIAJES}zpart/pais/viaje_test_${PAIS_PASADO}.dat
FICHERO_CODIGOS=${RECFOTOS}zpart/pais/${PAIS_PASADO}/entidad/zfoto_codigos_${PAIS_PASADO}.dat
fi  

if [ "${POSICION_CORTE_FICHERO}" == "" ]; then
POSICION_CORTE_FICHERO=7
fi


if [ "${PAIS_PASADO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_genera_matriz_recuerdos_pais} ${PARAMETROS_SCRIPT_genera_matriz_recuerdos_pais}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar fichero
#-- [2] iterar linea por linea invocando a la celdas
#-- [3] Preparar varias matrices con los lugares ciudades y paises indicados
#--------========--------========--------========--------========---

if [ -f ${FICHERO_PASADO} ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio comprobacion fichero
#--------========--------========--------========--------========---

#-Opcion de cambiar a codcat - pero hemos chequeado que no haya espacios
cont_celdas_a_procesar=0
cont_celda_recuerdos=0  

num_filas_fichero=$(cat ${FICHERO_PASADO} | wc -l )
num_recuerdos_fichero=$(cat ${FICHERO_CODIGOS} | wc -l )   ; let num_codigos_fichero--


for u in $(cat ${FICHERO_PASADO} )
do
LINEA_FICHERO="${u}"
posiciona "${TEMPORADA_PASADA}_${cont_celdas_a_procesar}/${num_filas_fichero}:${codigo}"
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
##echo "Procesando : ${LINEA_FICHERO}"
genera_celda_recuerdos_pais ${PAIS_PASADO} ${LINEA_FICHERO} ${POSICION_CORTE_FICHERO} ${URL_BASE}
SALIDA_genera_matriz_recuerdos_pais=${SALIDA_genera_celda_recuerdos_pais}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

let cont_celdas_a_procesar++

done

PARAMETROS_MOTIVO_01="Senda Pasada    : ${SENDA}"
PARAMETROS_MOTIVO_02="Fichero Pasado  : ${FICHERO_PASADO}"
PARAMETROS_MOTIVO_03="Fichero Codigos : ${FICHERO_CODIGOS}"
PARAMETROS_MOTIVO_04="Separador       : ${SEP}"
PARAMETROS_MOTIVO_05="Filas archivo   : ${cont_celdas_a_procesar}"
PARAMETROS_MOTIVO_06="Recuerdos       : ${cont_celda_recuerdos} / ${num_recuerdos_fichero}"

case ${SALIDA_genera_matriz_recuerdos_pais} in
'0' )
MOTIVO_FUNCION="Fichero existe. Celdas procesadas y matrices actualizadas."
;;
'1' )
MOTIVO_FUNCION="Fichero existe. Celdas no procesadas. Error en codigo de entrada."
;;
'2' )
MOTIVO_FUNCION="Fichero existe. Celdas no se han procesado. Error en posicion linea de entrada."
;;
esac

else

MOTIVO_FUNCION="Fichero no existe"
PARAMETROS_MOTIVO_01="Fichero Pasado : ${FICHERO}"

SALIDA_genera_matriz_recuerdos_pais=3

#----====----====----====----====----====----====----====----====---
#----- [1] Fin comprobacion fichero
#----====----====----====----====----====----====----====----====---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_genera_matriz_recuerdos_pais}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_genera_matriz_recuerdos_pais}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_genera_matriz_recuerdos_pais}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_genera_matriz_recuerdos_pais}
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
