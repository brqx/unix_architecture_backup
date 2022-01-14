#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Diciembre 2011"
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
#E genera_recuerdos FICHERO -- Genera una linea con la cadena
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

##- SE BASA EN UNA MATRIZ YA GENERADA

#- Alias genrecu
genera_eventos()
{
IS_genera_eventos="Genera los eventos"
INFO_SCRIPT=${IS_genera_eventos}

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

e_pmt genera_eventos "fichero"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

CR='\015'  # Carriage return.
           # 015 is octal ASCII code for CR.
           # Lines in a DOS text file end in CR-LF.
           # Lines in a UNIX text file end in LF only.

#- Iteramos codificando
for i in $(codcat ${FICHERO} ) ; do
#- inicio for ------------------------------------------------------

LINEA_FICHERO="${i}"
dcode "${LINEA_FICHERO}"

#-Vamos a eliminar el CR y la cabecera
LINEA_DECODIFICADA=$( echo ${SALIDA_DCODE} | grep -v "^#" | tr -d $CR  )

PENDIENTE_CODIGO=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f1 )
PENDIENTE_PAIS=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f2 )
PENDIENTE_CIUDAD=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f3 )
PENDIENTE_LUGAR=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f4 )
PENDIENTE_NATURALEZA=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f5 )
PENDIENTE_TEMPORADA=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f6 )

codigo=$PENDIENTE_CODIGO
pais=$PENDIENTE_PAIS
ciudad=$PENDIENTE_CIUDAD
lugar=$PENDIENTE_LUGAR
naturaleza=$PENDIENTE_NATURALEZA
temporada=$PENDIENTE_TEMPORADA

##echo "Codigo : ${codigo} - ${cont_brqx_code[${codigo}]} "

posiciona $codigo

if [ "${cont_brqx_code[${codigo}]}" != "" ] ; then

cont_actual=${cont_brqx_code[${codigo}]}

imss=
cont_eventos=0

indice="${codigo}_${cont_eventos}"
if [ "${cinco_codigos[${indice}]}" != "" ] ; then
imss="${imss}${cinco_codigos[${indice}]}${SEP}"

echo "${codigo}${SEP}${pais}${SEP}${naturaleza}${SEP}${temporada}${SEP}${imss}"
fi

fi

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
