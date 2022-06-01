#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.1
-----------------------------------------------------------
+ Funciones definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- pm_sys   : Ejecuta un comando del sistema y devuelve su resultado en una
             cadena
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- pm_list       : Libreria de primeur usada con listas 
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- commands
===========================================================
"""
#- Libreria de cadenas de primeur que esta al mismo nivel que file
import pm_list, pm_string

##import subprocess
import commands

    
def pm_sys(cadena_identificativa):
    """ Lanza la orden de sistema que se solicta y devuelve su resultado en 
        una lista
    """    
    #- Validar la orden ... llega por la salida de error

    codigo_resultado, salida_orden = commands.getstatusoutput(cadena_identificativa)

    lista_devuelta          = list()

    #-Si es error hay que parsear las lineas
    
    if codigo_resultado == 0:
        lineas_parseadas = pm_string.str_parseallln(salida_orden,"\n","\n")
##        lineas_parseadas = salida_orden
    else:
        lineas_parseadas= pm_string.str_parseallln(salida_orden)
    
    lista_devuelta = pm_list.list_create(codigo_resultado, lineas_parseadas)    

    return lista_devuelta
     

