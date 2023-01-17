#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2022
#-------------------------------------------------------------------
VERSION_SCRIPT="2.5" #  Version del Script actual
FECHA_SCRIPT="Julio 2022"
STATUS_SCRIPT="pending"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="special"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#L-- colors - brqz
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Establece un prompt que se basa en la ultima ruta de la estructura de directorios
#-------------------------------------------------------------------
#T generacion prompt
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E setblue   -- Prepara el prompt con una cadena indicada
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

dim="$(tput dim)"

red="$(      tput setaf 1)"
green="$(    tput setaf 2)" 
yellow="$(   tput setaf 3)" 
blue="$(     tput setaf 4)" 
magent="$(   tput setaf 5)" 
cyan="$(     tput setaf 6)" 
white="$(    tput setaf 7)" 
black="$(    tput setaf 0)" 


main_console_color="black"

textreset_general="$(tput sgr0)" # reset the foreground colour

# red - green - yellow - glue - magent - black
# cyan - white
textreset()
{
echo -n "${textreset_general}"

case ${main_console_color} in

red)
setred
;;
green)
setgreen
;;
yellow)
setyellow
;;
cyan)
setcyan
;;
white)
setwhite
;;
magent)
setmagent
;;
black)
setblack
;;
blue)
setblue
;;
*)
setblack

esac

}

# red - green - yellow - blue - magent - black
# cyan - white

setblue(){    
  echo -n "$blue" 
  main_console_color="blue"
}

setred(){    
  echo -n "$red" 
  main_console_color="red"
}

setgreen(){    
  echo -n "$green" 
  main_console_color="green"
}

setyellow(){    
  echo -n "$yellow" 
  main_console_color="yellow"
}

setmagent(){    
  echo -n "$magent" 
  main_console_color="magent"
}

setcyan(){    
  echo -n "$cyan" 
  main_console_color="cyan"
}

setwhite(){    
  echo -n "$white" 
  main_console_color="white"
}

setblack(){    
  echo -n "$black" 
  main_console_color="black"
}

setreset(){   
  echo "$textreset" 
}


#-------------------------------------------------------------------

putblue()
{
IS_putblue="Put blue color text"
INFO_SCRIPT=${IS_putblue}

INFO=$1

if [ "${INFO}" == "-?" ] ; then

e_pmt manage_short_paths

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

setblue 
echo -n "${*}"
setreset
#echo ""

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
