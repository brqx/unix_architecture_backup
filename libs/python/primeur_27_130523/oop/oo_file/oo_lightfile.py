#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- LightFile      : Clase de Ficheros
-----------------------------------------------------------
-+ Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- object
-----------------------------------------------------------
-+ Metodos definidos : 
-----------------------------------------------------------
- Pendiente  (init, gets y sets)
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- os
===========================================================
+ Process Status  : [130520]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [_] [3] [4] [5]
===========================================================
"""

#- Importacion de librerias del sistema
import os 



class LightFile(object):

    #-Variable estatica para indicar el nombre de la clase

    __f                     = file    # Fichero
    open_file_code          = 0
    error_string            = ""

    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------

    def __init__(self                       , 
                 nombre_fichero     = ""    ):
        """ Constructor de ficheros
            Si no existe el fichero debe crearlo
        """
        if nombre_fichero != "":
            self.checkFile(nombre_fichero)

     

    def checkFile(self                      ,
                  nombre_fichero = ""       ):
        """ Cierra un fichero para lectura
            Aqui falta gestionar excepciones
        """

        self.openFile(nombre_fichero)

        if  self.open_file_code == 0:
            self.__f.close()
        elif self.open_file_code == 6:
            self.createFile(nombre_fichero)
     

    def createFile(self, nombre_fichero_pasado, modo = "w"):
        """ Retorna un fichero
        """

        self.__f = open (nombre_fichero_pasado, modo)        
        self.__f.close()


    def openFile(self                           , 
                 nombre_fichero_pasado = ""     , 
                 modo = "r"                     ):
        """ Abre un fichero para lectura
        """
        open_file_code   = 0 
        salida = ""
        
        if(len(nombre_fichero_pasado) > 1):
            #-- Booleano que devuelve true
            exist_dir       = os.path.exists(nombre_fichero_pasado)
            is_directory    = os.path.isdir(nombre_fichero_pasado)

            if exist_dir:
                if is_directory:
                    #-Es un directorio
                    open_file_code = 0

                else:
                    #- Es un fichero    

                    try:
                        self.__f = open (nombre_fichero_pasado, modo)
                    
                    # Manejador de excepciones        
                    except NameError:        
                        salida="Archivo no definido"
                        open_file_code = 1
                
                    except TypeError:
                        salida="Error en tipo de archivo"
                        open_file_code = 2
            
                    except IOError:
                        salida="Error de permisos."
                        open_file_code = 3
            
                    except:
                        salida="Error al abrir"
                        open_file_code = 4

            else:
                salida="Fichero no existe o no es accesible."
                open_file_code = 6
                
        
        ##        finally:
        ##        Se ejecuta siempre por ello no podemos generalizar
    
        else:
            salida="Falta nombre del archivo"
            open_file_code = 5
    
        self.open_file_code = open_file_code
        self.error_string   = salida


    def printFile(self                      ,
                  cadena_pasada             ,
                  nombre_fichero_pasado = ""):
        """ Escribe en el fichero
        """
        
        modo_escritura = "a"
        self.openFile(nombre_fichero_pasado, modo_escritura)        
        if self.open_file_code == 0:
            self.__f.write(cadena_pasada)
            self.__f.write(os.linesep)
            self.__f.close()
                
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

