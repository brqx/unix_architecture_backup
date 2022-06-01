#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.1
-----------------------------------------------------------
+ Funciones definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- file_open     : Apartura de un fichero    
- file_close    : Cierre de un fichero
- file_closeall : Cierre global - sin uso y no funciona 
-----------------------------------------------------------
+ Librerias requridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- pm_list       : Libreria de primeur usada en listas 
===========================================================
"""

#- Librerias de primeur

import pm_list

def file_open(nombre_fichero_pasado, modo = "r"):
    """ Apertura de fichero y gestion de excepciones."""        

    lista_devuelta = list()
    valor_devuelto = 0 
    sep = ":"
    
    if(len(nombre_fichero_pasado) > 1):
        try:
            f = open (nombre_fichero_pasado, modo)
            lista_devuelta = pm_list.list_create(valor_devuelto,f)        

        # Manejador de excepciones        
        except NameError:        
            cadena_error="Archivo no definido"
            cadena_error=cadena_error + sep + nombre_fichero_pasado
            valor_devuelto = 1
            lista_devuelta = pm_list.list_create(valor_devuelto, cadena_error)        
    
        except TypeError:
            cadena_error="Error en tipo de archivo"
            cadena_error=cadena_error + sep + nombre_fichero_pasado
            valor_devuelto = 2
            lista_devuelta = pm_list.list_create(valor_devuelto, cadena_error)        

        except IOError:
            cadena_error="Error de permisos"
            cadena_error=cadena_error + sep + nombre_fichero_pasado
            valor_devuelto = 3
            lista_devuelta = pm_list.list_create(valor_devuelto, cadena_error)        

        except:
            cadena_error="Error al abrir"
            cadena_error=cadena_error + sep + nombre_fichero_pasado
            valor_devuelto = 4
            lista_devuelta = pm_list.list_create(valor_devuelto, cadena_error)        

##        finally:
##        Se ejecuta siempre por ello no podemos generalizar

    else:
        cadena_error="Falta nombre del archivo"
        cadena_error=cadena_error + sep + nombre_fichero_pasado
        valor_devuelto = 4
        lista_devuelta = pm_list.list_create(valor_devuelto, cadena_error)        
        
                
    return lista_devuelta
        
def file_close(fichero_pasado):
    """ Cierra el fichero.
        Se crea una funcion para preparar un log de cada operacion    
    """        
    fichero_pasado.close()
    pass

#-- Esta funcion aun no se si funciona y si es util
def file_closeall():
    file_handles = []
    try:
        for file in file_list:
			cadena_out = "Abierto" + file
            print (cadena_out)
            file_handles.append(open(file))
    
        # Do some calculations with open files
    
    finally:
        for fh in file_handles:
            fh.close()        

    pass
