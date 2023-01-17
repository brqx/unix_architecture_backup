#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.1
-----------------------------------------------------------
+ Funciones definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- pm_spret   : Devuelve informacion respecto a los parametros de spazio
-----------------------------------------------------------
===========================================================
"""
import sys

#- Libreria de cadenas de primeur enfocada a spazio

def pm_spret(qmname= "", queue = "", numint= ""):
    """ Informa de los parametros indicados y le da sentido al contenido 
        - Si no se pasa ningun parametro devolvera tres guiones
        - Si se pasan parametros devolvera los valores de la terna
    """        

    cadena_devuelta = ""
    sep  = ""
    sep2 = "-"

    nombre_item = "M"    
    cadena_devuelta = cadena_devuelta + nombre_item + sep + qmname + sep2

    nombre_item = "Q"    
    cadena_devuelta = cadena_devuelta + nombre_item + sep + queue + sep2
    
    nombre_item = "N"    
    cadena_devuelta = cadena_devuelta + nombre_item + sep + numint + sep2
   
    return cadena_devuelta
    
    