#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.2"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="funcion"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Script ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05}"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- dame_instancias_apache 
#-------------------------------------------------------------------
#-- instancias_apache
#-------------------------------------------------------------------
#-- instancias_apache_out
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#- dame_instancias_apache : Devuelve como codigo de retorno el numero de instancias	
#- instancias_apache      : Devuelve las instancias de Apache en un momento dado
#- instancias_apache_out  : Inserta en un archivo la memoria libre
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
# instancias_apache
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

instancias_proceso()
{
#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------

#- Cambiar httpd x apache -- servidor x work
dame_instancias_proceso
linea_instancias=$?

HORA_ACTUAL=`date +%H_%M_%S`
echo "Instancias del Servidor Apache - ${HORA_ACTUAL} : ${linea_instancias} "

}

#-------------------------------------------------------------------

instancias_apache_out()
{
RUTA_OUT=$PWD

#Se le pasa un identificativo - si no se pasa nada se pone de nombre archivo

ARCHIVO=$1

# Por defecto 10 ejecucciones
if [ "$ARCHIVO" == "" ] ;  then
ARCHIVO=archivo
fi

dame_instancias_apache
linea_instancias=$?

HORA_ACTUAL=`date +%H_%M_%S`
echo "${HORA_ACTUAL}:${linea_instancias}" >> ${RUTA_OUT}/${ARCHIVO}_instancias_servidor.dat
}

#-------------------------------------------------------------------

#- Devuelve solo el valor
dame_instancias_proceso()
{
#-Ajuste servidor - httpd - apache

PROCESO=$1

if [ "${PROCESO}" == "" ]; then
## Activamos un proceso por defecto
##	PROCESO=java
PROCESO=apache
fi  

linea_instancias=`ps -eaf | grep ${PROCESO} | grep -v "grep" | wc -l`
RETURN_INSTANCIAS_PROCESO=${linea_instancias}
return ${linea_instancias}

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

