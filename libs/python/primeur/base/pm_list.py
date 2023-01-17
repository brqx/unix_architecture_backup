#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.1
-----------------------------------------------------------
+ Funciones definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- list_printsimple : Imprime el primer valor de una lista o el indicado
- list_printobjeto : imprime el segundo valor o el que se indique
- list_println     : Imprime toda la lista (todas los valores)
- list_printinfo   : Imprime el resultado del primer valor y el tipo del segundo
- list_create      : Genera una lista con resultado y objeto
- list_get         : Devuelve la posicion N de la lista (por defecto la 0)    
- list_getvalor    : Devuelve la posicion 1 de la lista
-----------------------------------------------------------
+ Librerias requridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
===========================================================
"""

#- Libreria de listas, tuplas y diccionarios
#- Necesitamos poder devolver tuplas :
#-- Primer campo  : Resultado    
#-- Segundo campo : Valor devuelto

import pm_string

#- Python 3.3
import re

def list_printsimple(lista_pasada, cont = 0):
    """ Imprime la lista indicada.
    """    
    try:
        print (lista_pasada[cont])
    except IndexError:
        print ("Elemento no definido en la lista")

def list_printobjeto(lista_pasada, cont = 1):
    """ Imprime la lista indicada.
    """    
    try:
        print (lista_pasada[cont])
    except IndexError:
        print ("Elemento no definido en la lista")

def list_log(lista_pasada):
    """ Imprime la lista indicada con formato de log.
        Genera unal linea con los argumentos
    """    
    return pm_string.str_args(lista_pasada,len(lista_pasada))


def list_println(lista_pasada):
    """ Imprime la lista indicada.
    """    
 
    cont = 0
    while cont < len(lista_pasada):
        print (lista_pasada[cont])
        cont = cont + 1
    
def list_printinfo(lista_pasada):
    """ Imprime la tupla indicada, indicando el valor y el tipo
    """    
    
    valor = lista_pasada[0]
    tipo = type(lista_pasada[1])

	cadena_out = "Valor:" + valor
   

def list_create(resultado, objeto_pasado):
    """ Crea una lista con el resultado y el objeto indicados
        Devuelve una lista:
        0 - Parametros correctos
            a - Resultado pasado
            b - Objeto pasado
        1 - Parametros vacios
            Devuelve una lista vacia
    """    
    lista_devuelta = list()
    
    try:
        lista_devuelta.append(resultado)
        lista_devuelta.append(objeto_pasado)
    except:
        print ("Parametros no correctos")

    return lista_devuelta


def list_get(lista_pasada ,posicion = 0):    
    """ Devuelve la clave de la posicion solictada
    """    
    try:
        return lista_pasada[posicion]
    except IndexError:
        print ("Elemento no definido en la lista")

def get_valor(lista_pasada):    
    """ Devuelve la informacion de la primera posicion
        Normalmente sera el objeto a devolver
    """    

    return list_get(lista_pasada,1)

def get_codigo(lista_pasada):    
    """ Devuelve la informacion de la posicion cero
    """    
    return list_get(lista_pasada)



def get_objeto(lista_pasada):
    """ Devuelve la el valor de una cadena del tipo 
        Va a recibir lo siguiente :         
        0
        Internal Number, Correlation ID, Description, Sender, Message Modality, Path Name, Path Name
        00050000000027D7, "CORRELID", "PRUEBAS EVENTO PYTHON", "EMISOR", 32, "/opt/spazio/spazio.ini", "DestinationFilename.dat"
        File(s) successfully listed
    """    
    

    valor_lista = get_valor(lista_pasada)
    
    lista_valor=re.split("\n", valor_lista)

    cadena_retorno=re.split(",",lista_valor[1])

    return cadena_retorno
    
def get_file(lista_pasada):
    """ Devuelve la el valor de una cadena del tipo 
    """    

    fichero_devuelto = get_valor(lista_pasada)
    
    return fichero_devuelto

    