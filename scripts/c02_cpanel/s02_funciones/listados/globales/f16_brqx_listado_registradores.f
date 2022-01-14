#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Noviembre 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="cpanel"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="listados"
CONCEPT_VARIANTE_04="globales"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- listado_registradores
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- sort_6field
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Saca el listado de los registradores de la arquitectura
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T list registradores registrars project architecture arch
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [-?]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E listado_registradores  	-- Listado de los registradores de la arquitectura
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

listado_registradores()
{
IS_listado_registradores="Muestra los registradores definidos en la arquitectura"
INFO_SCRIPT=${IS_listado_registradores}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_listado_registradores=${INFO_SCRIPT}

FICHERO_ARQUITECTURA_BRQX=${1}

#-Inicializamos las variables para que no falle la suma
SALIDA_listado_registradores=0

NOMBRE_SCRIPT_listado_registradores=listado_registradores
PARAMETROS_SCRIPT_listado_registradores="[-?]"

if [ "${FICHERO_ARQUITECTURA_BRQX}" == "" ]; then
FICHERO_ARQUITECTURA_BRQX=${RECARQ}zdominios_totales_brqx.dat
fi


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${FICHERO_ARQUITECTURA_BRQX}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_listado_registradores} ${PARAMETROS_SCRIPT_listado_registradores}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Acceder bbdd de proyectos
#-- [2] Listar los proyectos disponibles en formato reducido
#-- [3] Listar informacion de cada proyecto en formato extendido
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
sort_6field ${FICHERO_ARQUITECTURA_BRQX} 
SALIDA_listado_registradores=${SALIDA_sort_6field}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

PARAMETROS_MOTIVO_01="Fichero Base : ${FICHERO_ARQUITECTURA_BRQX}"


if [ "${SALIDA_sort_6field}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio chequeo inicio completo de servicios
#----====----====----====----====----====----====----====----====---


NUMERO_REGISTRADORES=$(cat ${PANTALLA_SCRIPT} | grep -v "^#" | cut -d ":" -f6 | sort -u | wc -l )

#- Nos ha debido generar la pantalla
cat ${PANTALLA_SCRIPT} | grep -v "^#" | cut -d ":" -f6 | sort -u | tr -s "\n" " " | fold -s -w ${LONGITUD_LINEA_GLOBAL} > ${PANTALLA_SCRIPT}_cutted

echo "" >> ${PANTALLA_SCRIPT}_cutted

##cp ${PANTALLA_SCRIPT}_cutted ${PANTALLA_SCRIPT}_final
mv ${PANTALLA_SCRIPT}_cutted ${PANTALLA_SCRIPT}

MOTIVO_FUNCION="Registradores listados correctamente"
PARAMETROS_MOTIVO_02="Numero Registradores : ${NUMERO_REGISTRADORES}"

else

MOTIVO_FUNCION="Error al consultar registradores"
SALIDA_listado_registradores=1

#----====----====----====----====----====----====----====----====---
#----- [1] Fin chequeo inicio completo de servicios
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_listado_registradores}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_listado_registradores}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_listado_registradores}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_listado_registradores}
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

