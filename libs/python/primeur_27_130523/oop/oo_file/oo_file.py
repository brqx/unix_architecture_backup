#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- File      : Clase de Ficheros
-----------------------------------------------------------
-+ Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- getsetGen           : Clase de get y sets
-----------------------------------------------------------
-+ Metodos definidos : 
-----------------------------------------------------------
- Pendiente  (init, gets y sets)
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- pendiente        : pendiente
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- shutil, os , datetime
===========================================================
+ Process Status  : [130516]
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

import os , datetime

import shutil

#- Importacion de clases heredadas

from oo_file_est import FileEst


class File(FileEst):

    #-Variable estatica para indicar el nombre de la clase
    __cls                   = "File"
    __mth                   = ""    
    __log_level             = 0
    __log_class_level       = 0


    __f                     = file    # Fichero


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------

    def __init__(self, 
                 nombre_fichero     = ""    ,
                 log_level          = 0         ,
                 log_class_level    = 0         ,
                 log_show           = "screen"  ):
        """ Constructor de ficheros
        """

        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level


        FileEst.__init__(self                   , 
                         log_level              , 
                         log_class_level        ,
                         log_show               )

       
        self.checkFile(nombre_fichero)


        if log_level > log_class_level:
            self.sInfoConstructor(self.__cls)
            self.__Log(self.msg)

        self.LogEndConstructor()


    def __Log(self                      ,
              texto                     ,
              valor     =   ""          ,
              mth       =   "init"      ,
              dec       =   "normal"    ):
        """ Log de la clase
        """        
        if mth == "":
            mth = self.__mth

        cls = self.__cls

        log_level       = self.__log_level
        log_class_level = self.__log_class_level
            
        self.log(texto              , 
                 valor              ,
                 cls                ,
                 mth                ,        
                 dec                ,
                 log_level          ,
                 log_class_level    )        

     

    def createFile(self, nombre_fichero_pasado, modo = "a"):
        """ Retorna un fichero
        """
        self.openFile(nombre_fichero_pasado, modo)
        #self.closeFile()


    def openFile(self                           , 
                 nombre_fichero_pasado = ""     , 
                 modo = "r"                     ):
        """ Abre un fichero para lectura
        """
        mth = "openFile"
        open_file_code   = 0 
        salida = ""
        
        if(len(nombre_fichero_pasado) > 1):
            #-- Booleano que devuelve true
            exist_dir       = os.path.exists(nombre_fichero_pasado)
            is_directory    = os.path.isdir(nombre_fichero_pasado)

            #-Establecemos el nombre del fichero o directorio
            self.setFileName(nombre_fichero_pasado)

            if exist_dir:
                if is_directory:
                    #-Es un directorio
                    open_file_code = 0
                    self.setFileType("d")    
                    self.__Log("File Type"                  , 
                               "directory"                  , 
                               mth                          , 
                               "simple_simple"              )

                else:
                    #- Es un fichero    
                    self.setFileType("f")    
                    self.__Log("File Type"                  , 
                               "file"                       , 
                               mth                          , 
                               "simple_simple"              )

                    try:
                        self.__f = open (nombre_fichero_pasado, modo)
                        salida="Archivo abierto con permisos correctos"
                    ##                open_file_code   = 0
                        
                    
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
            
        str_open_file_code = str(open_file_code)

        self.setOpenFileCode(open_file_code)

        self.setStrOpenFileCode(str_open_file_code)

        self.setFileName(nombre_fichero_pasado)


        self.__Log(salida                   , 
                   nombre_fichero_pasado    , 
                   mth                      ,
                   "square_alt"             )

        self.__Log("File Code"              , 
                   str_open_file_code       , 
                   mth                      , 
                   "double_alt"             )


    def closeFile(self):
        """ Cierra un fichero para lectura
            Aqui falta gestionar excepciones
        """
        mth = "closeFile"
        open_file_code = self.getOpenFileCode()
        file_type      = self.getFileType()

        if file_type == "f":
            #- Solo cerramos el fichero si no es un directorio
            if open_file_code == 0:
                self.__f.close()
                self.__Log("File Correctly Closed"  , 
                           self.getFileName(), 
                           mth, 
                           "double_alt"   )
            else:
                self.__Log("File Not Closed"  , 
                           self.getFileName(), 
                           mth, 
                           "double_double"   )
    
                self.__Log("Open File Code"  , 
                           self.getStrOpenFileCode(), 
                           mth, 
                           "simple_simple"   )


    def checkFile(self                      ,
                  nombre_fichero = ""       ):
        """ Cierra un fichero para lectura
            Aqui falta gestionar excepciones
        """
        self.openFile(nombre_fichero)
        self.closeFile()
       

    def readLines(self):
        """ Lee las lineas del archivo
        """
        lineas = self.__f.readlines()
        return lineas
    
    def deleteFile(self, ruta_fichero_completa):
        """ Borra el archvo
        """

        os.remove(ruta_fichero_completa)


    def copyFile(self, ruta_fichero_completa , directorio_destino):
        """ Borra el archvo
            os.path.basename(        
        """

        shutil.copy(ruta_fichero_completa, directorio_destino)

##        os.copy(ruta_fichero_completa)


    def checkTimeFile(self, 
                      ruta_fichero_completa,
                      slice_time = 1):
        """ Debe comprobar si se ha modificado
            En principio mirara el ultimo minuto
        """
        mth = "checkTimeFile"
        self.LogInitMethod(self.__cls)


        modificado = 0
        st=os.stat(ruta_fichero_completa)    

        #-Tiempo de modificacion del archivo
        tfile=datetime.datetime.fromtimestamp(st.st_mtime)

        int_slice_time = int (slice_time)

        now         =   datetime.datetime.now()
        hace_tiempo =   now -  datetime.timedelta(minutes=int_slice_time)


        #- Tiempo hace n minutos
        tdiff_ago  = now - hace_tiempo
        tdiff_file = now - tfile
            

        self.__Log("Fichero check mtime", ruta_fichero_completa, mth)        

        self.__Log("Tiempo actual  :" , str(now)              , mth)
        self.__Log("Tiempo check   :" , str(hace_tiempo)      , mth)
        self.__Log("Tiempo fichero :" , str(tfile)            , mth)
        self.__Log("Slice check    :" , str(tdiff_ago)        , mth)
        self.__Log("Slice file     :" , str(tdiff_file)       , mth)

    
        if tdiff_file < tdiff_ago:
            self.__Log("Archivo en uso"             ,self.ascline   , mth)
            modificado = 1
        else:
            self.__Log("Archivo modificado en tiempo",self.bline    , mth)
            modificado = 0
            
        self.LogEndMethod(self.__cls)
        
        return modificado


    def printFile(self                      ,
                  cadena_pasada             ,
                  nombre_fichero_pasado = ""):
        """ Escribe en el fichero
        """
        
        modo_escritura = "a"
        self.openFile(nombre_fichero_pasado, modo_escritura)        
        self._f.write(cadena_pasada)
        self.closeFile()
                
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

## fichero = "/brqx/arquitectura/unix/libs/python/primeur/oop/oo_file/comandos.logg"

## ruta_destino= "/tmp/spazio/destino"

## modo = "r"
## log_level = 30

## oo = File(log_level)


## oo.copyFile(fichero,ruta_destino)

## oo.checkTimeFile(fichero)

## oo.openFile(fichero, modo)
## oo.closeFile()
