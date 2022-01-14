#!/usr/bin/bash
#-------------------------------------------------------------------
# Funciones Especificas Entornos Unix - Brqz - I+D
# BRQX NG - Rct - 2007
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.0"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2007"
#-==================================================================
#+ Funciones:

#-- No Recibe parametros :
#-- Obtiene la configuracion actual de simulacion para HDS
#
#- Ej : simuladores_hds
#
simuladores_soap()
{
# Guardar el path actual

PATH_ACTUAL=$PWD

# Vamos a la ruta de los simuladores ( En principio HDN - SIA )

cd ${SIMULADORES_SOAP_HOME}

# Iteramos por cada simulador obteniendo su configuracion

#-------------------------------------------------------------------
clear
#-------------------------------------------------------------------

#-------------------------------------------------------------------
echo "-============================================================-"
echo "Simuladores SOAP - {$PLATAFORMA} - ${FECHA}"
echo "-============================================================-"
#-------------------------------------------------------------------

#-------------------------------------------------------------------
for i in `ld2 | grep "^[A-Z]" | grep -v WEB-INF `
do
#
ARCHIVO_GENERICO=${SIMULADORES_SOAP_HOME}$i/XML/respuesta_generica.xml	;
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

