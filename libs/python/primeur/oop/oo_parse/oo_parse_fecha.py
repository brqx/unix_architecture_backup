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
- ParseFecha      : Clase de parseo de fechas
-----------------------------------------------------------
-+ Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- ParseFechaEst      : Clase de estructura de parseo de fechas
-----------------------------------------------------------
-+ Clases utilizadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- Split      : Clase de ajuste de subcadenas
-----------------------------------------------------------
- Date      : Clase de fechas
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
#- Just           : [0] [1] [2] [3] [_] [5]
===========================================================
"""

##import subprocess
##import sys

#- Importacion de clases heredadas

from oo_parse_fecha_est import ParseFechaEst


#- Importacion de clases utilizadas

from oo_split import Split

from oo_date import Date


class ParseFecha(ParseFechaEst):

    #-Variable estatica para indicar el nombre de la clase
    __cls                   = "ParseFecha"
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
                 tipo_mascara           =   "date"      ,
                 expresion_fecha        =   ""          ,
                 log_level              =   0           ,
                 log_class_level        =   0           ,
                 log_show               =   "screen"    ,
                 log_file               =   ""          ,
                 log_file_err           =   ""          ,
                 log_size               =   1000000     ):
        """ Constructor de parseo de fechas
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


        ParseFechaEst.__init__( self                    ,
                                log_level               ,
                                log_class_level         ,
                                log_show                ,
                                log_file                ,
                                log_size                )
        
        
        self.evalDateMask(tipo_mascara          , 
                          expresion_fecha       )                    


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

      
    def evalNewDate(self                            , 
                    tipo_mascara    = "date"        ,
                    mascara         = ""            ):
        """ Evalua la cadena y actualiza todos sus datos
        """

        valor_etiqueta = ""

        ofecha = Date(mascara               , 
                      tipo_mascara          )
        
        if tipo_mascara == "date":
            valor_etiqueta = ofecha.getDate()
        elif tipo_mascara == "time":
            valor_etiqueta = ofecha.getTime()
        elif tipo_mascara == "datetime":
            valor_etiqueta = ofecha.getDateTime()

    
        self.setValorResultado(valor_etiqueta)
              
        
    def evalNewDateMask(self                                , 
                        tipo_mascara            =   "date"  ,
                        etiqueta_con_mascara    =   ""      ):
        """ Evalua la cadena y actualiza todos sus datos
        """


        split_separator     = "="
        output_separator    = "="
        log_level       = self.__log_level
        log_class_level = self.__log_class_level
        log_show        = self.__log_show
        log_file        = self.__log_file
        log_size        = self.get_log_size()


        partes   = Split(etiqueta_con_mascara,
                         split_separator     ,
                         output_separator    ,
                         log_level           ,
                         log_class_level     ,
                         log_show            ,
                         log_file            ,
                         log_size            )

        mascara  = partes.getLastField()
    
        return self.evalNewDate(tipo_mascara, mascara)    


    def evalNewDateEmptyMask(self                   , 
                             tipo_mascara = "date"  ):
        """ Evalua la cadena y actualiza todos sus datos
        """

        mascara = ""
        self.evalNewDateMask(tipo_mascara, mascara)    
               

    def evalDateMask(self, 
                     tipo_mascara = "date",
                     expresion_fecha = ""):
        """ Evalua la cadena y actualiza todos sus datos
        """
        sep= "="
        if expresion_fecha == "":
            self.evalNewDate(tipo_mascara)
        else:
            if sep in expresion_fecha:
##                print ("hay separador")
                self.evalNewDateMask(
                            tipo_mascara ,
                            expresion_fecha 
                            )    
            else:
                self.evalNewDateEmptyMask(tipo_mascara)


#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=



## cad_sys = sys.argv[1]
## cad_sys2 = sys.argv[2]

## cad1 = "FECHA"
## cad2 = "FECHA"

##pf = ParseFecha("date",cad1)

## pf = ParseFecha(cad_sys,cad_sys2)

## print pf.getValorResultado()

