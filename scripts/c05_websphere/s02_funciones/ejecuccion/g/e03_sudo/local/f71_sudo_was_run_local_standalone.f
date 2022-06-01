#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Mayo 2012"
STATUS_SCRIPT="all checked"
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
#-- wrunsudo_local_standalone
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- ssh_sudorun
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lanza el wsadmin del websphere indicado
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T was websphere cluster start inicio server
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P ID_WAS
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E wrunsudo_local_standalone soa7a 	-- Lanza el script indicado para el servidor soa7a
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

wrunsudo_local_standalone()
{
IS_wrunsudo_local_standalone="Inicia un servidor standalone remoto con un solo nodo"
INFO_SCRIPT=${IS_wrunsudo_local_standalone}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_wrunsudo_local_standalone=${INFO_SCRIPT}

ID_WAS=${1}
shift

SALIDA_wrunsudo_local_standalone=0

NOMBRE_SCRIPT_wrunsudo_local_standalone=wrunsudo_local_standalone
PARAMETROS_SCRIPT_wrunsudo_local_standalone="ID_WAS"


if [ "${ID_WAS}" == "" ]; then
	ID_WAS="-?"
fi  


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${ID_WAS}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_wrunsudo_local_standalone} ${PARAMETROS_SCRIPT_wrunsudo_local_standalone}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Cargar Datos
#-- [2] Arrancar Servidor
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
was_load_parameters ${ID_WAS}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

posiciona "00_Start:Carga de parametros-${SERVER}"

SALIDA_wrunsudo_local_standalone=${SALIDA_was_load_parameters}

if [ "${SALIDA_was_load_parameters}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Carga de datos contra el WAS indicado
#--------========--------========--------========--------========---

posiciona "01_Start:Servidor-Iniciandose-${SERVER}"

sudo ${LINEA_COMANDO_SERVIDOR_01}		&>		/dev/null
SALIDA_start_was_server=$?

posiciona "02_Start:Servidor-Arrancado-${SERVER}"

SALIDA_wrunsudo_local_standalone=${SALIDA_start_was_server}

if [ "${SALIDA_start_was_server}" == "0" ] ; then
#--------========--------========--------========--------========---
#------- [2] Inicio Servidor del SWAS
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Ejecuccion correcta.Servidor Standalone arrancado."

else
MOTIVO_FUNCION="Error al ejecutar el comando"
PARAMETROS_MOTIVO_01="Conexion: ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Comando : ${LINEA_COMANDO_SERVIDOR_01}"

#--------========--------========--------========--------========---
#------- [2] Fin Servidor del WAS
#--------========--------========--------========--------========---
fi
else
MOTIVO_FUNCION="Error al acceder a los datos"
PARAMETROS_MOTIVO_01="Identificador: ${ID_WAS}"

#--------========--------========--------========--------========---
#----- [1] Fin Carga de datos contra el WAS indicado
#--------========--------========--------========--------========---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_wrunsudo_local_standalone}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_wrunsudo_local_standalone}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_wrunsudo_local_standalone}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_wrunsudo_local_standalone}
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

