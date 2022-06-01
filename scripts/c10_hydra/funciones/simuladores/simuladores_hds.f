#!/usr/bin/bash
#-------------------------------------------------------------------
# Funciones Especificas Entornos Unix - Brqz - I+D
# BRQX / ALTEN - Rct - 2007
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.0"          #  Version del Script actual
FECHA_SCRIPT="Mayo 2008"
#-==================================================================
#+ Funciones:

#-- No Recibe parametros :
#-- Obtiene la configuracion actual de simulacion para HDS
#
#- Ej : simuladores_hds
#
simuladores_hds()
{
# Guardar el path actual

PATH_ACTUAL=$PWD
RUTA_SIMULACION=${SIMULADORES_MQ_HDS}

# Vamos a la ruta de los simuladores ( En principio HDS )
# La idea es que este parametrizado, de forma que permita tanto gpon como alejandra
# Por defecto se quedara con Alejandra

NUM_PARAMETROS=$#
echo "Lanzando Simulacion con ${NUM_PARAMETROS} parametros"
if [ "$NUM_PARAMETROS" != "0" ] ; then
TIPO_CONEXION="$1"

if [ "$TIPO_CONEXION" = "gpon" ] ; then
echo "Gpon"
RUTA_SIMULACION=${RUTA_SIMULACION}Gpon/
elif [ "$TIPO_CONEXION" = "alejandra" ] ; then
echo "Alejandra"
RUTA_SIMULACION=${RUTA_SIMULACION}Alejandra/
else
echo "Ninguna"
RUTA_SIMULACION=${RUTA_SIMULACION}Alejandra/
fi

fi

cd ${RUTA_SIMULACION}

echo "Entrando en ${RUTA_SIMULACION}"
# Iteramos por cada simulador obteniendo su configuracion

#-------------------------------------------------------------------
## clear
#-------------------------------------------------------------------

#-------------------------------------------------------------------
echo "-============================================================-"
echo "Simuladores HDS - {$PLATAFORMA} - ${FECHA}"
echo "-============================================================-"
#-------------------------------------------------------------------

#-------------------------------------------------------------------
for i in `ld2`
do
#
ARCHIVO_GENERICO=${RUTA_SIMULACION}$i/XML/respuesta_generica.xml	;
NOMBRE_SIMULADOR=`echo $i | cut -d "_" -f2`      ;

## echo "Nombre Sim : $NOMBRE_SIMULADOR"
## echo "Xml a tratar : ${ARCHIVO_GENERICO} "				;

simcod_both ${ARCHIVO_GENERICO}						;
outsim_clean								;
####-# ${NOMBRE_SIMULADOR} ${TIPO_ERROR} ${CODIGO_SIMULADOR}	;
#
done
#-------------------------------------------------------------------

# Volvemos a la ruta guardada
cd ${PATH_ACTUAL}							;


}

