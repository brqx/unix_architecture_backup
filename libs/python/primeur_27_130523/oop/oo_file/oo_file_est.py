#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- FileEst      : Clase de estructura para cadenas
-----------------------------------------------------------
-+ Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- StringMsg          : Clase de mensajes para cadenas
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
- Ninguna
===========================================================
+ Process Status  : [130516]
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

#- Importacion de clases heredadas

##from oo_string_msg import StringMsg

#- Importacion de clases heredadas

from oo_file_msg import FileMsg


#-Falta crear un FileMsg
class FileEst(FileMsg):

    #-Variable estatica para indicar el nombre de la clase
    __cls                   = "FileEst"
    __mth                   = ""    
    __log_level             = 0
    __log_class_level       = 0

    __m                     = ""        # Modo apertura
    __open_file_code        = 0     # Valor retorno apertura
    __str_open_file_code    = "0"     # Valor retorno apertura


    __lineas                = ""    # Lineas del archivo
    __file_name             = ""    # Nombre fichero pasado
    __file_type             = ""    # Tipo de fichero 


    cadena_error            = ""    


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                                   , 
                 log_level              =   0           ,
                 log_class_level        =   0           ,
                 log_show               =   "screen"    ):
        """ Constructor de ficheros
        """

        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level


        FileMsg.__init__(self, 
                           log_level, 
                           log_class_level)
        

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

        

    def getOpenFileCode(self):
        """ Retorno del codigo de apertura del fichero
        """    

        valor_a_devolver = self.__open_file_code
        self.logGet(valor_a_devolver, self.msg_open_file_code)
        return valor_a_devolver

    
    def setOpenFileCode(self, argumento):
        """ Establecimiento del codigo de apertura del fichero
        """    

        variable_a_establecer = self.__open_file_code

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_open_file_code)

        self.__open_file_code = argumento
    

    def getStrOpenFileCode(self):
        """ Retorno del codigo de apertura del fichero
        """    

        valor_a_devolver = self.__str_open_file_code
        self.logGet(valor_a_devolver, self.msg_open_file_code)
        return valor_a_devolver

    
    def setStrOpenFileCode(self, argumento):
        """ Establecimiento del codigo de apertura del fichero
        """    

        variable_a_establecer = self.__str_open_file_code

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_open_file_code)

        self.__str_open_file_code = argumento


    def getFileName(self):
        """ Retorno del nombre del fichero
        """    

        valor_a_devolver = self.__file_name
        self.logGet(valor_a_devolver, self.msg_open_file_code)
        return valor_a_devolver

    
    def setFileName(self, argumento):
        """ Establecimiento del nombre del fichero
        """    

        variable_a_establecer = self.__file_name

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_file_name)

        self.__file_name = argumento


    def getFileType(self):
        """ Retorno del tipo de fichero
        """    

        valor_a_devolver = self.__file_type
        self.logGet(valor_a_devolver, self.msg_file_type)
        return valor_a_devolver

    
    def setFileType(self, argumento):
        """ Establecimiento del tipo de fichero
        """    

        variable_a_establecer = self.__file_type

        self.logSet(
            variable_a_establecer   , 
            argumento               , 
            self.msg_file_type      )

        self.__file_type = argumento

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=


