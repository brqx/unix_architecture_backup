#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas      : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- ParseVar      - Clase de parseo de variables
-----------------------------------------------------------
+- Clases heredadas     : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- ParseEst      - Clase de estructura para el Parseo
-----------------------------------------------------------
+- Clases utilizadas    : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- ParseFecha    - Clase de Parseo de fechas
-----------------------------------------------------------
+- Metodos definidos    : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- parseVar    - Funcion de parseo de variables
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- os
===========================================================
+ Process Status  : [130531]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [_] [4] [5]
===========================================================
"""

#- Importacion de clases Heredadas

from oo_parse_est   import ParseEst

#- Importacion de clases Utilizadas


from oo_parse_fecha import ParseFecha


#- Importacion de librerias de python

#  import sys
import os


class ParseVar(ParseEst):

    #-Variable estatica para indicar el nombre de la clase
    __cls                       = "ParseVar"
    __mth                       = ""    
    __log_level                 = 0
    __log_class_level           = 0

    __log_show                  = "screen"
    __log_file                  = ""    # Log file por defecto
    __log_file_alt              = ""    # Log file alterno
    __log_file_err          = ""    # Log file de error


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                                       , 
                 cadena_a_parsear       =   ""              ,
                 sourcename             =   ""              ,
                 destname               =   ""              ,
                 correl_id              =   ""              ,
                 sender                 =   ""              ,
                 description            =   ""              ,
                 log_level              =   0               ,
                 log_class_level        =   0               ,
                 log_show               =   "screen"        ,
                 log_file               =   ""              ,
                 log_file_err           =   ""              ,
                 log_size               =   1000000         ):
        """ Parse de variables en razon a cadenas
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


        
        ParseEst.__init__(  self                    ,
                            cadena_a_parsear        ,
                            sourcename              ,
                            destname                ,
                            correl_id               ,
                            sender                  ,
                            description             ,
                            log_level               ,
                            log_class_level         ,
                            log_show                ,
                            log_file                ,
                            log_file_err            ,
                            log_size                )


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
              texto         =   ""          ,
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

      
    def parseVar(self               , 
                 etiqueta   = ""    ):
        """ Evalua la cadena y actualiza todos sus datos
        """
        mth = "parseVar"        
        self.LogInitMethod(self.__cls)
       
        
        valor_etiqueta = ""

        if   etiqueta == "FECHA":
            cfecha = ParseFecha("date")
            valor_etiqueta = cfecha.getValorResultado()

        elif etiqueta == "HORA":
            cfecha = ParseFecha("time")
            valor_etiqueta = cfecha.getValorResultado()

        elif etiqueta == "FECHAHORA":
            cfecha = ParseFecha("datetime")
            valor_etiqueta = cfecha.getValorResultado()

        elif etiqueta == "SOURCENAME":
            #- En este caso debe devolver el nombre sin la ruta
##            osys = Sys()

            self.__Log("SourceName Completo"        , 
                       self.getParseSourceFileName(), mth)

            ##-DEPENDIENDE DEL SISTEMA OPERATIVO-
            #- Habria que cambiar por una funcion de python

            os.path.basename(self.getParseSourceFileName())        

                       
            valor_etiqueta = \
                os.path.basename(self.getParseSourceFileName())        
            
##            valor_etiqueta_b = \
##            valor_etiqueta_sys[0:len(valor_etiqueta_sys)-1]

            self.__Log("SourceName Corto"           , 
                       valor_etiqueta               , mth)
            
        elif etiqueta == "SOURCENAMETOLOWER":

            source_filename     = self.parseVar("SOURCENAME")
            source_filename_min = source_filename.lower()

            self.__Log("SourceName Minusculas"      , 
                       source_filename_min          , mth)

            valor_etiqueta = source_filename_min
                       

        elif etiqueta == "DESTFILENAME":
            valor_etiqueta = self.getParseDestName()

        elif etiqueta == "DESTINATIONFILENAME":
            valor_etiqueta = self.getParseDestName()

        elif etiqueta == "SOURCENAMENOEXTENSION":
            valor_etiqueta = self.getParseSourceNoExt()

        elif etiqueta == "SOURCENAMENOEXT":
            valor_etiqueta = self.getParseSourceNoExt()

        elif etiqueta == "SOURCEFILENAMENOEXTENSION":
            valor_etiqueta = self.getParseSourceNoExt()

        elif etiqueta == "SOURCEFILENAMENOEXT":
            valor_etiqueta = self.getParseSourceNoExt()

        elif etiqueta == "DESTFILENAMENOEXTENSION":
            valor_etiqueta = self.getParseDestNoExt()

        elif etiqueta == "DESTINATIONFILENAMENOEXTENSION":
            valor_etiqueta = self.getParseDestNoExt()

        elif etiqueta == "DESTINATIONFILENAMENOEXT":
            valor_etiqueta = self.getParseDestNoExt()

        elif etiqueta == "CORRELID":
            valor_etiqueta = self.getParseCorrelId()

        elif etiqueta == "SENDER":
            valor_etiqueta = self.getParseSender()

        elif etiqueta == "DESCRIPTION":
            valor_etiqueta = self.getParseDescription()

        elif etiqueta == "DESCRIPCION":
            valor_etiqueta = self.getParseDescription()

        elif etiqueta.startswith("FECHA"):
            cfecha = ParseFecha("date",etiqueta)
            valor_etiqueta = cfecha.getValorResultado()

        elif etiqueta.startswith("HORA"):
            cfecha = ParseFecha("time",etiqueta)
            valor_etiqueta = cfecha.getValorResultado()

        elif etiqueta.startswith("FECHAHORA"):
            cfecha = ParseFecha("datetime",etiqueta)
            valor_etiqueta = cfecha.getValorResultado()

        elif etiqueta.startswith("FECHAYHORA"):
            cfecha = ParseFecha("datetime",etiqueta)
            valor_etiqueta = cfecha.getValorResultado()

        else:
            self.__Log("Etiqueta no conocida" , etiqueta , mth)


        self.LogEndMethod(self.__cls)
        return valor_etiqueta


#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=


## cad1="aaaac$FECHA+$MASCARA"


## cad_sys = sys.argv[1]


## pa= ParseString(cad_sys)
## print (pa.getResultado())

