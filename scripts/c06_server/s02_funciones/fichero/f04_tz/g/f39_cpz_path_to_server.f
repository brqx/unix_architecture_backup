#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.6"          #  Version del Script actual
FECHA_SCRIPT="Abril 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="funcion"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05}"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- czf_path_to_server
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - get_nombre_fichero_export
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Transfiere archivos medieante compresion previa
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T backup tar gz ficheros ssh scp servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [usuario] [servidor] [puerto] [origen] [destino]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E czf_path_to_server ibm core 22 -- Transfiere la ruta acutal
#-------------------------------------------------------------------
#E czf_path_to_server S U 22 fich -- Transfiere el fich
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-mini alias czf
czf_path_to_server()
{
IS_czf_path_to_server="Copia un fichero o carpeta comprimiendolo en servidor destino."
INFO_SCRIPT=${IS_czf_path_to_server}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_czf_path_to_server=${INFO_SCRIPT}

#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2012
#-------------------------------------------------------------------

USUARIO_CONEXION=${1}
SERVER=${2}
PORT=${3}
RUTA_FICHERO_ORIGEN=${4}
RUTA_BACKUP_DESTINO=${5}

#-Almacenamos la ruta actual y establecemos codigo de salida y parametros

RUTA_ACTUAL=${PWD}
SALIDA_czf_path_to_server=0

#-Parametrizacion para formalizar la salida de informacion
NOMBRE_SCRIPT_czf_path_to_server=czf_path_to_server
PARAMETROS_SCRIPT_czf_path_to_server="[usuario] [servidor] [puerto] [origen] [destino]"


if [ "${USUARIO_CONEXION}" == "" ]; then
## Activamos un usuario por defecto
USUARIO_CONEXION=ibm
fi  

if [ "${SERVER}" == "" ]; then
##	SERVER=ibrqx
SERVER=core6
fi  

if [ "${PORT}" == "" ]; then
## Activamos un puerto por defecto
##	PORT=65533
PORT=22
fi  

if [ "${RUTA_FICHERO_ORIGEN}" == "" ]; then
RUTA_FICHERO_ORIGEN=${RUTA_ACTUAL}
fi

#-Este parametro indicara el sincronismo con lo que tenemos ademas el que depende del home
if [ "${RUTA_BACKUP_DESTINO}" == "" ]; then
RUTA_BACKUP_DESTINO=${DB_GLOBAL_IMPORT}
fi  

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${USUARIO_CONEXION}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_czf_path_to_server} ${PARAMETROS_SCRIPT_czf_path_to_server}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

##- Vamos a analizar ficheros con comillas, debe indicarlo y no hacer nada
#- Admite rutas absolutas

#- Vamos a hacer el tratamiento del origen - puede ser fichero o ruta
#- dirname no te mira si existe

RUTA_FICHERO=$( dirname ${RUTA_FICHERO_ORIGEN} ) ;
NOMBRE_ORIGEN=$( basename ${RUTA_FICHERO_ORIGEN} ) ;

if [ "${RUTA_FICHERO}" == "." ] ; then
#-La ruta es un solo miembro pero puede ser carpeta o archivo
RUTA_ORIGEN=${RUTA_ACTUAL}/
else
RUTA_ORIGEN=${RUTA_FICHERO}/
fi

#-Tratamiento de la entrada
echo "Ruta Origen  : ${RUTA_FICHERO_ORIGEN} "
echo "Ruta Destino : ${RUTA_BACKUP_DESTINO} "

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

#- La fuente no puede ser una ruta absoluta ya que el tar genera esa estructura
cleanpath ${NOMBRE_ORIGEN}
src=${SALIDA_cleanpath} ;

cleanpath ${RUTA_BACKUP_DESTINO}
dst=${SALIDA_cleanpath} ;

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-------------------------------------------------------------------
#- Gestion de la fecha
#-------------------------------------------------------------------

get_nombre_fichero_export

TAR_FILE=${SALIDA_get_nombre_fichero_export}

#-------------------------------------------------------------------
#- Fin Gestion de la fecha
#-------------------------------------------------------------------

#- Como destino vamos a preparar una ruta organizada

echo "Copiando desde    : $(uname -n)::${RUTA_ORIGEN}  "
echo "Colocando en ruta : ${SERVER}:${PORT}::${dst}"

# Hacemos el tar
# Debemos bajar un nivel

if [ -d ${RUTA_ORIGEN} ] ; then
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#---- [1] Inicio Comprobacion de ruta
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

cd ${RUTA_ORIGEN}

## echo "Hacemos el tar ${PWD}: ./${src} ==  ./${TAR_FILE} "

