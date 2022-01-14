#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.2"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- java_dupsize_classes
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - java_listall_classes - posiciona
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Busca clases duplicadas con distinto size dentro de un conjunto de jars
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T busqueda clase dups duplicated java jar class clases search duplicadas size
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [RUTA CONTENEDOR_JAR]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E ldupsizejava				-- Lista clases duplicadas y su contenedor
#-------------------------------------------------------------------
#E ldupsizeclass			-- Lista clases duplicadas y su contenedor
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias ldupjava - ldupclass
java_dupsize_classes()
{
IS_java_dupsize_classes="Lista todas las clases duplicadas de los jars indicados con distinto size"
INFO_SCRIPT=${IS_java_dupsize_classes}
#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_java_dupsize_classes=${INFO_SCRIPT}

RUTA_JAR_PASADO=${1}

SALIDA_java_dupsize_classes=0

NOMBRE_SCRIPT_java_dupsize_classes=java_dupsize_classes
PARAMETROS_SCRIPT_java_dupsize_classes="[RUTA CONTENEDOR_JAR]"


if [ "${RUTA_JAR_PASADO}" == "" ]; then
RUTA_JAR_PASADO=${PWD}
fi  


if [ "${RUTA_JAR_PASADO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_java_dupsize_classes} ${PARAMETROS_SCRIPT_java_dupsize_classes}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--Como es una funcion que se puede invocar directamente subimos uno el sw de acceso

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
CODIGO_salida=1

CLASE_ANTERIOR=""
LINEA_ANTERIOR=""
SIZE_ANTERIOR=""

cont_lallcla=0
cont_ldupcla=0



ARCHIVO_CLASES_JAVA=./java_listado_total_clases_ordenado.dat
ARCHIVO_CLASES_JAVA_DUP=./java_listado_clases_duplicadas_ordenado.dat

if [ -e ${ARCHIVO_CLASES_JAVA} ] ; then
rm -f ${ARCHIVO_CLASES_JAVA}
fi

if [ -e ${ARCHIVO_CLASES_JAVA_DUP} ] ; then
rm -f ${ARCHIVO_CLASES_JAVA_DUP}
fi

echo "Antes del listado de clases"

java_listall_classes ${RUTA_JAR_PASADO} > ${ARCHIVO_CLASES_JAVA}

echo "Tras el listado de clases"


NUM_CLASES_JAVA=$(cat ${ARCHIVO_CLASES_JAVA} | wc -l )

PARAMETROS_MOTIVO_01="Contenedor            : ${RUTA_JAR_PASADO}"


if [ ${NUM_CLASES_JAVA} != "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio comprobacion clases en sistema
#----====----====----====----====----====----====----====----====---

MOTIVO_FUNCION="Hay clases en la ruta indicada"

#- Chequear si existe el listado

for indice_dup in $(codcat ${ARCHIVO_CLASES_JAVA}) ; do 
LINEA_JAR_ACTUAL_CODIFICADA=${indice_dup}
dcode "${LINEA_JAR_ACTUAL_CODIFICADA}"
LINEA_JAR_ACTUAL="${SALIDA_DCODE}"

CLASE_ACTUAL=$(echo "${LINEA_JAR_ACTUAL}" | cut -d " " -f1)
SIZE_ACTUAL=$(echo "${LINEA_JAR_ACTUAL}" | cut -d " " -f2)


posiciona "[ Num: ${cont_lallcla}/${cont_ldupcla}/${NUM_CLASES_JAVA} -- Clase:  ${CLASE_ACTUAL} ]"

if [ "${CLASE_ACTUAL}" == "${CLASE_ANTERIOR}" ] ; then
#-Vamos a gestionar al size


if [ "${SIZE_ACTUAL}" != "${SIZE_ANTERIOR}" ] ; then
#-Vamos a gestionar al size

echo ${LINEA_ANTERIOR}		>> ${ARCHIVO_CLASES_JAVA_DUP}
echo ${LINEA_JAR_ACTUAL}	>> ${ARCHIVO_CLASES_JAVA_DUP}
echo ""						>> ${ARCHIVO_CLASES_JAVA_DUP}
let cont_ldupcla++

fi

fi

LINEA_ANTERIOR="${LINEA_JAR_ACTUAL}"
CLASE_ANTERIOR="${CLASE_ACTUAL}"
SIZE_ANTERIOR="${SIZE_ACTUAL}"


let cont_lallcla++

done

PARAMETROS_MOTIVO_02="Numero de clases		: ${NUM_CLASES_JAVA}"

SALIDA_java_dupsize_classes=${CODIGO_salida}

PARAMETROS_MOTIVO_01="Ruta       : ${RUTA_JAR_PASADO}"

if [ "${cont_ldupcla}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [2] Inicio comprobacion clase
#--------========--------========--------========--------========---

MOTIVO_FUNCION="No hay clases duplicadas"

else

MOTIVO_FUNCION="Existen clases duplicadas en el sistema"
PARAMETROS_MOTIVO_03="Clases duplicadas		: ${cont_ldupcla}"


#--------========--------========--------========--------========---
#----- [2] Fin comprobacion clase
#--------========--------========--------========--------========---
fi
else
MOTIVO_FUNCION="No hay clases en el contenedor indicado"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin comprobacion php en sistema
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_java_dupsize_classes}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_java_dupsize_classes}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_java_dupsize_classes}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

#-Quitamos el sw
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


return ${SALIDA_java_dupsize_classes}
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
