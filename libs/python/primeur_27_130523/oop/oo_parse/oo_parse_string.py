#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- ParseString   : Clase de gestion del parseo de cadenas
-----------------------------------------------------------
+- Clases heredadas
--=----=----=----=----=----=----=----=----=----=----=----=-
- ParseVar         : oo_parse_var
-----------------------------------------------------------
+- Clases utilizadas
--=----=----=----=----=----=----=----=----=----=----=----=-
- String           : oo_string
-----------------------------------------------------------
+- Clases padre
--=----=----=----=----=----=----=----=----=----=----=----=-
- Parse             : Clase principal de parseo
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
===========================================================
+ Process Status  : [130517]
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

from oo_parse_var import ParseVar

#- Importacion de clases utilizadas

from oo_string import String


class ParseString(ParseVar):

    #-Variable estatica para indicar el nombre de la clase
    __cls               = "ParseString"
    __mth               = ""    
    __log_level         = 0
    __log_class_level   = 0



    __cadena            = ""    #- Cadena a parsear
    __resultado         = ""    #- Cadena parseada    

    #- Atributos publicos
    
    comodin         = "$"
    finalizador     = "+"


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
        """ Constructor de parseo de cadenas
        """
        mth = "init"

        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level


        ParseVar.__init__(self          ,
            cadena_a_parsear            ,
            sourcename                  ,
            destname                    ,
            correl_id                   ,
            sender                      ,
            description                 ,
            log_level                   ,
            log_class_level             ,
            log_show                    )

        self.runParse(cadena_a_parsear      ,
                      compress              ,
                      trigger               )


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



    def runParse(self                       ,
                 cadena_a_parsear   = ""    , 
                 compress           = ""    ,
                 trigger            = ""    ):
        """ Ejecuta el parseo definido
        """
        mth = "runParse"


        if cadena_a_parsear == "":
            cadena_a_parsear    = self.getParseString()
       

        self.__Log("Cadena a parsear"   ,
                   cadena_a_parsear     ,
                   mth                  ,
                   "simple_alt"      )


        self.__Log("Compress"   ,
                   compress     ,
                   mth                  ,
                   "simple_simple"      )


        self.__Log("Trigger"   ,
                   trigger     ,
                   mth                  ,
                   "simple_simple"      )


        resultado           = self.evalStr(cadena_a_parsear     ,
                                           compress             ,
                                           trigger              )


        self.__Log("Cadena parseada"   ,
                   cadena_a_parsear     ,
                   mth                  ,
                   "simple_alt"      )


        self.setResultado(resultado)
    

      
    def evalStr(self                    , 
                cadena_a_parsear = ""   ,
                compress         = ""   ,
                trigger          = ""   ):
        """ Evalua la cadena y actualiza todos sus datos
        """
                        
        cadena = String(cadena_a_parsear)        

        parte_izda = cadena.getLeft()
        parte_dcha = cadena.getRight()
        separador  = cadena.getFirstSeparator()

        resultado_dcha = ""
##        print ("[izda:-]" + parte_izda	)
##        print ("[-:dcha]" + parte_dcha	)
##        print ("Separador: -" + separador	)

        if separador != "":
            #-No hay separador - devolvemos la suma y listo

            if separador == self.comodin:
                #-La parte dcha es una etiqueta
                if parte_dcha != "":
                    resultado_dcha = \
                    self.evalStrLabel(parte_dcha    ,
                                 compress           ,
                                 trigger            )
    
            if separador == self.finalizador:
                #- La parte dcha es otra expresion mas a evaluar
            
                if parte_dcha != "":
                    resultado_dcha = \
                    self.evalStr(parte_dcha     ,
                                 compress       ,
                                 trigger        )
        

        parte_final_evaluada = \
            self.evalNoLabel(parte_izda     ,
                             compress       ,
                             trigger        )

        resultado = parte_final_evaluada + resultado_dcha

        return resultado    
    
    
    def evalNoLabel(self                        ,
                    etiqueta_a_parsear  = ""    ,
                    compress            = ""    ,
                    trigger             = ""    ):
        """ Evalua la cadena sabiendo que no es una etiqueta
            La idea es pode detectar un +.gz        
            Tenemos que gestionar las mayusculas
            Si no hay compresion, no se quita la extension
            Trigger no se esta evaluando
        """

        salida_vacia    = ""
        salida = etiqueta_a_parsear 

        etiqueta_upper= etiqueta_a_parsear.upper()

        #-Si es compresion y esta marcada la compresion
        #- entonceselminamos la extension para luego comprimir
        if etiqueta_upper == ".GZ":
            if compress.upper() == "GZ":
                    salida = salida_vacia
    
        if etiqueta_upper == ".ZIP":
            if compress.upper() == "ZIP":
                    salida = salida_vacia

    
        return salida

    
    def evalStrLabel(self                           , 
                     etiqueta_a_parsear     = ""    ,
                     compress               = ""    ,
                     trigger                = ""    ):
        """ Evalua la cadena sabiendo que es una etiqueta
        """
        cadena = String(etiqueta_a_parsear)        

        parte_izda = cadena.getLeft()
        parte_dcha = cadena.getRight()
        separador  = cadena.getFirstSeparator()
        resultado_izda = ""
        resultado_dcha = ""

        if separador == "":
            #- No hay separador. Toda la cadena es la etiqueta
            resultado_izda = self.evalLabel(parte_izda)
        else:
            #-hay separador - La parte izda es la etiqueta

            if separador == self.comodin:
                #-La parte dcha es otra una etiqueta
                
                if parte_izda != "":
                    resultado_izda = self.evalLabel(parte_izda)
            
                if parte_dcha != "":
                    resultado_dcha = \
                        self.evalStrLabel(  parte_dcha      ,
                                            compress        ,
                                            trigger         )

        if separador == self.finalizador:
            #- La parte dcha es otra expresion mas a evaluar

                if parte_izda != "":
                    resultado_izda = self.evalLabel(parte_izda)
            
                if parte_dcha != "":
                    resultado_dcha = \
                        self.evalStr(parte_dcha     ,
                                     compress       ,
                                     trigger        )
        
        
        resultado = resultado_izda + resultado_dcha

        return resultado    
                

    def evalLabel(self, etiqueta = ""):
        """ Evalua la cadena sabiendo que es una etiqueta
            Puede ser de la siguiente forma :
            a. ETIQUETA
            b. ETIQUETA = VALOR / MASCARA            
        """
        ## Logar aqui
##        print "Es una etiqueta : " + str(etiqueta)
        valor_etiqueta = self.parseVar(etiqueta)        
        
        
        return valor_etiqueta


    def getResultado(self):
        """ Retorno de la posicion del comodin
        """    

        valor_a_devolver = self.__resultado
##        self.logGet(valor_a_devolver, self.msg_resultado)
        return valor_a_devolver
    
    
    def setResultado(self, argumento):
        """ Establecimiento el simbolo del primer separador
        """    
        variable_a_establecer = argumento


##        self.logSet(
##            variable_a_establecer , 
##            variable_a_establecer , 
##            self.msg_first_separador)

        self.__resultado = variable_a_establecer


#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=


## cad1="$FECHA+zip"


## cad_sys = sys.argv[1]


## pa= ParseString(cad1)
## print pa.getResultado()