tar zcpvf ./${TAR_FILE} ${src} &> /dev/null
SALIDA_TAR=$?
SALIDA_czf_path_to_server=${SALIDA_TAR}


# Luego hacemos la copia

##echo "Creamos remotamente : ${PORT} ${USUARIO_CONEXION}@${SERVER}"
##echo "ANTES DEL SCP Creamos remotamente : ${dst}xync_brqx_2011.tar.gz"

if [ "${SALIDA_TAR}" == "0"  ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#---- [2] Inicio Chequeo Permisos TAR
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

## Debemos crear la ruta - Ver si esta sintaxis es correcta para ubuntu
ssh -oPort=${PORT} ${USUARIO_CONEXION}@${SERVER} "mkdir -p ${dst}" &> /dev/null
SALIDA_SSH=$?
SALIDA_czf_path_to_server=${SALIDA_SSH}


if [ "${SALIDA_SSH}" == "0"  ] ; then
#----====----====----====----====----====----====----====----====---
#---- [3] Inicio Copia
#----====----====----====----====----====----====----====----====---

scp -r -P ${PORT} ./${TAR_FILE}  ${USUARIO_CONEXION}@${SERVER}:${dst} &> /dev/null
SALIDA_SCP=$?
SALIDA_czf_path_to_server=${SALIDA_SCP}

if [ "${SALIDA_SCP}" == "0"  ] ; then
#------======------======------======------======------======------=
#---- [4] Inicio Chequeo Copia SCP
#------======------======------======------======------======------=

# echo "Copiamos a la ruta : ${SERVER}::${dst} "

ssh -oPort=${PORT} ${USUARIO_CONEXION}@${SERVER} "cd ${dst} && tar zxvf ./${TAR_FILE} &> /dev/null" &> /dev/null
ERROR_ssh=$?
SALIDA_czf_path_to_server=${ERROR_ssh}


if [ "${ERROR_ssh}" == "0"  ] ; then
#--------========--------========--------========--------========---
#---- [5] Inicio Borrado Remoto
#--------========--------========--------========--------========---

# Borramos el fichero en remoto
ssh -oPort=${PORT} ${USUARIO_CONEXION}@${SERVER} "rm -f ${dst}${TAR_FILE}"
ERROR_ssh=$?
SALIDA_czf_path_to_server=${ERROR_ssh}

if [ "${ERROR_ssh}" == "0"  ] ; then
#----------==========----------==========----------==========----------=
#---- [6] Inicio Borrado Local
#----------==========----------==========----------==========----------=

# Toca borrar el fichero de envio en origen

rm -f ./${TAR_FILE}
ERROR_rm=$?
SALIDA_czf_path_to_server=${ERROR_rm}

if [ "${ERROR_rm}" == "0"  ] ; then
MOTIVO_FUNCION="Copia correcta"
else
MOTIVO_FUNCION="Error al borrar el fichero"
PARAMETROS_MOTIVO_01="./${TAR_FILE}  ${USUARIO_CONEXION}@${SERVER}:${dst}"
fi

#----------==========----------==========----------==========----------=
#---- [6] Fin Borrado Local
#----------==========----------==========----------==========----------=
fi
else

MOTIVO_FUNCION="Error al hacer el borrado remoto"
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Ruta       : ${dst}${TAR_FILE}"

#--------========--------========--------========--------========---
#---- [5] Fin Borrado Remoto
#--------========--------========--------========--------========---
fi
else

MOTIVO_FUNCION="Error al descomprimir el tar"
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="./${TAR_FILE}  ${USUARIO_CONEXION}@${SERVER}:${dst}"

#----====----====----====----====----====----====----====----====---
#---- [4] Fin Descompresion del TAR remoto
#----====----====----====----====----====----====----====----====---
fi
else

MOTIVO_FUNCION="Error al hacer el scp                                 "
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="./${TAR_FILE}  ${USUARIO_CONEXION}@${SERVER}:${dst}"

#----====----====----====----====----====----====----====----====---
#---- [3] Fin Chequeo Copia SCP
#----====----====----====----====----====----====----====----====---
fi
else

MOTIVO_FUNCION="Error al generar el tar"
PARAMETROS_MOTIVO_01="Parametros : ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Ruta actual: ${PWD}"

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#---- [2] Fin Chequeo Permisos TAR
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi
else
#- No existe la ruta origen

MOTIVO_FUNCION="No existe la ruta"
PARAMETROS_MOTIVO_01="${RUTA_ORIGEN}"

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#---- [1] Fin Comprobacion de ruta
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_czf_path_to_server}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_czf_path_to_server}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_czf_path_to_server}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

cd ${RUTA_ACTUAL}
return ${SALIDA_czf_path_to_server}
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
