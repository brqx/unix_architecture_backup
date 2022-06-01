#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Created on Wed Apr 17 15:27:05 2013

@author: Ricardo Cabello
"""

#- Libreria de Cadenas y argumentos

def str_parseln(linea_pasada, separador = '\n', parte_a_devolver = 0):
    """ Parsea la linea de entrada para eliminar el salto de linea.
        Devuelve la parte indicada de la linea con separador    
        Por defecto elimina el salto de linea
    """    
    linea_actual = linea_pasada.split(separador)
    contenido_linea = linea_actual[parte_a_devolver]
    return contenido_linea

def str_parseallln(linea_pasada, sep_lineas ="_-_",separador = '\n'):
    """ Parsea todas las lineas de entrada para eliminar el salto de linea.
        Devuelve la parte indicada de la linea con separador    
        Por defecto elimina el salto de linea
    """    
    contenido_linea = ""
    conjunto_lineas = linea_pasada.split(separador)
    cont = 0      
    
    while cont < len(conjunto_lineas):        
        linea_actual = conjunto_lineas[cont]
        if not linea_actual == "":
            contenido_linea = contenido_linea + linea_actual + sep_lineas
            
        cont = cont + 1
        
    return contenido_linea


def str_search(cadena,linea_pasada):
    """ Busca la cadena en la linea de entrada.
        1 - encuentra la cadena
        0 - no encuentra la cadena
    """        
    if cadena in linea_pasada:
        return 1
    else:
        return 0              


def str_start(cadena,linea_pasada):
    """ Busca linea que comience por la cadena indicada.
        1 - encuentra la cadena
        0 - no encuentra la cadena
    """        

    if linea_pasada.startswith(cadena):
        return 1
    else:
        return 0              

def str_ends(cadena,linea_pasada):
    """ Busca linea que finalice por la cadena indicada.
        1 - encuentra la cadena
        0 - no encuentra la cadena
    """        
    if linea_pasada.endswith(cadena):
        return 1
    else:
        return 0              

def str_right(linea_pasada, separador = '='):
    """ Devuelve la parte derecha de la linea indicada.
        1 - encuentra la cadena
        0 - no encuentra la cadena
    """        
    return str_parseln(linea_pasada,separador,1)


def str_args(matriz_argumentos, numero_argumentos = 1, sep = " "):
    """ Devuelve todos los argumentos concatenados.
        Parametros:
        - Lista de argumentos
        - Numero de argumentos
        - Separador
    """        
    cont = 0
    cadena_devuelta = ""

    while cont <  numero_argumentos:
        cadena_devuelta = cadena_devuelta + sep + matriz_argumentos[cont]
        cont = cont + 1
    
    return cadena_devuelta
    

def str_parse_left(linea_pasada, caracter = "$"):
    """ Devuelve la parte izda de la cadena
    """
    pos=linea_pasada.find(caracter)
    return linea_pasada[0:pos]


def str_parse_right(linea_pasada, caracter = "$"):
    """ Devuelve la parte dcha de la cadena
    """
    pos=linea_pasada.find(caracter)
    len_line= len(linea_pasada)
    return linea_pasada[pos:len_line]



def str_clean(linea_pasada):
    """ Devuelve una cadena sin espacios a izda y dcha
    """
    
    cad_justificada = linea_pasada.strip()
    return cad_justificada
    