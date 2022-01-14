#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2010
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.1"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2010"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_MOLDE_04="funciones"
CONCEPT_PRODUCTO_04="mysql"
CONCEPT_ARQUETIPO_04="global"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_CARACTER_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-==================================================================
#+ Funciones Especificas de las plataformas - Mysql - Nivel 04
#-==================================================================
#- Hace un backup de un site, por tanto obtiene la informacion del 
#- fichero de configuracion de sites
#-- 
#-==================================================================
#+ Funciones definidos:
#-------------------------------------------------------------------
#-- livebackup_site
#-------------------------------------------------------------------
#- Funciones Requeridas
#-------------------------------------------------------------------
#-- dbg_export_databases
#-==================================================================

#alias bkg
live_backup_site()
{
SITE_PASADO=$1


if [ "${SITE_PASADO}" != "" ] ; then

#- decide depende de la configuracion del site si debe actuar contra
#  el puerto 22 o el 65XXX . El puerto va unido al servidor en el fich
#- suponemos creado el usuario (sino habria que crearlo)

##- Live Backup de la base de datos
xypdb ${SITE_PASADO}

##- Live Backup del filesystem
#- suponemos creado el dominio y resuelto el DNS

xypfs ${SITE_PASADO}

else
#Se indica que se requiere un site como parametro

echo "Es necesario indicar el site para hacer el live backup"
fi

}
