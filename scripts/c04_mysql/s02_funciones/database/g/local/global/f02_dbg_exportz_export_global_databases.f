#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.1"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_MOLDE_04="funciones"
CONCEPT_PRODUCTO_04="mysql"
CONCEPT_ARQUETIPO_04="global"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- dbg_exportz
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - db_list - db_exportz
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Exporta todas las BBDD 
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T exportacion todas bbdds mysql comprimidas tar.gz
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [FILTRO] [RUTA_EXPORT]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E dbg_exportz --> Exporta todas las bbdd del sistema y las comprime
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#alias dbg_exp
dbg_exportz()
{
IS_dbg_exportz="Exporta todas las bases de datos a la ruta indicada comprimidas"
INFO_SCRIPT=${IS_dbg_exportz}

INFO_SCRIPT_dbg_exportz=${INFO_SCRIPT}

FILTRO_EXPORTACION=$1
CARPETA_DESTINO=$2

SALIDA_dbg_exportz=0

NOMBRE_SCRIPT_dbg_exportz=dbg_exportz
PARAMETROS_SCRIPT_dbg_exportz="[FILTRO] [RUTA_EXPORT]"

if [ "${FILTRO_EXPORTACION}" == "-?" ] ;  then

e_pmt ${NOMBRE_SCRIPT_dbg_exportz} ${PARAMETROS_SCRIPT_dbg_exportz}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
db_list ${FILTRO_EXPORTACION}
SALIDA_dbg_exportz=${SALIDA_db_list}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_db_list}" == "0"  ]  ; then
#-----====-----====-----====-----====-----====-----====-----====----
#----- [1] Inicio salida db_list
#-----====-----====-----====-----====-----====-----====-----====----

cont_databases=0

for base_datos_i in $( cat ${NOMBRE_PANTALLA_db_list} ) ; do

posiciona "${cont_databases}_Dbz_Exp:${base_datos_i}"
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
db_exportz ${base_datos_i} ${base_datos_i} ${CARPETA_DESTINO}
SALIDA_dbg_exportz=${SALIDA_db_exportz}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

let cont_databases++
done

PARAMETROS_MOTIVO_01="Filtro           : ${FILTRO_EXPORTACION}"
PARAMETROS_MOTIVO_02="Ruta Exportacion : ${RUTA_EXPORT}"


if [ "${SALIDA_db_exportz}" == "0"  ]  ; then
#-------======-------======-------======-------======-------======----
#----- [2] Inicio salida db_exportz
#-------======-------======-------======-------======-------======----

MOTIVO_FUNCION="BBDDs exportadas correctamente"

else

MOTIVO_FUNCION="Error al exportar BBDDs"

#-------======-------======-------======-------======-------======----
#----- [2] Fin salida db_exportz
#-------======-------======-------======-------======-------======----
fi
else

MOTIVO_FUNCION="Error al listar BBDDs"

#-----====-----====-----====-----====-----====-----====-----====----
#----- [1] Fin salida db_list
#-----====-----====-----====-----====-----====-----====-----====----
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_dbg_exportz}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_dbg_exportz}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_dbg_exportz}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_dbg_exportz}
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

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================
