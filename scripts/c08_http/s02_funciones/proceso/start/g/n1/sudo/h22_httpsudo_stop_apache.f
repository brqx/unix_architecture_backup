#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="2.6" #  Version del Script actual
FECHA_SCRIPT="Marzo 2013"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="cpanel"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="servicios"
CONCEPT_VARIANTE_04=""
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- httpsudo_stop_apache
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- codcat
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Inicia un servicio
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T start inicio servicio
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P SERVICIO
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E httpsudo_stop_apache s1 	-- Inicia el servicio indicado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

httpsudo_stop_apache()
{
IS_httpsudo_stop_apache="Detiene el servidor web apache"
INFO_SCRIPT=${IS_httpsudo_stop_apache}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_httpsudo_stop_apache=${INFO_SCRIPT}

#-Comando es un espacio por defecto
COMANDO_STOP="${1} ${2} ${3}"

SALIDA_httpsudo_stop_apache=0

#-Se trata de un texto de informacion a devolver al llamante
INFOSALIDA_httpsudo_stop_apache=""

NOMBRE_SCRIPT_httpsudo_stop_apache=httpsudo_stop_apache
PARAMETROS_SCRIPT_httpsudo_stop_apache="[-?]"

if [ "${COMANDO_STOP}" == "  " ]; then
COMANDO_STOP="sudo /etc/init.d/apache2 stop"
fi


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${COMANDO_STOP}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_httpsudo_stop_apache} ${PARAMETROS_SCRIPT_httpsudo_stop_apache}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Lanzar comando de parada
#-- [2] Comprobar que se ha parado e informar
#--------========--------========--------========--------========---

${COMANDO_STOP}
SALIDA_httpsudo_stop_apache=$?

LINES_APACHE=10
while [ ${LINES_APACHE} -gt 3 ] ; do

LINES_APACHE=$(ps -eaf | grep apa | grep -v "grep" | wc -l )
sleep 5
done
#-Damos tiempo a que muera el proceso
sleep 5
PROCESOS_CRONOLOG=$(ps -eaf | grep cronolog.sh | tr -s " " | cut -d " " -f2 | tr "\n" " " )
if [ "${PROCESOS_CRONOLOG}" != "" ] ; then
sudo kill -9 "${PROCESOS_CRONOLOG}"  &> /dev/null
fi

PARAMETROS_MOTIVO_01="Comando    : ${COMANDO_STOP}"

if [ "${SALIDA_httpsudo_stop_apache}" == "0" ] ; then
#------======------======------======------======------======------=
#----- [1] Inicio chequeo servicio
#------======------======------======------======------======------=

MOTIVO_FUNCION="Servicio Parado correctamente"

else

MOTIVO_FUNCION="Error al iniciar el servicio"

#------======------======------======------======------======------=
#----- [2] Fin chequeo servicio
#------======------======------======------======------======------=
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_httpsudo_stop_apache}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_httpsudo_stop_apache}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_httpsudo_stop_apache}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
INFOSALIDA_httpsudo_stop_apache=${MOTIVO_FUNCION}
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

COMANDO_STOP=

return ${SALIDA_httpsudo_stop_apache}
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

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================

