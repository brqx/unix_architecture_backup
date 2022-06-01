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
#-- genera_celda_localidades_last
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- posiciona - e_pmt - genera_cadena_fotos_last
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
#P LINEA [SEP] [URL]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E genera_celda_localidades_last LINEA -- Genera la celda en matriz de localidades
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

##- GENERA CELDA PAISES LUGARES Y CIUDADES

genera_celda_localidades_last()
{
IS_genera_celda_localidades_last="Actualiza celda de matrices de lugares ciudades y paises"
INFO_SCRIPT=${IS_genera_celda_localidades_last}

INFO_SCRIPT_genera_celda_localidades_last=${INFO_SCRIPT}

LINEA_PASADA=${1}
POSICION_CORTE_FICHERO=${2}
URL_BASE=${3}

SALIDA_genera_celda_localidades_last=0

NOMBRE_SCRIPT_genera_celda_localidades_last=genera_celda_localidades_last
PARAMETROS_SCRIPT_genera_celda_localidades_last="LINEA [SEP] [URL] "

#-Gestionamos el separador de campos
if [ "${SEP}" == "" ]; then
SEP=";"
fi

if [ "${LINEA_PASADA}" == "" ]; then
#-- Habilitamos una linea para prueba rapida
LINEA_PASADA=${LINLAST}
#LINEA_PASADA="-?"
fi  


if [ "${LINEA_PASADA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_genera_celda_localidades_last} ${PARAMETROS_SCRIPT_genera_celda_localidades_last}

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
genera_cadena_fotos_last "${LINEA_PASADA}" ${POSICION_CORTE_FICHERO} ${URL_BASE}
SALIDA_genera_celda_localidades_last=${SALIDA_genera_cadena_fotos_last}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-- Si no se ha generado es absurdo que se procese la matriz

if [ "${SALIDA_genera_cadena_fotos_last}" == "0" ] ; then
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
lugar=$(echo ${LINEA_ACTUAL} |  cut -d ${SEP} -f5 )
ciudad=$(echo ${LINEA_ACTUAL} |  cut -d ${SEP} -f4 )
pais=$(echo ${LINEA_ACTUAL} |  cut -d ${SEP} -f3 )
naturaleza=$(echo ${LINEA_ACTUAL} |  cut -d ${SEP} -f6 )
construccion=$(echo ${LINEA_ACTUAL} |  cut -d ${SEP} -f7 )
temporada=$(echo ${LINEA_ACTUAL} |  cut -d ${SEP} -f8 )
evento=$(echo ${LINEA_ACTUAL} |  cut -d ${SEP} -f9 )


#-Como insertamos aleatoriedad

#- Gestion de lugares ( se mete codificado )
if [ "${lugar}" != "" ] ; then
#--- Inicio Ciudades ----------------------------------------------

ecode "${lugar}"
lugar="${SALIDA_ECODE}"

PARAMETROS_MOTIVO_01="Lugar      : ${lugar}"
PARAMETROS_MOTIVO_02="Ciudad     : ${ciudad}"
PARAMETROS_MOTIVO_03="Pais       : ${pais}"
PARAMETROS_MOTIVO_04="Temporada  : ${temporada}"
PARAMETROS_MOTIVO_05="Imagen     : ${imagen}"


if [ "${lugares_brqx[${lugar}]}"  == "" ] ; then
posiciona "Normal : ${lugar}"
lugares_brqx[${lugar}]=${imagen}
else
#-Ya existe la imagen pero vamos a actualizar la foto
ALEATORIEDAD=$(rnd_num 5)
if [ "${ALEATORIEDAD}" -gt "3" ] ; then
#--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
posiciona "Aleatorio : ${lugar}"
lugares_brqx[${lugar}]=${imagen}
#--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
fi
fi

if [ "${tlugares_brqx[${lugar}_${temporada}]}"  == "" ] ; then
posiciona "Normal : ${lugar}"
tlugares_brqx[${lugar}_${temporada}]=${imagen}
else
#-Ya existe la imagen pero vamos a actualizar la foto
ALEATORIEDAD=$(rnd_num 5)
if [ "${ALEATORIEDAD}" -gt "3" ] ; then
#--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
posiciona "Aleatorio : ${lugar}"
tlugares_brqx[${lugar}_${temporada}]=${imagen}
#--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
fi

fi

#--- Fin Lugares ---------------------------------------------------
fi
PARAMETROS_MOTIVO_06="Tst Arr Lugar : ${lugares_brqx[${lugar}]}"

#- Gestion de ciudades
if [ "${ciudad}" != "" ] ; then
#--- Inicio Ciudades -----------------------------------------------
ecode "${ciudad}"
ciudad="${SALIDA_ECODE}"

if [ "${ciudades_brqx[${ciudad}]}"  == "" ] ; then
posiciona "Normal : ${ciudad}"
ciudades_brqx[${ciudad}]=${imagen}
else
#-Ya existe la imagen pero vamos a actualizar la foto
ALEATORIEDAD=$(rnd_num 5)
if [ "${ALEATORIEDAD}" -gt "3" ] ; then
#--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
posiciona "Aleatorio : ${ciudad}"
ciudades_brqx[${ciudad}]=${imagen}
#--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
fi

fi
PARAMETROS_MOTIVO_07="Tst Arr Ciudad : ${ciudades_brqx[${ciudad}]}"


if [ "${tciudades_brqx[${ciudad}_${temporada}]}"  == "" ] ; then
posiciona "Normal : ${ciudad}"
tciudades_brqx[${ciudad}_${temporada}]=${imagen}
else
#-Ya existe la imagen pero vamos a actualizar la foto
ALEATORIEDAD=$(rnd_num 5)
if [ "${ALEATORIEDAD}" -gt "3" ] ; then
#--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
posiciona "Aleatorio : ${ciudad}"
tciudades_brqx[${ciudad}_${temporada}]=${imagen}
#--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
fi

fi

#--- Fin Ciudades -------------------------------------------------
fi

#- Gestion de paises
if [ "${pais}" != "" ] ; then
#--- Inicio PAISES ------------------------------------------------
ecode "${pais}"
pais="${SALIDA_ECODE}"

if [ "${paises_brqx[${pais}]}"  == "" ] ; then
posiciona "Normal : ${pais}"
paises_brqx[${pais}]=${imagen}
else
#-Ya existe la imagen pero vamos a actualizar la foto
ALEATORIEDAD=$(rnd_num 5)
if [ "${ALEATORIEDAD}" -gt "3" ] ; then
#--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
posiciona "Aleatorio : ${pais}"
paises_brqx[${pais}]=${imagen}
#--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
fi

fi
PARAMETROS_MOTIVO_08="Tst Arr Pais : ${paises_brqx[${pais}]}"


if [ "${tpaises_brqx[${pais}_${temporada}]}"  == "" ] ; then
posiciona "Normal : ${pais}"
tpaises_brqx[${pais}_${temporada}]=${imagen}
else
#-Ya existe la imagen pero vamos a actualizar la foto
ALEATORIEDAD=$(rnd_num 5)
	
if [ "${ALEATORIEDAD}" -gt "3" ] ; then
#--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
posiciona "Aletorio : ${pais}"
tpaises_brqx[${pais}_${temporada}]=${imagen}
#--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
fi

fi

#--- Fin PAISES ----------------------------------------------------
fi

else

SALIDA_genera_cadena_fotos_last=1

MOTIVO_FUNCION="Codigo incorrecto"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin Existe el codigo para la foto
#----====----====----====----====----====----====----====----====---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_genera_celda_localidades_last}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_genera_celda_localidades_last}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_genera_celda_localidades_last}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_genera_celda_localidades_last}
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
