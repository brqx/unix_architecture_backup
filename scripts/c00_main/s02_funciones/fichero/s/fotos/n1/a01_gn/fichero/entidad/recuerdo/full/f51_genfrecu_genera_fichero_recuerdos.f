#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
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
#-- genera_fichero_recuerdos
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- genera_cadena_recuerdos
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
#P [FICHERO] [SEPARADOR] [SENDA]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E genera_fichero_recuerdos FICHERO -- Genera una linea con la cadena
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

##- SE BASA EN UNA MATRIZ YA GENERADA

genera_fichero_recuerdos()
{
IS_genera_fichero_recuerdos="Genera los recuerdos"
INFO_SCRIPT=${IS_genera_fichero_recuerdos}

FICHERO_RECURSOS=${1}
SEP=${2}
SENDA=${3}

SALIDA_genera_fichero_recuerdos=0
NOMBRE_PANTALLA_genera_fichero_recuerdos=recuerdos_last.dat
PANTALLA_BORRAR_genera_fichero_recuerdos=recuerdos_last_borrar.dat


NOMBRE_SCRIPT_genera_fichero_recuerdos=genera_fichero_recuerdos
PARAMETROS_SCRIPT_genera_fichero_recuerdos="TEMPORADA [SENDA] [FICHERO] [SEP]"


if [ "${SENDA}" == "" ]; then
#-La senda puede ser personal e impersonal o viva
SENDA="personal"
fi

if [ "${FICHERO_RECURSOS}" == "" ]; then
FICHERO_RECURSOS=${RECFOTOS}zpart/full/entidad/zfoto_codigos.dat
fi

#-Gestionamos el separador de campos
if [ "${SEP}" == "" ]; then
SEP=";"
fi

if [ "${FICHERO_RECURSOS}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_genera_fichero_recuerdos} ${PARAMETROS_SCRIPT_genera_fichero_recuerdos} 

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Procesar archivo
#-- [2] Codificar linea
#-- [3] Generar salida lugares con linea procesada
#--------========--------========--------========--------========---

CR='\015'  # Carriage return.
           # 015 is octal ASCII code for CR.
           # Lines in a DOS text file end in CR-LF.
           # Lines in a UNIX text file end in LF only.

if [ -f ${FICHERO_RECURSOS} ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#----- [1] Inicio comprobacion fichero
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

#-borramos el fichero de lugares que vamos a generar
rm -f ${NOMBRE_PANTALLA_genera_fichero_recuerdos}

SW_ALGUN_RECUERDO=1
cont_archivo=0

for i in $(codcat ${FICHERO_RECURSOS} )  ; do
#- inicio for ------------------------------------------------------

LINEA_FICHERO="${i}"

posiciona "${cont_archivo}-${ciudad}"
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
genera_cadena_recuerdos "${LINEA_FICHERO}" 
SALIDA_genera_fichero_recuerdos=${SALIDA_genera_cadena_recuerdos}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-Solo debe tener pantall si hay lugares o el codigo es correcto
if [ "${SALIDA_genera_cadena_recuerdos}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [2] Inicio Codigo procesado correcto
#----====----====----====----====----====----====----====----====---

echo "${CADENA_RECUERDOS}"  >> ${NOMBRE_PANTALLA_genera_fichero_recuerdos}
echo "${CADENA_RECUERDOS}"  >> ${PANTALLA_BORRAR_genera_fichero_recuerdos}
PANTALLA_SCRIPT="${NOMBRE_PANTALLA_genera_fichero_recuerdos}"

SW_ALGUN_RECUERDO=0

#----====----====----====----====----====----====----====----====---
#----- [2] Fin Codigo procesado correcto
#----====----====----====----====----====----====----====----====---
fi


let cont_archivo++

#- fin for ------------------------------------------------------
done

SALIDA_genera_fichero_recuerdos="${SW_ALGUN_RECUERDO}"

PARAMETROS_MOTIVO_01="Temporada Pasada   : ${SENDA}"
PARAMETROS_MOTIVO_02="Fichero Pasado     : ${FICHERO}"
PARAMETROS_MOTIVO_03="Separador          : ${SEP}"
PARAMETROS_MOTIVO_04="Senda Pasada       : ${SENDA}"


if [ "${SW_ALGUN_RECUERDO}" == "0" ] ; then
MOTIVO_FUNCION="Hay recuerdos en la matriz y se ha generado el archivo."
else
MOTIVO_FUNCION="Error. No hay recuerdos en la matriz."
fi

else

MOTIVO_FUNCION="Error al intentar abrir el archivo."

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#----- [1] Fin comprobacion fichero
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_genera_fichero_recuerdos}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_genera_fichero_recuerdos}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_genera_fichero_recuerdos}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_genera_fichero_recuerdos}
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
