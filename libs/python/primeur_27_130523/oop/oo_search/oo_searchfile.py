#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- FileSearch        : Clase de busqueda en ficheros
-----------------------------------------------------------
-+ Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- FileSearchEst         : Clase de estructura de FileSearch
-----------------------------------------------------------
- File                  : Clase de ficheros
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
#- Just           : [0] [_] [2] [3] [4] [5]
===========================================================
"""

#- Importacion de librerias
import os


#- Importacion de clases heredadas
from oo_file import File
from oo_searchfile_est import FileSearchEst


class FileSearch(File           , 
                 FileSearchEst  ):

    #-Variable estatica para indicar el nombre de la clase
    __cls                   = "FileSearch"
    __mth                   = ""    
    __log_level             = 0
    __log_class_level       = 0


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------

    def __init__(self                               , 
                 nombre_fichero_reglas  = ""        ,
                 comment                = ";"       ,
                 log_level              = 0         ,
                 log_class_level        = 0         ,
                 log_show               = "screen"  ):
        """ Constructor FileSearch
        """
        
        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level


        FileSearchEst.__init__  (self           ,
                                comment         ,
                                log_level       ,
                                log_class_level ,
                                log_show        )

        File.__init__(self                      ,
                      nombre_fichero_reglas     ,  
                      log_level                 ,
                      log_class_level           ,
                      log_show                  )


        if log_level > log_class_level:
            self.sInfoConstructor(self.__cls)
            self.__Log(self.msg)

        self.LogEndConstructor()


    def __Log(self                          ,
              texto                         ,
              valor         =   ""          ,
              mth           =   "init"      ,
              dec           =   "normal"    ):
        """ Log de la clase
        """        
        if mth == "":
            mth = self.__mth

        cls = self.__cls

        log_level       = self.__log_level
        log_class_level = self.__log_class_level

           
        self.log(texto      , 
                 valor      ,
                 cls                ,
                 mth                ,        
                 dec                ,
                 log_level          ,
                 log_class_level    )        

     
    def searchKeyFile(self              , 
                      clave             , 
                      archivo_entrada   ):
        """ Obtiene una clave de un fichero
            Falta:
            - Gestionar parametros
            - Gestionar accesos
            - Gestionar errores
        """
        mth = "searchKeyFile"
        self.LogInitMethod(self.__cls)

        comment = self.getComment()

        self.__Log("Archivo donde buscar"   , 
                   archivo_entrada          , mth)
        self.__Log("Clave a buscar"         , 
                   clave                    , mth)


        #-Falta gestionar el acceso a los archivos
        self.openFile(archivo_entrada, 'r')

        open_file_code = self.getOpenFileCode()

        if open_file_code == 0:

            #-Si no se puede abrir es None
            #-Si es un valor correcto es que ha abierto el fichero

            contenido_linea = ""
      
            try:
                lineas = self.readLines()
                num_lineas = len(lineas)
                #-Lineas totales del fichero
                self.__Log("Numero de lineas:"  ,  
                           str(num_lineas)      , mth)
    
                for i in range(num_lineas):
                    linea_actual = lineas[i]
                    #-A ver los tipos de lineas
                    clave_igual = "="

                    if linea_actual.startswith(comment):
                        self.__Log("Linea Comentada:"  ,  
                                   linea_actual     , mth)
                        self.__Log("Comentario:"  ,  
                                   comment          , mth)
                    else:                                   
                        #- La linea no es un comentario
                    
                        if clave in linea_actual:
                            #-Tiene la cadena
                            if clave_igual in linea_actual:
                                #-Es una expresion con igual
                                linea_split = \
                                    linea_actual.split("=")
                        
                                contenido_linea = linea_split[1]
                
                                if contenido_linea != "":
                                    self.insertLine(contenido_linea) 
    
            except:
                self.__Log("Clave no existe"            ,
                           contenido_linea              , mth)
    
    
            self.closeFile()

        else:
            #-Error al abrir fichero
            self.__Log(
                "Error de permisos. Fichero no existe o no es accesible.",
                 archivo_entrada              , 
                 mth                          ,
                 "double_double")


        self.LogEndMethod(self.__cls)


    def searchLineFile(self             , 
                       clave            , 
                       archivo_entrada):
        """ Obtiene una clave de un fichero
            Devuelve la linea entera
            Falta:
            - Gestionar parametros
            - Gestionar accesos
            - Gestionar errores
        """
        mth = "searchLineFile"
        self.LogInitMethod(self.__cls)

        comment = self.getComment()


        self.__Log("Archivo donde buscar"   , 
                   archivo_entrada          , mth)
        self.__Log("Clave a buscar"         , 
                   clave                    , mth)


        #-Falta gestionar el acceso a los archivos
        self.openFile(archivo_entrada, 'r')
        ret_file = "1"
        
    
        if ret_file=="1":
            #-Si no se puede abrir es None
            #-Si es un valor correcto es que ha abierto el fichero

            contenido_linea = ""
      
            try:
                lineas = self.readLines()
                num_lineas = len(lineas)
                #-Lineas totales del fichero
                self.__Log("Numero de lineas:"  ,  
                           str(num_lineas)      , mth)
    
                for i in range(num_lineas):
                    linea_actual = lineas[i]
                    #-A ver los tipos de lineas
                    
                    if linea_actual.startswith(comment):
                        self.__Log("Linea Comentada:"   ,  
                                   linea_actual         , 
                                   mth                  ,
                                   "simple_simple"      )

                        self.__Log("Comentario:"        ,  
                                   comment              , 
                                   mth                  ,
                                   "simple_simple"      )
                    else:                                   
                        if clave in linea_actual:
                            self.__Log("Insertando"     , 
                                       linea_actual     , 
                                       mth              ,
                                       "simple_alt"     )
                            self.insertLine(linea_actual) 
                        
            except:
                self.__Log("Clave no existe"    ,
                           contenido_linea      , mth)
    
    
            self.closeFile()

        else:
            #-Error al abrir fichero
                self.__Log("Sin privilegio de lectura"  ,
                           archivo_entrada              , mth)


        self.LogEndMethod(self.__cls)

        
    
                
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

## fichero = "/opt/spazio/cfg/CORRELID_acq.rul"
## comment = "#"
## cadena = "TRIGGER"

## cadena2 = "TRIGGER"

## log_level       = 4
## log_class_level = 0
## log_show        = "screen"

## ej=FileSearch(fichero               ,
##               comment               ,
##               log_level             ,
##               log_class_level       ,
##               log_show              )

## ej.searchLineFile(cadena, fichero)

## ej.searchLineFile(cadena2, fichero)
## ej.searchKeyFile(cadena2, fichero)

## print "A imprimir A"
## valor_linea = ej.getFirstLine()

## print "A imprimir B:" + valor_linea + ":"
#ej.searchClean()

## ej.searchLineFile(cadena2, fichero)
## ej.searchKeyFile(cadena2, fichero)

## ej.searchClean()

## print "A imprimir2"
## ej.printAllLines()

## ej.searchLineFile(cadena2, fichero)

## ej.searchKeyFile(cadena2, fichero)

## print "A imprimir3"
## ej.printAllLines()

