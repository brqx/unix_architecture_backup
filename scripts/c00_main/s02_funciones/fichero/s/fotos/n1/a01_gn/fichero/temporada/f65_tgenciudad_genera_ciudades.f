#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Enero 2012"
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
#-- genera_salida_tciudades
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- PENDIENTE
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
#E genera_salida_tciudades -- Genera una linea con la cadena del evento
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias gentemp
genera_salida_tciudades()
{
IS_genera_salida_tciudades="Genera la salida de todas las temporadas"
INFO_SCRIPT=${IS_genera_salida_tciudades}

SENDA=${1}
FICHERO=${2}
SEP=${3}

if [ "${SENDA}" == "" ]; then
#-La senda puede ser personal e impersonal o viva
SENDA="personal"
fi

if [ "${FICHERO}" == "" ]; then
FICHERO=/brqx/zzinfo/fotos/temporada/ztempo_ciudades.dat
fi

#-Gestionamos el separador de campos
if [ "${SEP}" == "" ]; then
SEP=";"
fi

if [ "${SENDA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt genera_salida_tciudades "[FICHERO] [URL_BASE]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------
#- Va a generar el contenido con cinco fotos

CR='\015'  # Carriage return.
           # 015 is octal ASCII code for CR.
           # Lines in a DOS text file end in CR-LF.
           # Lines in a UNIX text file end in LF only.

rm -f ./tciudad_2012.dat

for i in $(codcat ${FICHERO} )
do

LINEA_FICHERO="${i}"
dcode "${LINEA_FICHERO}"

#-Vamos a eliminar el CR
LINEA_DECODIFICADA=$( echo ${SALIDA_DCODE} | tr -d $CR  )

PENDIENTE_CIUDAD=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f1 )
PENDIENTE_PAIS=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f2 )
PENDIENTE_NATURALEZA=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f3 )
PENDIENTE_TEMPORADA=$(echo ${LINEA_DECODIFICADA} | cut -d ${SEP} -f4 )

#-Es el codigo de la naturaleza no el de las fotos
ciudad=$PENDIENTE_CIUDAD
pais=$PENDIENTE_PAIS
naturaleza=$PENDIENTE_NATURALEZA
temporada=$PENDIENTE_TEMPORADA
senda=$SENDA

ecode ${ciudad}
ciudad_cod="${SALIDA_ECODE}"

if [ "${tciudades_brqx[${ciudad_cod}_${temporada}]}" != "" ] ; then
posiciona "${ciudad}"
imagen=${tciudades_brqx[${ciudad_cod}_${temporada}]}
imss="${imagen}"
echo "${ciudad}${SEP}${pais}${SEP}${naturaleza}${SEP}${temporada}${SEP}${imss}" >> ./tciudad_2012.dat
fi

done

#- Vaciamos variables
imss=
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
