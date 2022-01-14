#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.2"          #  Version del Script actual
FECHA_SCRIPT="Mayo 20101"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_MOLDE_04="variables"
CONCEPT_PRODUCTO_04="server"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04}  ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-==================================================================
#+ Variables definidas:
#-------------------------------------------------------------------
#-- URL_CVS_MAPFRE - URL_SVN_MAPFRE
#-------------------------------------------------------------------
#- Repositorios del CVS

## Objetivo : 
##export CVSROOT=:ext:ricabel@cvs.es.mapfre.net:/repositorio_cvs/MAPINFO/ARQOS
##cvs checkout MAPFRE_ARQOS_COMMONS_DIST

URL_CVS_MAPFRE=cvs.es.mapfre.net
URL_SVN_MAPFRE=svn.es.mapfre.net

REPOSITORIO_01=/repositorio_cvs/MAPINFO/ARQOS

#- Entorno de ARQOS
REPOSITORIO_02=/repositorio_cvs/MAPINFO/ARQUITECTURA
REPOSITORIO_03=/repositorio_cvs/MAPINFO/COMUN
REPOSITORIO_04=/repositorio_cvs/DGTP/CID

#- Entorno de V2
REPOSITORIO_05=/repositorio_cvs/MAPINFO/TECNOLOGIA

#- Entornos de los proveedores
REPOSITORIO_06=/repositorio_cvs/MAPINFO/ARQ_FACTORIAS

#- Entornos de los sistemas
REPOSITORIO_07=/repositorio_cvs/MAPINFO/SISTEMAS


BBDD_CADENA_01=jdbc:oracle:thin:@ORAFD012:1562:FD012
BBDD_CADENA_02=jdbc:oracle:thin:@LES000900305.es.mapfre.net:1521:ARQDB02

# Definimos un CVSROOT por defecto

CVSROOT_ARQUITECTURA=:ext:ricabel@${URL_CVS_MAPFRE}:${REPOSITORIO_02}
CVSROOT_TECNOLOGIA=:ext:ricabel@${URL_CVS_MAPFRE}:${REPOSITORIO_05}
CVSROOT_ARQOS=:ext:ricabel@${URL_CVS_MAPFRE}:${REPOSITORIO_01}

CVSROOT=${CVSROOT_TECNOLOGIA}

#- Hay que mover este export
export CVSROOT

