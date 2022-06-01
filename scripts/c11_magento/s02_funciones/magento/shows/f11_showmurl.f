#!/usr/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2010
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Febrero 2010"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_CARACTER="especifico"
CONCEPT_MOLDE="funcion"
CONCEPT_ARQUETIPO="proceso"
CONCEPT_LEVEL="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} ${CONCEPT_CARACTER}"
#-==================================================================
#+ Funciones definidos:
#-------------------------------------------------------------------
#-- surl (show url)
#-------------------------------------------------------------------

#-==================================================================

#- Drupal Viewer - Muestra la URL y la BBDD configurada
#-------------------------------------------------------------------
#-- Recive como parametro :
#-------------------------------------------------------------------
#-- 1. Cuenta en la que comprobarlo
#-------------------------------------------------------------------


murl()
{
CUENTA_PASADA=$1

RUTA_ACTUAL=${PWD}
ENFOQUE_DEFECTO=test
SITUACION=OK

# Lo primero que hay que ver es que se lanze o no desde el home o desde una 
# ruta de subdominio

if [ "${RUTA_ACTUAL}" = "/home" ] ; then
#-====----========----========----========----========----========--
#-echo "Se lanza desde el home"

if [ "${CUENTA_PASADA}" == "" ] ; then
#-------------------------------------------------------------------
#- Se lanza desde el home y no se ha pasado parametro, es un error
SITUACION=FALLO

#-------------------------------------------------------------------
else
#-------------------------------------------------------------------
#- Se lanza desde el home y se pasa parametro (ok)
INICIO_RUTA=${RUTA_ACTUAL}/${CUENTA_PASADA}/www/sites/default/
RUTA_PORTAL=${RUTA_ACTUAL}/${CUENTA_PASADA}/www

#-------------------------------------------------------------------
fi

#-====----========----========----========----========----========--
else
#-====----========----========----========----========----========--
# En este caso no esta en el home, por lo que es un subodominio
# entonces hay que obtener la ruta del fichero de subdominios

#- Vamos a ver si se pasa la cuenta

if [ "${CUENTA_PASADA}" == "" ] ; then
#-------------------------------------------------------------------
#- no se pasa cuenta, debemos entender que estamos en la ruta del portal
INICIO_RUTA=${RUTA_ACTUAL}/app/etc
RUTA_PORTAL=${RUTA_ACTUAL}
#-------------------------------------------------------------------
else
#-------------------------------------------------------------------
#- Se pasa una cuenta al subdominio, hay que averiguar su enfoque

ENFOQUE=`cat ${RUTA_ACTUAL}/subdominios.dat | grep ${CUENTA_PASADA} | cut -d ":" -f1`

#-Una vez que tenemos el enfoque se puede generar la URL completa 

INICIO_RUTA=${RUTA_ACTUAL}/brqxng/proyectos/${ENFOQUE}/${CUENTA_PASADA}/www/app/etc
RUTA_PORTAL=${RUTA_ACTUAL}/brqxng/proyectos/${ENFOQUE}/${CUENTA_PASADA}

#-------------------------------------------------------------------
fi
#-====----========----========----========----========----========--
fi

if [ "${SITUACION}" = "FALLO"  ] ; then
#-------------------------------------------------------------------
echo "No se puede obtener la información desde el directorio home sin indicar proyecto"

#-------------------------------------------------------------------
else
#-------------------------------------------------------------------
#- Una vez que es correcta la ruta, entramos en el segundo apartado

base_datos=`cat ${INICIO_RUTA}/local.xml | grep dbname | cut -d "[" -f3 | cut -d "]" -f1`
usuario_db=`cat ${INICIO_RUTA}/local.xml | grep username | cut -d "[" -f3 | cut -d "]" -f1`

#Esta hay que sacarla de BD
url_pedida=`cat ${INICIO_RUTA}/local_xml | grep base_url | cut -d "=" -f2 | cut -d ":" -f2 | cut -d "'" -f1  | cut -c3- `

echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo " Magento Path   :    BBDD       -     Url		 "
echo "-----------------------------------------------"
echo "${RUTA_PORTAL} : ${base_datos} - ${url_pedida} "
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
#-------------------------------------------------------------------
fi

}

# Alias suo
surl_out()
{
CUENTA_PASADA=$1

RUTA_ACTUAL=${PWD}
ENFOQUE_DEFECTO=test
SITUACION=OK

# Lo primero que hay que ver es que se lanze o no desde el home o desde una 
# ruta de subdominio

if [ "${RUTA_ACTUAL}" = "/home" ] ; then
#-====----========----========----========----========----========--
#-echo "Se lanza desde el home"

if [ "${CUENTA_PASADA}" == "" ] ; then
#-------------------------------------------------------------------
#- Se lanza desde el home y no se ha pasado parametro, es un error
SITUACION=FALLO

#-------------------------------------------------------------------
else
#-------------------------------------------------------------------
#- Se lanza desde el home y se pasa parametro (ok)

INICIO_RUTA=${RUTA_ACTUAL}/${CUENTA_PASADA}/www/sites/default/
RUTA_PORTAL=${RUTA_ACTUAL}/${CUENTA_PASADA}/www
#-------------------------------------------------------------------
fi

#-====----========----========----========----========----========--
else
#-====----========----========----========----========----========--
# En este caso no esta en el home, por lo que es un subodominio
# entonces hay que obtener la ruta del fichero de subdominios

#- Vamos a ver si se pasa la cuenta

if [ "${CUENTA_PASADA}" == "" ] ; then
#-------------------------------------------------------------------
#- no se pasa cuenta, debemos entender que estamos en la ruta del portal
INICIO_RUTA=${RUTA_ACTUAL}/sites/default
RUTA_PORTAL=${RUTA_ACTUAL}

#-------------------------------------------------------------------
else
#-------------------------------------------------------------------
#- Se pasa una cuenta al subdominio, hay que averiguar su enfoque

ENFOQUE=`cat ${RUTA_ACTUAL}/subdominios.dat | grep ${CUENTA_PASADA} | cut -d ":" -f1`

#-Una vez que tenemos el enfoque se puede generar la URL completa 

INICIO_RUTA=${RUTA_ACTUAL}/brqxng/proyectos/${ENFOQUE}/${CUENTA_PASADA}/sites/default
RUTA_PORTAL=${RUTA_ACTUAL}/brqxng/proyectos/${ENFOQUE}/${CUENTA_PASADA}
#-------------------------------------------------------------------
fi
#-====----========----========----========----========----========--
fi

if [ "${SITUACION}" = "FALLO"  ] ; then
#-------------------------------------------------------------------
echo "No se puede obtener la información desde el directorio home sin indicar proyecto"

#-------------------------------------------------------------------
else
#-------------------------------------------------------------------
#- Una vez que es correcta la ruta, entramos en el segundo apartado

base_datos=`cat ${INICIO_RUTA}/settings.php | grep db_url | cut -d "=" -f2 | cut -d "/" -f4 | cut -d "'" -f1`
url_pedida=`cat ${INICIO_RUTA}/settings.php | grep base_url | cut -d "=" -f2 | cut -d ":" -f2 | cut -d "'" -f1  | cut -c3- `

echo "${RUTA_PORTAL} : ${base_datos} - ${url_pedida} "
#-------------------------------------------------------------------
fi

}
