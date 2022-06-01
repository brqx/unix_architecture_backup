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
- Split      : Clase de gestion de subcadenas
-----------------------------------------------------------
-+ Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- SplitEst           : Clase de estructura de subcadenas
-----------------------------------------------------------
-+ Metodos definidos : 
-----------------------------------------------------------
- runSplit            - Ejecuta la orden de split
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- re
===========================================================
+ Process Statuss : [130530]
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

##import subprocess
#import sys

#- Python 3.3
import re

#- Importacion de clases heredadas

from oo_split_est import SplitEst


class Split(SplitEst):

    #-Variable estatica para indicar el nombre de la clase
    __cls                   =   "Split"
    __mth                   =   ""    
    __log_level             =   0
    __log_class_level       =   0

    __log_show              =   "screen"
    __log_file              =   ""    # Log file por defecto
    __log_file_alt          =   ""    # Log file alterno
    __log_file_err          =   ""    # Log file alterno
    

    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                                       , 
                 cadena_a_dividir           =   ""          ,
                 split_separator            =   "\."        ,
                 output_separator           =   "."         ,
                 log_level                  =   0           ,
                 log_class_level            =   0           ,
                 log_show                   =   "screen"    ,
                 log_file                   =   ""          ,
                 log_file_err               =   ""          ,
                 log_size                   =   1000000     ):
        """ Constructor de sub cadenas
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


        SplitEst.__init__(  self                        ,
                            cadena_a_dividir            ,
                            split_separator             , 
                            output_separator            , 
                            log_level                   ,
                            log_class_level             ,
                            log_show                    ,
                            log_file                    ,
                            log_size                    )

                    
        ## De momento runParse no hace nada

        self.__Log("Cadena a dividir"   ,
                   self.getCadena()     ,
                   mth                  ,
                   "simple_simple"      )

        self.__Log("Separador"          ,
                   self.getSeparator()  ,
                   mth                  ,
                   "simple_simple"      )


        self.runSplit()
##                
  
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
        

    def runSplit(self):
        """ Parsea nombre con el que se extrae el fichero y 
            podrá tener wild cards para indicar:
            Debe dividir cadenas por un separador
        """        
        mth = "runSplit"

        self.LogInitMethod(self.__cls)

        cadena                      = self.getCadena()
        split_separator             = self.getSplitSeparator() 
        output_separator            = self.getSeparator() 


        self.__Log("Cadena a dividir"           ,
                   cadena                       ,
                   mth                          ,
                   "simple_simple"              )


        self.__Log("Split Separador"            ,
                   split_separator              ,
                   mth                          ,
                   "simple_simple"              )


        self.__Log("Separador"                  ,
                   output_separator             ,
                   mth                          ,
                   "simple_simple"              )

        conjunto_lineas     = re.split(split_separator  , 
                                       cadena           )


        numero_campos       = len(conjunto_lineas)
        str_numero_campos   = str(numero_campos) 
        

        self.__Log("Numero de campos"           ,
                   str_numero_campos            ,
                   mth                          ,
                   "simple_simple"              )

        cont = 0      
    
        while cont < numero_campos:        
            linea_actual = conjunto_lineas[cont]
            self.__Log("Linea" + str(cont)               ,
                       linea_actual                      ,
                       mth                               ,
                       "simple_simple"                   )


            self.addField(linea_actual , cont)
            cont = cont + 1
            
        self.setNumFields(numero_campos)
        self.setLastField()


        self.LogEndMethod(self.__cls)

        
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=


## cad1="/opt/spazio/lapera.pepito del moreno.pompero.jpg"
## log_level       = 30
## log_class_level = 0
## log_show        = "screen"
## log_file        = "filecitos.dat"

## separator       = "."
## split_separator = "\."

## cad_sys = sys.argv[1]



## pa= Split(cad1              ,
##           split_separator   ,            
##           separator         ,
##           log_level         ,
##           log_class_level   ,
##           log_show          )

## print ("CLASE CONSTRUIDA")

#print (pa.getField(0))

#pa.logAllFields()


## print (pa.getFileNameNoExt())
## print (pa.getExt())
#print (pa.getLastField())
#print (pa.getNumFields())

#print (pa.returnFields(2,1))
