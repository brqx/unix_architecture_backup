#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Diciembre 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="fichero"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- fh
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- ch
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Cambia de ruta basado en la resolucion indicada
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T cambio ruta ficheros fotos
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [RESOLUCION_DETINO]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E fh 1024x0768  -- Cambia la ruta actual por una ruta dependiente de la resolucion
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

fh()
{
IS_fh="Cambio de path en razon de la resolucion fotografica"
INFO_SCRIPT=${IS_fh}

RESOLUCION_DESTINO=$1


if [ "${RESOLUCION_DESTINO}" == "" ]; then

	RESOLUCION_DESTINO=2048x1536
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${RESOLUCION_DESTINO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt fh "[resolucion]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------
RESOLUCION[0]=3264x2448
RESOLUCION[1]=2048x1536
RESOLUCION[2]=1024x0768
RESOLUCION[3]=0640x0480
RESOLUCION[4]=0320x0240
RESOLUCION[5]=0150x0090

cont=0
RESOLUCION_DESTINO_CORRECTA=1

while [ ${cont} -lt 6 ] ; do
#							-- Inicio while --
#----------------------------------------------------------------------
pwd | grep ${RESOLUCION[${cont}]}
COD_SALIDA=$?

if [ "${COD_SALIDA}" == "0"  ] ; then
	RESOLUCION_CAMBIO=${RESOLUCION[${cont}]}
fi

#- Debemos verificar que hay alguna resolucion destino confirmada
if [ "${RESOLUCION_DESTINO}" == "${RESOLUCION[${cont}]}"  ] ; then
	RESOLUCION_DESTINO_CORRECTA=0
fi 


let cont++ ;
#----------------------------------------------------------------------
#							-- Fin while --
done

#- Debemos hacer un not para que se acepte cualquier resolucion que no sea vacia
test "${RESOLUCION_CAMBIO}" != ""
RESOLUCION_ORIGEN_CORRECTA=$?


#-Inhabilitamos la misma resolucion en origen y destino
test "${RESOLUCION_CAMBIO}" != "${RESOLUCION_DESTINO}"
RESOLUCION_ORIGEN_CORRECTA=$?

echo "Vamos a cambiar : ${RESOLUCION_CAMBIO} x ${RESOLUCION_DESTINO}"
## echo "Origen : ${RESOLUCION_ORIGEN_CORRECTA} - Destino ${RESOLUCION_DESTINO_CORRECTA}"

#- Lo lanzamos solo si son distintos o si existe esa ruta
if [ ${RESOLUCION_ORIGEN_CORRECTA} -eq 0 -a  ${RESOLUCION_DESTINO_CORRECTA} -eq 0 ] ; then
	ch ${RESOLUCION_CAMBIO} ${RESOLUCION_DESTINO}
fi

#-Vaciamos variables

RESOLUCION_CAMBIO=
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
