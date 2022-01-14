#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
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
#-- poner_eventos_en_cadena
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- dcode - e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera una cadena de fotos para luego parsearla en razon a una ruta establecida
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T listado total ficheros fotos
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P CODIGO	[ FICH_CONFIG ]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E poner_eventos_en_cadena  -- Prepara las variables pendientes
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

poner_eventos_en_cadena()
{
IS_poner_eventos_en_cadena="Genera las categorias pendientes en razon al codigo"
INFO_SCRIPT=${IS_poner_eventos_en_cadena}

LINEA_FICHERO=$@

if [ "${LINEA_FICHERO}" == "" ]; then
LINEA_FICHERO="-?"
fi

#-El fichero no se le puede pasar como parametro - Se lo pasariamos como variable
if [ "${FICHERO}" == "" ]; then
FICHERO=${RECFOTOS}zpart/full/entidad/zfoto_codigos.dat
fi

if [ "${LINEA_FICHERO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt procesa_codigo_fotos "codigo"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- La linea de entrada viene codifiada

CR='\015'  # Carriage return.
           # 015 is octal ASCII code for CR.
           # Lines in a DOS text file end in CR-LF.
           # Lines in a UNIX text file end in LF only.

dcode "${LINEA_FICHERO}"

#-Vamos a eliminar el CR
LINEA_DECODIFICADA=$( echo ${SALIDA_DCODE} | tr -d $CR  )
 
CODIGO=$(echo "${LINEA_DECODIFICADA}" | cut -d ";" -f1 )

#- Esto ya no es necesario pues hemos formado el fichero
EVENTO="$(cat zfoto_codigos_year.dat | grep ${CODIGO} | cut -d ';' -f7- )"

##echo "Linea pasada       : ${LINEA_FICHERO} "
##echo "Linea decodificada : ${LINEA_DECODIFICADA} "
##echo "Evento : ${EVENTO} "
echo "${LINEA_DECODIFICADA};${EVENTO}"

##EVENTO=
##CODIGO=
fi
}


#-------------------------------------------------------------------
#+ Sistema de trazado N4 - desactivado
#-------------------------------------------------------------------
#N4# echo "$LEVEL_NIVEL	-	Ejecutadas $CONCEPT_LEVEL"
#-------------------------------------------------------------------
