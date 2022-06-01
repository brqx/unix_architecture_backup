#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="5.1" #  Version del Script actual
FECHA_SCRIPT="Febrero 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="form"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- l_pmi2
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#- l_pmt - linea_normal - linea_caracter
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Nos permite controla el formato de los errores - Evitando la redundancia de codigo
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P NOMBRE_FUNCION [MENSAJE][TEXTO_INFORMACION][INFORMACION_ADICCIONAL]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E l_pmi3 f2 "busqueda con filtro" "Salida de la busqueda con ESC"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

# Te devuelve el archivo que contiene la funcion con la linea de la funcion 
# Podemos parametrizarla mucho mas
l_pmi2()
{
IS_l_pmi2="Permite parametrizar la salida de informacion de funciones. Inlcuye informacion adiccional"
EINFO_SCRIPT=${IS_l_pmi2}

# Funcion de informacion variable. No usa INFO_SCRIPT

NOMBRE_FUNCION=$1
MENSAJE=$( echo $2 | tr "_" " " )
TEXTO_INFORMACION=$( echo $3 | tr "_" " " )
INFORMACION_ADICCIONAL=$( echo $4 | tr "_" " " )

#- No admite alias por tanto hay que usar funciones

if [ "${NOMBRE_FUNCION}" == "" ] ; then
NOMBRE_FUNCION="-?"
fi

if [ "${NOMBRE_FUNCION}" == "-?" ] ; then

e_pmt l_pmi2 "[NOMBRE_FUNCION] [MENSAJE] [INFORMACION] "
else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#====================================================================
linea_caracter "="   #linea_iguales
#--------------------------------------------------------------------
echo "       Control de Scripts 1.3 - Funciones - Brqx 2012         "
#--------------------------------------------------------------------
linea_normal
#--------------------------------------------------------------------
echo "       [  Funcion ${NOMBRE_FUNCION}                 ]   		"
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
linea_caracter "==--"
#--------------------------------------------------------------------
echo " Informacion :                                                "
#--------------------------------------------------------------------
linea_alterna
#--------------------------------------------------------------------
echo "- ${INFO_SCRIPT}											    "
#--------------------------------------------------------------------
linea_normal
#--------------------------------------------------------------------
echo " ${MENSAJE}											    "
#--------------------------------------------------------------------
linea_alterna
#--------------------------------------------------------------------
echo "- ${TEXTO_INFORMACION}                                         "
#--------------------------------------------------------------------
linea_normal
#--------------------------------------------------------------------
echo " Informacion Adiccional :  	                                "
#=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=-
linea_caracter "=--"   #dlinea_guiones
#--------------------------------------------------------------------
echo "- ${INFORMACION_ADICCIONAL}                                    "
#--------------------------------------------------------------------
ls -la
#====================================================================
linea_caracter "="   #linea_iguales
#====================================================================

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
