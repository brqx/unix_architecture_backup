#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Febrero 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="websphere"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="proceso"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- listar_perfiles_was
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- linea_normal - linea_alterna - tipo_perfil_was
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lista los perfiles en el entorno websphere indicado
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T listado perfiles websphere 
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P LINEA_CARPETA_Y_ARCHIVO
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E listar_perfiles_was		--		Informa de los perfiles y rutas existentes
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Caracteres especiales :
#
#-- LINE FEED : \012    \0x0a
#
# In Octal:     
# Carriage Return = 015         
# Line Feed = 012   

#-Futuro mini alias verpf
#-Futuro alias ver_perfiles_was

#-La idea es que te muestre los perfiles y los tipos de los mismos
listar_perfiles_was()
{
IS_listar_perfiles_was="Muestra los perfiles definidos en el servidor websphere"
INFO_SCRIPT=${IS_listar_perfiles_was}

INFO=${1}

if [ "${INFO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt listar_perfiles_was 

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------


LINE_FEED=$(echo -e "\012")

SALIDA_PERFILES=$(${WPS_RUN}manageprofiles.sh -listProfiles )
PERFILES_INSTALADOS=$(echo $SALIDA_PERFILES | cut -d "]" -f1 | cut -d "[" -f2 | tr "," " " | tr -s " " | tr ' ' '\012' )

#- La salida es una cadena de perfiles separada por espacio
SERVIDOR=$(uname -n |  tr '[:upper:]' '[:lower:]' )

clear
linea_alterna
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo " INFORMACION DE PERFILES EN SERVIDOR - ${SERVIDOR}      "
linea_normal
#--------------------------------------------------------------
echo " ARQUITECTURA BRQX  - 2012 - MAPFRE         "
linea_alterna
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo "Perfiles existentes : ${SERVIDOR}::${WPS_HOME}  " 
#--------------------------------------------------------------
#-Aqui listamos los perfiles
CABECERA="Nombre-Del-Perfil Tipo"


#-Tenemos preparado los valores de NUM_CRC_TITULO y NUM_CRC_COLUMNA
establece_longitud_titulo_y_columnas ${CABECERA}

ecode $CABECERA
CABECERA=$SALIDA_ECODE
#-El formateo de columnas se hace con cadenas codificadas

linea_caracter "=="
formatea_titulo_y_columnas ${CABECERA}
linea_caracter "=-"

for i in ${PERFILES_INSTALADOS}
do
PERFIL=${i}
TIPO_PERFIL=$(tipo_perfil_was ${PERFIL} )

if [ "${TIPO_PERFIL}" != "" ] ; then

#-Tipo perfil ya incluye el nombre del perfil
## Esto no funciona
##formatea_titulo_y_columnas "${TIPO_PERFIL}"
ecode  "${TIPO_PERFIL}"
formatea_titulo_y_columnas ${SALIDA_ECODE}

fi

done

linea_normal
#--------------------------------------------------------------
echo "Listado de Carpetas : ${WPS_PF}        " 
linea_alterna
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
ls -1 ${WPS_PF}
linea_normal
#--------------------------------------------------------------

#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi
}

#-------------------------------------------------------------------
#+ Sistema de trazado N4 - desactivado
#-------------------------------------------------------------------
#N4# echo "$LEVEL_NIVEL	-	Ejecutadas $CONCEPT_LEVEL"
#-------------------------------------------------------------------

