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
- CompressUtl           - Clase de utilidades para compresion
-----------------------------------------------------------
-+ Clases heredadas             : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- getsetGen           - Clase de get y sets
-----------------------------------------------------------
-+ Metodos definidos            : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- processExtCompress        - Procesa extension fichero comprimido
-----------------------------------------------------------
- processDotExt             - Procesa la extension pasada
-----------------------------------------------------------
+ Librerias Primeur requeridas  :
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas  :
--=----=----=----=----=----=----=----=----=----=----=----=-
- Ninguna
===========================================================
+ Process Status  : [130624]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [3] [_] [5]
===========================================================
"""

import re


#- Importacion de clases heredadas

from oo_getsetgen import getsetGen


class CompressUtl(getsetGen):

    #-Variable estatica para indicar el nombre de la clase
    __cls                   = "CompressUtl"
    __mth                   = ""    
    __log_level             = 0
    __log_class_level       = 0

    __log_show              = "screen"
    __log_file              = ""    # Log file por defecto
    __log_file_alt          = ""    # Log file alterno

    __log_file_err          = ""    # Log file de error


    #- Atributos publicos
    ext_with                = ""    # Extension con punto
    ext_without             = ""    # Extension sin punto


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                                       , 
                 log_level              =   0               ,
                 log_class_level        =   0               ,
                 log_show               =   "screen"        ,
                 log_file               =   ""              ,
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


        getsetGen.__init__(self                   , 
                             log_level              ,
                             log_class_level        ,
                             log_show               ,
                             log_file               ,
                             log_size               )
       

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

        

    def processExtCompress(self                                 ,
                           fich_name                    = ""    ,
                           up_format_file_sin_punto     = ""    ):
        """ Procesa la extension del fichero comprimido
        """    

        compress_file = ""
        
        if up_format_file_sin_punto     == "GZ":
            compress_file =  fich_name + "." + "gz"
        elif up_format_file_sin_punto     == "GZIP":
            up_format_file_sin_punto = "GZ"
            compress_file =  fich_name + "." +  "gz"
        elif up_format_file_sin_punto   == "ZIP":
            compress_file =  fich_name + "." + "zip"

        return compress_file    


    def processDotExt(self                     , 
                      up_format_file = ""      ):
        """ Procesa la extension
        """

        split_separator     = "\."
        output_separator    = "."

        #-Permite que se pase zip o .zip
        if up_format_file.startswith("."):
            split_ext=re.split(split_separator, up_format_file)
            up_format_file_sin_punto = split_ext[1]
            up_format_file_con_punto = up_format_file   
        else:
            up_format_file_sin_punto = up_format_file
            up_format_file_con_punto = output_separator + up_format_file   

        self.ext_with       = up_format_file_con_punto
        self.ext_without    = up_format_file_sin_punto


#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=


