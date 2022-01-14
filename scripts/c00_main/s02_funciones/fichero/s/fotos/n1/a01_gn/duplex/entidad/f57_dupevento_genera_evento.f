#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Diciembre 2012"
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
#-- genera_eventos
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- posiciona - e_pmt - codcat - dcode
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera un conjunto de cadenas de eventos
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generacion eventos cadena fotos categorias
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P LINEA_CARPETA_Y_ARCHIVO
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E duplica_salida_eventos FICHERO -- Genera una linea con la cadena
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias dupeven
duplica_salida_eventos()
{
IS_duplica_salida_eventos="Genera los eventos"
INFO_SCRIPT=${IS_duplica_salida_eventos}

FICHERO=${1}
POSICION_CORTE_FICHERO=${2}
SEP=${3}
URL_BASE=${4}

if [ "${FICHERO}" == "" ]; then
FICHERO=${RECFOTOS}zpart/full/entidad/zfoto_codigos.dat
fi

if [ "${POSICION_CORTE_FICHERO}" == "" ]; then
POSICION_CORTE_FICHERO=13
fi  

#-Gestionamos el separador de campos
if [ "${SEP}" == "" ]; then
SEP=";"
fi

if [ "${URL_BASE}" == "" ]; then
URL_BASE="http://cica.kbrqx.com/files/pers/recuerdos/"
fi  

if [ "${FICHERO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt duplica_salida_eventos "fichero"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

CR='\015'  # Carriage return.
           # 015 is octal ASCII code for CR.
           # Lines in a DOS text file end in CR-LF.
           # Lines in a UNIX text file end in LF only.

if [ -f "./dup_codigos_2012.dat" ] ; then
#-borramos el fichero de lugares que vamos a generar
rm -f ./dup_codigos_2012.dat
fi



#- Iteramos codificando
for i in $(codcat ${FICHERO} ) ; do
#- inicio for ------------------------------------------------------

LINEA_FICHERO="${i}"
dcode "${LINEA_FICHERO}"

#-Vamos a eliminar el CR y la cabecera
LINEA_DECODIFICADA=$( echo ${SALIDA_DCODE} | grep -v "^#" | tr -d $CR  )

PENDIENTE_CODIGO=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f1 )
PENDIENTE_FECHA=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f2 )
PENDIENTE_PAIS=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f3 )
PENDIENTE_CIUDAD=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f4 )
PENDIENTE_LUGAR=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f5 )
PENDIENTE_NATURALEZA=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f6 )
PENDIENTE_TEMPORADA=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f7 )
PENDIENTE_PARAJE=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f8 )
PENDIENTE_LETRA=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f9 )
PENDIENTE_CIRCUNSTANCIA=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f10 )
PENDIENTE_ENCANTO=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f11 )

codigo=$PENDIENTE_CODIGO
fecha=$PENDIENTE_FECHA
pais=$PENDIENTE_PAIS
ciudad=$PENDIENTE_CIUDAD
lugar=$PENDIENTE_LUGAR
paraje=$PENDIENTE_PARAJE
naturaleza=$PENDIENTE_NATURALEZA
temporada=$PENDIENTE_TEMPORADA
letra=$PENDIENTE_LETRA
circunstancia=$PENDIENTE_CIRCUNSTANCIA
encanto=$PENDIENTE_ENCANTO

##echo "Codigo : ${codigo} - ${cont_brqx_code[${codigo}]} "

posiciona $codigo

if [ "${cont_brqx_code[${codigo}]}" != "" ] ; then

cont_actual=${cont_brqx_code[${codigo}]}

imss="${imss}${cinco_codigos[${indice}]}${SEP}"

fi

#Falta poner la d
#-Aplicamos el duplicado tanto si hay imagen como si no
dup="${codigo}${SEP}${fecha}${SEP}${pais}${SEP}${ciudad}${SEP}${lugar}${SEP}"
dup="${dup}${naturaleza}${SEP}${temporada}${SEP}${paraje}${SEP}${letra}${SEP}"
dup="${dup}${circunstancia}${SEP}"

##dup="${codigo}${SEP}${pais}${SEP}${ciudad}${SEP}${lugar}${SEP}"
##dup="${dup}${naturaleza}${SEP}${temporada}${SEP}"

echo "${dup}${dup}${imss}" >> ./dup_codigos_2012.dat


#- fin for ------------------------------------------------------
done
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
