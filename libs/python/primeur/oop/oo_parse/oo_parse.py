#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.4
-----------------------------------------------------------
+ Clases definidas      : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Parse             - Clase de Parseo
-----------------------------------------------------------
-+ Clases heredadas     : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- ParseString       - Clase de parseo de cadenas
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
+ Process Status  : [130603]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [_] [4] [5]
===========================================================
"""

##import subprocess
##import sys

#- Importacion de clases heredadas

from oo_parse_string import ParseString


class Parse(ParseString):

    #-Variable estatica para indicar el nombre de la clase
    __cls                   = "Parse"
    __mth                   = ""    
    __log_level             = 0
    __log_class_level       = 0

    __log_show              = "screen"
    __log_file              = ""    # Log file por defecto
    __log_file_alt          = ""    # Log file alterno

    __log_file_err          = ""    # Log file de error


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                                   , 
                 cadena_a_parsear       =   ""          ,
                 sourcename             =   ""          ,
                 destname               =   ""          ,
                 correl_id              =   ""          ,
                 sender                 =   ""          ,
                 description            =   ""          ,
                 compress               =   ""          ,
                 trigger                =   ""          ,
                 log_level              =   0           ,
                 log_class_level        =   0           ,
                 log_show               =   "screen"    ,
                 log_file               =   ""          ,
                 log_file_err           =   ""          ,
                 log_size               =   1000000     ):
        """ Constructor del parseo
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


        ParseString.__init__(self       ,
            cadena_a_parsear            ,
            sourcename                  ,
            destname                    ,
            correl_id                   ,
            sender                      ,
            description                 ,
            compress                    ,
            trigger                     ,
            log_level                   ,
            log_class_level             ,
            log_show                    ,
            log_file                    ,
            log_file_err                ,
            log_size                    )


   
        if log_level >log_class_level:
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

                    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

## sourcename       = "FicheroFuente.txt.dat"
## destname         = "FicheroDestino.txt.dat"
## correl_id        = "CorrelId"
## sender           = "Emisor"
## description      = "Informacion_archivo"

## cad1="aaaac$FECHA+$MASCARA"

## cad2="$SENDER+___$SOURCENAMENOEXTENSION+$FECHA=[Y01][M01][D01]"

## CorrelId="MiCorrelId"
## SourceName = "MiSourceName"
## Sender = "MiSender"

## cad_sys = sys.argv[1]


## pa= Parse(
##     cad1,
##     sourcename,
##     destname,
##     correl_id,
##     sender,
##     description
##     )

##print pa.getSourceNoExt()

## print "Resultado" + pa.getResultado()


