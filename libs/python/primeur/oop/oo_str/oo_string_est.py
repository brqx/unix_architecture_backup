#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
@pythonver: 3.3
-----------------------------------------------------------
+ Clases definidas              : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- StringEst             - Clase de estructura para cadenas
-----------------------------------------------------------
-+ Clases heredadas             : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- StringMsg             - Clase de mensajes para cadenas
-----------------------------------------------------------
-+ Metodos definidos            : 
-----------------------------------------------------------
- get/setCadena             - Cadena a evaluar
-----------------------------------------------------------
- get/setLeft               - Parte izda
-----------------------------------------------------------
- get/setRight              - Parte dcha
-----------------------------------------------------------
- get/setPosComodin         - Posicion comodin
-----------------------------------------------------------
- get/setPosFinalizador     - Posicion finalizador
-----------------------------------------------------------
- get/setPosSeparador       - Posicion separador
-----------------------------------------------------------
- get/setFirstSeparator     - Primer separador
-----------------------------------------------------------
+ Librerias Primeur requeridas  :
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas  :
-----------------------------------------------------------
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

#- Importacion de clases heredadas

from oo_string_msg import StringMsg


class StringEst(StringMsg):

    #-Variable estatica para indicar el nombre de la clase
    __cls                   = "StringEst"
    __mth                   = ""    
    __log_level             = 0
    __log_class_level       = 0

    __log_show              = "screen"
    __log_file              = ""    # Log file por defecto
    __log_file_alt          = ""    # Log file alterno


    __cadena                = ""    #- Cadena a parsear

    __izda                  = "" #- Parte izda del separador
    __dcha                  = "" #- Parte dcha del separador

    __pos_comodin           = 0  #- Deben ser enteros
    __pos_finalizador       = 0    
    __pos_separador         = 0

    __hay_comodin           = ""
    __hay_finalizador       = ""   

    __hay_separador         = ""   
    

    __first_separator       = " " #-Primer separador


    #- Atributos publicos
    
    comodin                 = "$"
    finalizador             = "+"

    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    #--- no esta implementado lo del separador
    def __init__(self                               , 
                 cadena_a_parsear       = ""        ,
                 separador              = "+"       ,
                 log_level              = 0         ,
                 log_class_level        = 0         ,
                 log_show               = "screen"  ,
                 log_file               = ""        ,
                 log_size               = 1000000   ):
        """ Constructor de estructuras de cadena
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

        StringMsg.__init__( self                    ,
                            log_level               ,
                            log_class_level         ,
                            log_show                ,
                            log_file                ,
                            log_size                )

                   
        ## Hay que iterar en la cadena y comprobar las variables

        self.setCadena(cadena_a_parsear)
        self.setPosComodin()
        self.setPosFinalizador()
        self.setPosSeparador()        
        self.setFirstSeparator()

        self.setLeft()
        self.setRight()


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
        

    def getCadena(self):
        """ Retorno de de la cadena
        """    

        valor_a_devolver = self.__cadena
        self.logGet(valor_a_devolver, self.msg_cadena)
        return valor_a_devolver
    
    def setCadena(self, argumento):
        """ Establecimiento de la cadena
        """    

        variable_a_establecer = self.__cadena

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_cadena)

        self.__cadena = argumento

    def getLeft(self):
        """ Retorno de la parte izda
        """    

        valor_a_devolver = self.__left
        self.logGet(valor_a_devolver, self.msg_left)
        return valor_a_devolver
    
    def setLeft(self):
        """ Establecimiento de la parte izda
        """    

        cadena = self.getCadena()
        pos_primer_separador = self.getPosSeparador()
        variable_a_establecer = ""

        if pos_primer_separador != -1:
            variable_a_establecer = cadena[0:pos_primer_separador]
        else:
            #-No hay separadores
            variable_a_establecer = cadena            

        self.logSet(
            variable_a_establecer , 
            variable_a_establecer , 
            self.msg_left)

        self.__left = variable_a_establecer


    def getRight(self):
        """ Retorno de la parte dcha
        """    

        valor_a_devolver = self.__right
        self.logGet(valor_a_devolver, self.msg_right)
        return valor_a_devolver
    
    
    def setRight(self):
        """ Establecimiento del de la parte derecha
        """    

        cadena = self.getCadena()
        pos_primer_separador = self.getPosSeparador()
        variable_a_establecer = ""

        if pos_primer_separador != -1:
            variable_a_establecer = cadena[pos_primer_separador + 1:len(cadena)]
        else:
            #-No hay separadores
            variable_a_establecer = ""
            
        self.logSet(
            variable_a_establecer , 
            variable_a_establecer , 
            self.msg_right)

        self.__right = variable_a_establecer


    def getPosComodin(self):
        """ Retorno de la posicion del comodin
        """    

        valor_a_devolver = self.__pos_comodin
        self.logGet(valor_a_devolver, self.msg_pos_comodin)
        return valor_a_devolver
    
    
    def setPosComodin(self):
        """ Establecimiento de la posicion del comodin
            Si no lo encuentra pone cadena vacia
        """    
        cadena= self.getCadena()
        
        pos_comodin = cadena.find(self.comodin)

        if pos_comodin != -1:
            self.__hay_comodin = "comodin"

        variable_a_establecer = pos_comodin

        self.logSet(
            variable_a_establecer , 
            variable_a_establecer , 
            self.msg_pos_comodin)

        self.__pos_comodin = pos_comodin


    def getPosFinalizador(self):
        """ Retorno de la posicion del comodin
        """    
        valor_a_devolver = self.__pos_finalizador
        self.logGet(valor_a_devolver, self.msg_pos_finalizador)
        return valor_a_devolver
    
    
    def setPosFinalizador(self):
        """ Establecimiento de la posicion del comodin
        """    

        cadena= self.getCadena()
        
        pos_finalizador = cadena.find(self.finalizador)

        if pos_finalizador != -1:
            self.__hay_finalizador = "finalizador"

        variable_a_establecer = pos_finalizador

        self.logSet(
            variable_a_establecer , 
            variable_a_establecer , 
            self.msg_pos_finalizador)

        self.__pos_finalizador = pos_finalizador


    def getPosSeparador(self):
        """ Retorno de la posicion del comodin
        """    

        valor_a_devolver = self.__pos_separador
        self.logGet(valor_a_devolver, self.msg_pos_separador)
        return valor_a_devolver
    
    
    def setPosSeparador(self):
        """ Establecimiento de la posicion del comodin
        """    

        pos_separador = ""        
        pos_comodin = self.getPosComodin()
        pos_finalizador = self.getPosFinalizador()

        if self.__hay_comodin != "":
            if self.__hay_finalizador != "":
                #-- Tenemos comodin y finalizador
                if pos_comodin < pos_finalizador:
                    pos_separador = pos_comodin
                else:
                    pos_separador = pos_finalizador
            else:
                #-- no tenemos finalizador
                pos_separador = pos_comodin
        else:
            #-- no tenemos comodin
            pos_separador = pos_finalizador
    
        variable_a_establecer = pos_separador

        self.logSet(
            variable_a_establecer , 
            pos_separador , 
            self.msg_pos_separador)

        self.__pos_separador = pos_separador


    def getFirstSeparator(self):
        """ Retorno de la posicion del comodin
        """    

        valor_a_devolver = self.__first_separator
        self.logGet(valor_a_devolver, self.msg_first_separador)
        return valor_a_devolver
    
    
    def setFirstSeparator(self):
        """ Establecimiento el simbolo del primer separador
        """    
        pos_primer_separador = int(self.getPosSeparador())
        cadena = self.getCadena()
        variable_a_establecer = ""


        if pos_primer_separador != -1:
            variable_a_establecer = cadena[pos_primer_separador]

        self.logSet(
            variable_a_establecer , 
            variable_a_establecer , 
            self.msg_first_separador)

        self.__first_separator = variable_a_establecer


#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

