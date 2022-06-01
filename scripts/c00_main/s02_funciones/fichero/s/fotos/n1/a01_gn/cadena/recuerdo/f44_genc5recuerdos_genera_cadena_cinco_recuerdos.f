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
#-- genera_cadena_cinco_recuerdos
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- ecode - dcode - procesa_linea_codigos
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
#P LINEA_FICHERO [CORTE] [URL] [SEP]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E genera_cadena_cinco_recuerdos LF -- Genera una linea con la cadena del evento
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

##- SE BASA EN UNA MATRIZ YA GENERADA
#-Recibe una linea codificada
#- Chateau+de+Chillon;Montreux;Suiza;Lago;Castillo;120902

genera_cadena_cinco_recuerdos()
{
IS_genera_cadena_cinco_recuerdos="Genera cadena lugares para la linea indicada"
INFO_SCRIPT=${IS_genera_cadena_cinco_recuerdos}

INFO_SCRIPT_genera_cadena_cinco_recuerdos=${INFO_SCRIPT}

LINEA_FICHERO_RECUERDO="${1}"
SEP=${2}

SALIDA_genera_cadena_cinco_recuerdos=0

NOMBRE_SCRIPT_genera_cadena_cinco_recuerdos=genera_cadena_cinco_recuerdos
PARAMETROS_SCRIPT_genera_cadena_cinco_recuerdos="LINEA_FICHERO [SEP]"

if [ "${LINEA_FICHERO_RECUERDO}" == "" ]; then
LINEA_FICHERO_RECUERDO="-?"
fi

#-Gestionamos el separador de campos
if [ "${SEP}" == "" ]; then
SEP=";"
fi

if [ "${LINEA_FICHERO_RECUERDO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_genera_cadena_cinco_recuerdos} ${PARAMETROS_SCRIPT_genera_cadena_cinco_recuerdos}

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

CR='\015'  # Carriage return.
           # 015 is octal ASCII code for CR.
           # Lines in a DOS text file end in CR-LF.
           # Lines in a UNIX text file end in LF only.

dcode "${LINEA_FICHERO_RECUERDO}"

#-Vamos a eliminar el CR
LINEA_DECODIFICADA=$( echo "${SALIDA_DCODE}" | grep -v "^#"  | tr -d $CR  )

tiene_espacios=$( echo "${LINEA_DECODIFICADA}" | grep " " | wc -l )

PARAMETROS_MOTIVO_01="Linea Fichero       : ${LINEA_FICHERO_RECUERDO}"
PARAMETROS_MOTIVO_02="Linea Decodificada  : ${LINEA_DECODIFICADA}"
PARAMETROS_MOTIVO_03="Separador           : ${SEP}"

if [ "${tiene_espacios}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio chequeo espacios
#----====----====----====----====----====----====----====----====---

## Debe ser una funcion que analice los codigos indicados con posicion ya conocida y sin barras
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
procesa_linea_codigos "${LINEA_DECODIFICADA}" 
SALIDA_genera_cadena_recuerdos=${SALIDA_procesa_linea_codigos}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_procesa_linea_codigos}" == "0" ] ; then
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [2] Inicio Existe el codigo para la foto
#-----=====-----=====-----=====-----=====-----=====-----=====-----==


if [ "${cont_brqx_code[${codigo}]}" != "" ] ; then
#------======------======------======------======------======------=
#----- [3] Inicio contador codigo
#------======------======------======------======------======------=

cont_actual=${cont_brqx_code[${codigo}]}

imss=
cont_recuerdos=0

while [ ${cont_recuerdos} -le "5" ] ; do
#--- inicio while ----------------------------------------------- 

indice="${codigo}_${cont_recuerdos}"
if [ "${cinco_codigos[${indice}]}" != "" ] ; then
imss="${imss}${cinco_codigos[${indice}]}${SEP}"
fi

let cont_recuerdos++

#--- fin while -------------------------------------------------- 
done

##echo "${codigo}${SEP}${fecha}${SEP}${pais}${SEP}${ciudad}${SEP}${lugar}${SEP}${naturaleza}${SEP}${temporada}${SEP}${evento}${SEP}${letra}${SEP}${senda}${SEP}${circunstancia}${SEP}${imss}"

CADENA_RECUERDOS="${cadena_fotos}${SEP}${imss}"

SALIDA_genera_cadena_cinco_recuerdos=0;
PARAMETROS_MOTIVO_04="Codigo       : ${codigo}"
PARAMETROS_MOTIVO_05="Fecha        : ${fecha}"
PARAMETROS_MOTIVO_06="Pais         : ${pais}"
PARAMETROS_MOTIVO_07="Ciudad       : ${ciudad}"
PARAMETROS_MOTIVO_08="Lugar        : ${lugar}"
PARAMETROS_MOTIVO_09="Naturaleza   : ${temporada}"
PARAMETROS_MOTIVO_10="Construccion : ${construccion}"
PARAMETROS_MOTIVO_11="Temporada    : ${naturaleza}"
PARAMETROS_MOTIVO_12="Senda        : ${senda}"
PARAMETROS_MOTIVO_13="Imagen       : ${imagen}"
PARAMETROS_MOTIVO_14="Cadena       : ${CADENA_RECUERDOS}"

else
#-Si no existe el lugar no generamos la cadena

MOTIVO_FUNCION="No existe el recuerdo en la cadena"

SALIDA_genera_cadena_cinco_recuerdos=3;

#------======------======------======------======------======------=
#----- [3] Fin contador codigo
#------======------======------======------======------======------=
fi
else
MOTIVO_FUNCION="Error al generar la cadena"

#-----=====-----=====-----=====-----=====-----=====-----=====-----==
#----- [2] Fin Existe el codigo para la foto
#-----=====-----=====-----=====-----=====-----=====-----=====-----==
fi
else

MOTIVO_FUNCION="La linea pasada no es valida. Tiene espacios o no ha sido codificada"

SALIDA_genera_cadena_recuerdos=2;

#--------========--------========--------========--------========---
#----- [1] Fin chequeo espacios
#--------========--------========--------========--------========---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_genera_cadena_cinco_recuerdos}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_genera_cadena_cinco_recuerdos}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_genera_cadena_cinco_recuerdos}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_genera_cadena_cinco_recuerdos}
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
