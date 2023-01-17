#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.1
-----------------------------------------------------------
+ Funciones definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- file_getvrb_value   : Obtiene el valor de una clave de un
                        archivo de pares (clave = valor)
-----------------------------------------------------------
+ Librerias requridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- pm_sys        : Libreria de primeur para lanzar comandos
- pm_list       : Libreria de primeur usada con listas
===========================================================
"""
#- Libreria de cadenas de primeur que esta al mismo nivel que file

#-Python 3.3
import re

def pm_parse_cadena(cadena_entrada, posicion = 1, separador = '"'):
    """ Parsea la cadena espacio de entrada y devuelve el parametro 
        Recibe este churro:
        Internal Number - 000500000000002F
        ['00050000000027D9', ' "CORRELID"', ' "PRUEBAS EVENTO PYTHON"', 
         ' "EMISOR"', ' 32', ' "/opt/spazio/spazio.ini"', 
         ' "DestinationFilename.dat"']
    """        
    lista_entrada=re.split(separador, cadena_entrada)
    salida_parseada=lista_entrada[posicion]

    return salida_parseada
    
def pm_get_internal_number(lista_entrada):
    """ Parsea la cadena espacio de entrada y devuelve el parametro 
        Internal Number - 000500000000002F
    """    

    return lista_entrada[0]

def pm_get_correlation_id(lista_entrada):
    """ Parsea la cadena espacio de entrada y devuelve el parametro 
        Correlation ID - CORRELID
    """    
    return pm_parse_cadena(lista_entrada[1])
    
    
def pm_get_descripcion(lista_entrada):
    """ Parsea la cadena espacio de entrada y devuelve el parametro 
        Description - PRUEBAS EVENTO PYTHON
    """    
    return pm_parse_cadena(lista_entrada[2])

def pm_get_sender(lista_entrada):
    """ Parsea la cadena espacio de entrada y devuelve el parametro 
        Sender - EMISOR
    """    
    return pm_parse_cadena(lista_entrada[3])

def pm_get_message_modality(lista_entrada):
    """ Parsea la cadena espacio de entrada y devuelve el parametro 
        Message Modality - 32
    """    
    return pm_parse_cadena(lista_entrada[4],1," ")


def pm_get_spazio_config(lista_entrada):
    """ Parsea la cadena espacio de entrada y devuelve el parametro 
        Path Spazio Config - /opt/spazio/spazio.ini
    """    
    return pm_parse_cadena(lista_entrada[5])

def pm_get_destination_filename(lista_entrada):
    """ Parsea la cadena espacio de entrada y devuelve el parametro 
        Destination Filename - DestinationFilename.dat
    """    
    return pm_parse_cadena(lista_entrada[6])

    