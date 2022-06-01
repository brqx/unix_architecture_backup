#!/usr/bin/bash
#-------------------------------------------------------------------
# Funciones Especificas Entornos Unix - Brqz - I+D
# BRQX NG - Rct - 2007
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.0"          #  Version del Script actual
FECHA_SCRIPT="Septiembre 2007"
#-==================================================================
# * Queremos como objetivo que obtenga el codigo del simulador actual
#+ Funciones:

#-- No Recibe parametros :
#-- Actua en razon de la ruta actual buscando un archivo : respuesta_generica.xml
#-- Parseando el mismo en razon a una cadena : "cod_diagnostico" 

#-- Require : codigosim

simerror()
{
ARCHIVO_GENERICO=respuesta_generica.xml          ;
CADENA_BUSCADA=cod_error                         ;

codigosim ${ARCHIVO_GENERICO} ${CADENA_BUSCADA}  ;
}

