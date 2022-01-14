#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Octubre 2012"
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
#-- listado_renovaciones
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- sort_7field
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Saca el listado de las renovaciones de la arquitectura
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T list renews renovaciones architecture arch
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [-?]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E listado_renovaciones  	-- Listado de las renovaciones de la arquitectura
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

listado_renovaciones()
{
IS_listado_renovaciones="Muestra los proyectos definidos en la arquitectura"
INFO_SCRIPT=${IS_listado_renovaciones}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_listado_renovaciones=${INFO_SCRIPT}

FICHERO_ARQUITECTURA_BRQX=${1}

#-Inicializamos las variables para que no falle la suma
SALIDA_listado_renovaciones=0

NOMBRE_SCRIPT_listado_renovaciones=listado_renovaciones
PARAMETROS_SCRIPT_listado_renovaciones="[-?]"

if [ "${FICHERO_ARQUITECTURA_BRQX}" == "" ]; then
FICHERO_ARQUITECTURA_BRQX=${RECARQ}zdominios_totales_brqx.dat
fi


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${FICHERO_ARQUITECTURA_BRQX}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_listado_renovaciones} ${PARAMETROS_SCRIPT_listado_renovaciones}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Acceder bbdd de proyectos
#-- [2] Listar las renovaciones disponibles en formato reducido
#-- [3] Listar informacion de cada renovacion en formato extendido
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
sort_7field ${FICHERO_ARQUITECTURA_BRQX} 
SALIDA_listado_renovaciones=${SALIDA_sort_7field}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

PARAMETROS_MOTIVO_01="Fichero Base : ${FICHERO_ARQUITECTURA_BRQX}"


if [ "${SALIDA_sort_7field}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio chequeo inicio completo de servicios
#----====----====----====----====----====----====----====----====---

NUMERO_RENOVACIONES=$(cat ${PANTALLA_SCRIPT} | grep -v "^#" | cut -d ":" -f7 | sort -u | wc -l )

#- Nos ha debido generar la pantalla
cat ${PANTALLA_SCRIPT} | grep -v "^#" | cut -d ":" -f7 | sort -u | tr -s "\n" " " | fold -s -w ${LONGITUD_LINEA_GLOBAL} > ${PANTALLA_SCRIPT}_cutted

echo "" >> ${PANTALLA_SCRIPT}_cutted

##cp ${PANTALLA_SCRIPT}_cutted ${PANTALLA_SCRIPT}_final
mv ${PANTALLA_SCRIPT}_cutted ${PANTALLA_SCRIPT}

MOTIVO_FUNCION="Renovaciones listados correctamente"
PARAMETROS_MOTIVO_02="Numero Renovaciones : ${NUMERO_RENOVACIONES}"

else

MOTIVO_FUNCION="Error al consultar proyectos"
SALIDA_listado_renovaciones=1

#----====----====----====----====----====----====----====----====---
#----- [1] Fin chequeo inicio completo de servicios
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_listado_renovaciones}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_listado_renovaciones}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_listado_renovaciones}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_listado_renovaciones}
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

