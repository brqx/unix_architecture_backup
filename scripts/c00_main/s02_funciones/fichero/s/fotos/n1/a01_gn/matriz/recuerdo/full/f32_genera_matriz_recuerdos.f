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
#-- genera_matriz_recuerdos
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
#P [CORTE] [URL] [FICHERO_DATOS]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E genera_matriz_recuerdos -- Genera la las matrices 
#-------------------------------------------------------------------
#E genera_matriz_recuerdos 7 - Matrices con posicion corte 7 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

##- GENERA PAISES LUGARES Y CIUDADES

#-- Vamos a generar una generacion de celda y un proceso general

genera_matriz_recuerdos()
{
IS_genera_matriz_recuerdos="Genera las matrices necesarias para generar los lugares"
INFO_SCRIPT=${IS_genera_matriz_recuerdos}

INFO_SCRIPT_genera_matriz_recuerdos=${INFO_SCRIPT}


POSICION_CORTE_FICHERO=${1}
FICHERO_PASADO=${2}
URL_BASE=${3}


SALIDA_genera_matriz_recuerdos=0

NOMBRE_SCRIPT_genera_matriz_recuerdos=genera_matriz_recuerdos
PARAMETROS_SCRIPT_genera_matriz_recuerdos="[FICHERO] [SEP] [URL] "

#-Gestionamos el separador de campos
if [ "${SEP}" == "" ]; then
SEP=";"
fi

if [ "${FICHERO_PASADO}" == "" ]; then
FICHERO_PASADO=${REPO_VIAJES}zpart/full/viaje_test.dat
FICHERO_CODIGOS=${RECFOTOS}zpart/full/entidad/zfoto_codigos.dat
fi  

if [ "${POSICION_CORTE_FICHERO}" == "" ]; then
POSICION_CORTE_FICHERO=7
fi


if [ "${POSICION_CORTE_FICHERO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_genera_matriz_recuerdos} ${PARAMETROS_SCRIPT_genera_matriz_recuerdos}

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

if [ -f ${FICHERO_PASADO} -a  -f ${FICHERO_CODIGOS} ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio comprobacion fichero
#--------========--------========--------========--------========---

#-Opcion de cambiar a codcat - pero hemos chequeado que no haya espacios
cont_celdas_a_procesar=0
cont_celda_recuerdos=0  

num_filas_fichero=$(cat ${FICHERO_PASADO} | wc -l )
num_recuerdos_fichero=$(cat ${FICHERO_CODIGOS} | wc -l )   
	
let num_codigos_fichero--


for u in $(cat ${FICHERO_PASADO} )
do
LINEA_FICHERO="${u}"
posiciona "${cont_celdas_a_procesar}/${num_filas_fichero}:${codigo}"
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
##echo "Procesando : ${LINEA_FICHERO}"
genera_celda_recuerdos ${LINEA_FICHERO} ${POSICION_CORTE_FICHERO} ${URL_BASE}
SALIDA_genera_matriz_recuerdos=${SALIDA_genera_celda_recuerdos}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

let cont_celdas_a_procesar++

done

PARAMETROS_MOTIVO_01="Senda Pasada    : ${SENDA}"
PARAMETROS_MOTIVO_02="Fichero Pasado  : ${FICHERO_PASADO}"
PARAMETROS_MOTIVO_03="Fichero Codigos : ${FICHERO_CODIGOS}"
PARAMETROS_MOTIVO_04="Separador       : ${SEP}"
PARAMETROS_MOTIVO_05="Filas archivo   : ${cont_celdas_a_procesar}"
PARAMETROS_MOTIVO_06="Recuerdos       : ${cont_celda_recuerdos} / ${num_recuerdos_fichero}"

case ${SALIDA_genera_matriz_recuerdos} in
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

MOTIVO_FUNCION="Fichero no existe ( o bien datos o bien codigos )"
PARAMETROS_MOTIVO_01="Fichero Pasado : ${FICHERO_PASADO}"
PARAMETROS_MOTIVO_02="Fichero Codigos : ${FICHERO_CODIGOS}"

SALIDA_genera_matriz_recuerdos=3

#----====----====----====----====----====----====----====----====---
#----- [1] Fin comprobacion fichero
#----====----====----====----====----====----====----====----====---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_genera_matriz_recuerdos}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_genera_matriz_recuerdos}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_genera_matriz_recuerdos}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_genera_matriz_recuerdos}
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
