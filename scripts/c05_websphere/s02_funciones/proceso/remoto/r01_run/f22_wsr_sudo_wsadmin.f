#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Septiembre 2012"
STATUS_SCRIPT="testing"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="websphere"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="proceso"
CONCEPT_VARIANTE_04="admin"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- sudowsadmin_run_jacl
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lanza el wsadmin del websphere indicado
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T wsadmin scripts was websphere config server
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E sudowsadmin_run_jacl soa7a scrip	-- Lanza el script JACL indicado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Mini alias wsr
#- Alias wsjacl
sudowsadmin_run_jacl()
{
IS_sudowsadmin_run_jacl="Saca las variables definidas en la celda"
INFO_SCRIPT=${IS_sudowsadmin_run_jacl}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_sudowsadmin_run_jacl=${INFO_SCRIPT}

ID_WAS=${1}
ARCHIVO_JACL=${2}
PARAMETROS_JACL=${3}
RUTA_VARIABLES=${4}

SALIDA_sudowsadmin_run_jacl=0

NOMBRE_SCRIPT_sudowsadmin_run_jacl=sudowsadmin_run_jacl
PARAMETROS_SCRIPT_sudowsadmin_run_jacl="ID_WAS ARCHIVO_JACL PARAMETROS_JACL [RUTA_WAS]"

if [ "${ID_WAS}" == "" ]; then
ID_WAS="-?"
fi  

if [ "${ARCHIVO_JACL}" == "" ]; then
ID_WAS="-?"
fi  

if [ "${PARAMETROS_JACL}" == "" ]; then
ID_WAS="-?"
fi  

if [ "${RUTA_VARIABLES}" == "" ] ; then
#- Solo se ha pasado un parametro
RUTA_VARIABLES=${WPS_PD}bin/
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${FILTRO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_sudowsadmin_run_jacl} ${PARAMETROS_SCRIPT_sudowsadmin_run_jacl}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Cargar Datos
#-- [2] Lanzar script
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
was_load_parameters_wsrun ${ID_WAS} ${ARCHIVO_JACL} ${PARAMETROS_JACL}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

SALIDA_sudowsadmin_run_jacl=${SALIDA_was_load_parameters_wsrun}

if [ "${SALIDA_was_load_parameters_wsrun}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Carga de datos contra el WAS indicado
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
ssh_surun ${USUARIO_CONEXION} ${SERVER} ${PORT} "${LINEA_COMANDO_SERVIDOR_01}"
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
posiciona "01_Lanzamiento:Servidor-${SERVER}"

SALIDA_sudowsadmin_run_jacl=${SALIDA_ssh_surun}


if [ "${SALIDA_ssh_surun}" == "0" ] ; then
#--------========--------========--------========--------========---
#------- [2] Inicio Manager del WAS
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Ejecuccion correcta. Servidor Cluster detenido."

else
MOTIVO_FUNCION="Error al ejecutar el comando"
PARAMETROS_MOTIVO_01="Conexion: ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Comando : ${LINEA_COMANDO_MANAGER}"

#--------========--------========--------========--------========---
#------- [2] Fin Manager del WAS
#--------========--------========--------========--------========---
fi


#--------========--------========--------========--------========---
#----- [1] Fin Carga de datos contra el WAS indicado
#--------========--------========--------========--------========---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_sudowsadmin_run_jacl}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_sudowsadmin_run_jacl}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_sudowsadmin_run_jacl}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_sudowsadmin_run_jacl}
#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi

}

