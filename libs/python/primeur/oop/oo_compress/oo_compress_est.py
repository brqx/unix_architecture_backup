#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.4
@pythonver: 3.3
-----------------------------------------------------------
+ Clases definidas              : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- CompressEst           - Clase de estructura para compresion
-----------------------------------------------------------
-+ Clases heredadas             : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- CompressMsg           - Clase de mensajes para compresion
-----------------------------------------------------------
-+ Metodos definidos            : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- get/getSourceFileName     - Fichero origen
-----------------------------------------------------------
- get/setCompressFileName   - Fichero comprimido destino
-----------------------------------------------------------
- get/setCompressFormat     - Formato de compresion
-----------------------------------------------------------
+ Librerias Primeur requeridas  :
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas  :
--=----=----=----=----=----=----=----=----=----=----=----=-
- Ninguna
===========================================================
+ Process Status  : [130603]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [3] [4] [_]
===========================================================
"""

#- Importacion de clases heredadas

from oo_compress_msg import CompressMsg


class CompressEst(CompressMsg):

    #-Variable estatica para indicar el nombre de la clase
    __cls                   =   "CompressEst"
    __mth                   =   ""    
    __log_level             =   0
    __log_class_level       =   0

    __log_show              =   "screen"
    __log_file              =   ""    # Log file por defecto
    __log_file_alt          =   ""    # Log file alterno

    __log_file_err          =   ""    # Log file de error


    __source_filename       =   ""    # Nombre de fichero origen
    __compress_filename     =   ""    # Nombre del fichero comprimido
    __compress_format       =   ""    # Formato de compresion usado

    #-- Pendiende de implementar
    __compress_result       =   0     # Resultado comando compresion


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                                       , 
                 source_filename        =   ""              ,
                 compress_filename      =   ""              ,
                 compress_format        =   ""              ,
                 log_level              =   0               ,
                 log_class_level        =   0               ,
                 log_show               =   "screen"        ,
                 log_file               =   ""              ,
                 log_file_err           =   ""              ,
                 log_size               =   1000000         ):
        """ Constructor de ficheros
        """

        mth = "init"
        
        #- Establecimiento nivel de log
        self.__log_level = log_level

        self.LogInitConstructor(log_level           , 
                                log_class_level     , 
                                log_show            )

        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level

        #-Estableciendo fichero de log
        self.__log_show     =   log_show

        self.__log_file     =   log_file
        self.__log_file_err =   log_file_err  


        CompressMsg.__init__(self                   , 
                             log_level              ,
                             log_class_level        ,
                             log_show               ,
                             log_file               ,
                             log_size               )

    
        self.setSourceFileName(source_filename)
        self.setCompressFileName(compress_filename)
        self.setCompressFormat(compress_format)
        

        if log_level > log_class_level:
            self.sInfoConstructor(self.__cls)

            if log_level > 80:
                self.__Log(self.msg         ,
                           self.bline       ,
                           mth              ,
                           "simple_simple"  )

        self.LogEndConstructor()


    #-Clase de log alternada
    def __LogAlt(self                           ,
              texto         =   ""              ,
              valor         =   ""              ,
              mth           =   "init"          ,
              dec           =   "normal"        ):
        """ Log de la clase
        """        
        if mth == "":
            mth = self.__mth

        cls = self.__cls

        log_level       = self.__log_level
        log_class_level = self.__log_class_level
        log_show        = self.__log_show
        log_file_alt    = self.__log_file_alt

           
        self.log(texto              , 
                 valor              ,
                 cls                ,
                 mth                ,        
                 dec                ,
                 log_level          ,
                 log_class_level    ,
                 log_show           ,
                 log_file_alt       )        


    #-Clase de log de traza
    def __Log(self                          ,
              texto                         ,
              valor         =   ""          ,
              mth           =   "init"      ,
              dec           =   "normal"    ):
        """ Log de la clase para traza
        """        

        self.__log_file_alt  = self.__log_file

        self.__LogAlt(texto                 ,
                      valor                 ,
                      mth                   ,
                      dec                   )

        

    def getSourceFileName(self):
        """ Retorno del codigo de apertura del fichero
        """    

        valor_a_devolver = self.__source_filename
        self.logGet(valor_a_devolver, self.msg_source_filename)
        return valor_a_devolver

    
    def setSourceFileName(self, argumento):
        """ Establecimiento del codigo de apertura del fichero
        """    

        variable_a_establecer = self.__source_filename

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_source_filename)

        self.__source_filename = argumento
    


    def getCompressFileName(self):
        """ Retorno del codigo de apertura del fichero
        """    

        valor_a_devolver = self.__compress_filename
        self.logGet(valor_a_devolver, self.msg_compress_filename)
        return valor_a_devolver

    
    def setCompressFileName(self, argumento):
        """ Establecimiento del codigo de apertura del fichero
        """    

        variable_a_establecer = self.__compress_filename

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_compress_filename)

        self.__compress_filename = argumento


    def getCompressFormat(self):
        """ Retorno del codigo de apertura del fichero
        """    

        valor_a_devolver = self.__compress_format
        self.logGet(valor_a_devolver, self.msg_compress_format)
        return valor_a_devolver

    
    def setCompressFormat(self, argumento):
        """ Establecimiento del codigo de apertura del fichero
        """    

        variable_a_establecer = self.__compress_format

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_compress_format)

        self.__compress_format = argumento


#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=


