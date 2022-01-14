#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
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
#-- genera_fichero_lugares_pais
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- genera_cadena_lugares
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera la salida de todas las temporadas
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generacion fichero fotos temporadas
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [SENDA] [FICHERO] [SEPARADOR] [URL_BASE]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E genera_fichero_lugares_pais -- Genera una linea con la cadena del evento
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

##- SE BASA EN UNA MATRIZ YA GENERADA

genera_fichero_lugares_pais()
{
IS_genera_fichero_lugares_pais="Genera la salida de todas los lugares para el ultimo viaje"
INFO_SCRIPT=${IS_genera_fichero_lugares_pais}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_genera_fichero_lugares_pais=${INFO_SCRIPT}

PAIS_PASADO=${1}
SENDA=${2}
FICHERO_RECURSOS=${3}
SEP=${4}

SALIDA_genera_fichero_lugares_pais=0
NOMBRE_PANTALLA_genera_fichero_lugares_pais=lugares_last.dat

NOMBRE_SCRIPT_genera_fichero_lugares_pais=genera_fichero_lugares_pais
PARAMETROS_SCRIPT_genera_fichero_lugares_pais="[SENDA] [FICHERO] [SEP]"

if [ "${PAIS_PASADO}" == "" ]; then
PAIS_PASADO=italia
fi


if [ "${SENDA}" == "" ]; then
#-La senda puede ser personal e impersonal o viva
SENDA="personal"
fi

if [ "${FICHERO_RECURSOS}" == "" ]; then
FICHERO_RECURSOS=${RECFOTOS}zpart/pais/${PAIS_PASADO}/entidad/zfoto_lugares.dat
fi

#-Gestionamos el separador de campos
if [ "${SEP}" == "" ]; then
SEP=";"
fi

if [ "${SENDA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_genera_fichero_lugares_pais} ${PARAMETROS_SCRIPT_genera_fichero_lugares_pais}

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


#- Va a generar el contenido con cinco fotos

CR='\015'  # Carriage return.
           # 015 is octal ASCII code for CR.
           # Lines in a DOS text file end in CR-LF.
           # Lines in a UNIX text file end in LF only.

if [ -f ${FICHERO_RECURSOS} ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio comprobacion fichero
#--------========--------========--------========--------========---

#-borramos el fichero de lugares que vamos a generar
rm -f ${NOMBRE_PANTALLA_genera_fichero_lugares_pais}

SW_ALGUN_LUGAR=1
cont_archivo=0

for i in $(codcat ${FICHERO_RECURSOS} )
do

LINEA_FICHERO="${i}"

posiciona "${cont_archivo}-${lugar}"
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
genera_cadena_lugares ${LINEA_FICHERO}
SALIDA_genera_fichero_lugares_pais=${SALIDA_genera_cadena_lugares}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-Solo debe tener pantall si hay lugares
if [ "${SALIDA_genera_cadena_lugares}" == "0" ] ; then
echo "${CADENA_LUGARES}"  >> ${NOMBRE_PANTALLA_genera_fichero_lugares_pais}
echo "${CADENA_LUGARES}"  >> ${PANTALLA_BORRAR_genera_fichero_lugares_pais}
PANTALLA_SCRIPT="${NOMBRE_PANTALLA_genera_fichero_lugares_pais}"

SW_ALGUN_LUGAR=0
fi

let cont_archivo++
done

SALIDA_genera_fichero_lugares_pais="${SW_ALGUN_LUGAR}"

PARAMETROS_MOTIVO_01="Senda Pasada   : ${SENDA}"
PARAMETROS_MOTIVO_02="Fichero Pasado : ${FICHERO}"
PARAMETROS_MOTIVO_03="Separador      : ${SEP}"

if [ "${SW_ALGUN_LUGAR}" == "0" ] ; then
MOTIVO_FUNCION="Hay lugares en la matriz y se ha generado el archivo."
else
MOTIVO_FUNCION="Error. No hay lugares en la matriz."
fi

else

MOTIVO_FUNCION="Error al intentar abrir el archivo."

#--------========--------========--------========--------========---
#----- [1] Fin Carga de datos 
#--------========--------========--------========--------========---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_genera_fichero_lugares_pais}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_genera_fichero_lugares_pais}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_genera_fichero_lugares_pais}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_genera_fichero_lugares_pais}
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
