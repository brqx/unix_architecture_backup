#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
@pythonver: 3.3
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- String      : Clase de cadenas
-----------------------------------------------------------
-+ Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- StringEst           : Clase de estructura de cadenas
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- Ninguna
===========================================================
+ Process Status  : [130624]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [3] [4] [_]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [3] [_] [5]
===========================================================
"""

##import subprocess
##import sys

#- Importacion de clases heredadas

from oo_string_est import StringEst

#-Clase para parsear cadenas multi separador
#-- Falta cambiar el nombre a SplitMulti

class String(StringEst):

    #-Variable estatica para indicar el nombre de la clase
    __cls                   =   "String"
    __mth                   =   ""    
    __log_level             =   0
    __log_class_level       =   0

    __log_show              =   "screen"
    __log_file              =   ""    # Log file por defecto
    __log_file_alt          =   ""    # Log file alterno

    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                                           , 
                 cadena_a_parsear           =   ""              ,
                 separador                  =   "+"             ,
                 log_level                  =   0               ,
                 log_class_level            =   0               ,
                 log_show                   =   "screen"        ,
                 log_file                   =   ""              ,
                 log_size                   =   1000000         ):
        """ Constructor de cadenas
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
        self.__log_file     =   log_file
        self.__log_show     =   log_show


        StringEst.__init__( self                            ,
                            cadena_a_parsear                ,
                            separador                       ,
                            log_level                       ,
                            log_class_level                 ,
                            log_show                        ,
                            log_file                        ,
                            log_size                        )


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
        

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

## cad1="aaaac$FECHA+$MASCARA"

## cad_sys = sys.argv[1]

## pa= String(cad_sys)
## print (pa.getPosComodin()		)
## print (pa.getPosFinalizador()	)
## print (pa.getPosSeparador()		)
## print (pa.getFirstSeparator()	)
## print (pa.getLeft()				)
## print (pa.getRight()				)



