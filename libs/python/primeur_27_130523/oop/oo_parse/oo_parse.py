#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Parse      : Clase de Parseo
-----------------------------------------------------------
-+ Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- ParseString           : Clase de parseo de cadenas
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

##import subprocess
##import sys

#- Importacion de clases heredadas

from oo_parse_string import ParseString


class Parse(ParseString):

    #-Variable estatica para indicar el nombre de la clase
    __cls           = "Parse"
    __mth           = ""    
    __log_level         = 0
    __log_class_level   = 0


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                           , 
                 cadena_a_parsear   = ""        ,
                 sourcename         = ""        ,
                 destname           = ""        ,
                 correl_id          = ""        ,
                 sender             = ""        ,
                 description        = ""        ,
                 compress           = ""        ,
                 trigger            = ""        ,
                 log_level          = 0         ,
                 log_class_level    = 0         ,
                 log_show           = "screen"  ):
        """ Constructor del parseo
        """

        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level


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
            log_show                    )


   
        if log_level >log_class_level:
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


