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
#-- genera_cadena_lugares
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- ecode - dcode
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
#P [LINEA_CODIFICADA] [SEPARADOR]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E genera_cadena_lugares LF -- Genera una linea con la cadena del evento
#-------------------------------------------------------------------
#E genera_cadena_lugares "Tietar+River+Bridge;La+Iglesuela;Espana;Puente;Puente_"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

##- SE BASA EN UNA MATRIZ YA GENERADA
#-Recibe una linea codificada
#- Chateau+de+Chillon;Montreux;Suiza;Lago;Castillo;120902

genera_cadena_lugares()
{
IS_genera_cadena_lugares="Genera cadena lugares para la linea indicada"
INFO_SCRIPT=${IS_genera_cadena_lugares}

INFO_SCRIPT_genera_cadena_lugares=${INFO_SCRIPT}

LINEA_FICHERO=${1}
SEP=${2}

SALIDA_genera_cadena_lugares=0

NOMBRE_SCRIPT_genera_cadena_lugares=genera_cadena_lugares
PARAMETROS_SCRIPT_genera_cadena_lugares="LINEA_FICHERO [SEP]"

#-Gestionamos el separador de campos
if [ "${SEP}" == "" ]; then
SEP=";"
fi

if [ "${LINEA_FICHERO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_genera_cadena_lugares} ${PARAMETROS_SCRIPT_genera_cadena_lugares}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Decodificar la linea de entrada
#-- [2] Procesar el codigo y recuperar las categorias correspondientes
#--------========--------========--------========--------========---


#- Va a generar el contenido con cinco fotos

CR='\015'  # Carriage return.
           # 015 is octal ASCII code for CR.
           # Lines in a DOS text file end in CR-LF.
           # Lines in a UNIX text file end in LF only.

dcode "${LINEA_FICHERO}"

#-Vamos a eliminar el CR
LINEA_DECODIFICADA=$( echo ${SALIDA_DCODE} | tr -d $CR  )

PENDIENTE_LUGAR=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f1 )
PENDIENTE_CIUDAD=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f2 )
PENDIENTE_PAIS=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f3 )
PENDIENTE_NATURALEZA=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f4 )


#-Es el codigo de la naturaleza no el de las fotos
lugar="${PENDIENTE_LUGAR}"
ciudad=$PENDIENTE_CIUDAD
pais=$PENDIENTE_PAIS
naturaleza=$PENDIENTE_NATURALEZA
construccion=$PENDIENTE_CONSTRUCCION

#-Falta alguna forma de discriminar si es correcto
MOTIVO_FUNCION="Lugar correcto"
PARAMETROS_MOTIVO_01="Lugar        : ${lugar}"
PARAMETROS_MOTIVO_02="Ciudad       : ${ciudad}"
PARAMETROS_MOTIVO_03="Pais         : ${pais}"
PARAMETROS_MOTIVO_04="Naturaleza   : ${temporada}"
PARAMETROS_MOTIVO_05="Construccion : ${construccion}"




let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
ecode ${lugar}
lugar_cod="${SALIDA_ECODE}"
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-Debemos sacar la salida

if [ "${lugares_brqx[${lugar_cod}]}" != "" ] ; then

posiciona "${lugar}"
imagen=${lugares_brqx[${lugar_cod}]}
imss="${imagen}"
##echo "${lugar}${SEP}${ciudad}${SEP}${pais}${SEP}${naturaleza}${SEP}${imss}" 
CADENA_LUGARES="${lugar}${SEP}${ciudad}${SEP}${pais}${SEP}${naturaleza}${SEP}${construccion}${SEP}${imss}"

SALIDA_genera_cadena_lugares=0;
PARAMETROS_MOTIVO_07="Imagen     : ${imagen}"
PARAMETROS_MOTIVO_08="Cadena     : ${CADENA_LUGARES}"
else
#-Si no existe el lugar no generamos la cadena
MOTIVO_FUNCION="El lugar buscado no existe en la matriz"
SALIDA_genera_cadena_lugares=2;

fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_genera_cadena_lugares}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_genera_cadena_lugares}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_genera_cadena_lugares}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_genera_cadena_lugares}
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
