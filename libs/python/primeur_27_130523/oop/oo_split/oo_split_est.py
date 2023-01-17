#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- SplitEst      : Clase de estructura para subcadenas
-----------------------------------------------------------
-+ Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- SplitMsg           : Clase de mensajes apra subcadenas
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
+ Process Statuss : [130517]
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

#- Importacion de clases heredadas

from oo_split_msg import SplitMsg
#-- necesitamos una clase de split para conseguir el ultimo caracter
#-- y para poder procesar argumentos


class SplitEst(SplitMsg):

    #-Variable estatica para indicar el nombre de la clase
    __cls           = "SplitEst"
    __mth           = ""    
    __log_level             = 0
    __log_class_level       = 0


    #- Atributos privados principales

    __cadena        = ""    #- Cadena a parsear
    __separator     = "."   #- Separador de la cadena

    #- Atributos privados / de momento no consigo que funcione
    __fields        = []    #- Lista de campos a evaluar    
    __fields_00        = "" #- Lista de campos a evaluar    
    __fields_01        = "" #- Lista de campos a evaluar    
    __fields_02        = "" #- Lista de campos a evaluar    
    __fields_03        = "" #- Lista de campos a evaluar    
    __fields_04        = "" #- Lista de campos a evaluar    
    __fields_05        = "" #- Lista de campos a evaluar    
    __fields_06        = "" #- Lista de campos a evaluar    
    __fields_07        = "" #- Lista de campos a evaluar    
    __fields_08        = "" #- Lista de campos a evaluar    
    __fields_09        = "" #- Lista de campos a evaluar    
    __fields_10        = "" #- Lista de campos a evaluar    
    __fields_11        = "" #- Lista de campos a evaluar    
    __fields_12        = "" #- Lista de campos a evaluar    
    __fields_13        = "" #- Lista de campos a evaluar    
    __fields_14        = "" #- Lista de campos a evaluar    
    __fields_15        = "" #- Lista de campos a evaluar    
    __fields_16        = "" #- Lista de campos a evaluar    
    __fields_17        = "" #- Lista de campos a evaluar    
    __fields_18        = "" #- Lista de campos a evaluar    
    __fields_19        = "" #- Lista de campos a evaluar    
    __fields_20        = "" #- Lista de campos a evaluar    


    __last_field    = ""    #- Ultimo campo pasado
    __num_fields    = 0     #- Numero de campos


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                               , 
                 cadena_a_dividir       = ""        ,
                 separator              = "."       ,
                 log_level              = 0         ,
                 log_class_level        = 0         ,
                 log_show               = "screen"  ):
        """ Constructor de estructura de subcadenas
        """

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        SplitMsg.__init__(self                  ,
            log_level                           ,
            log_class_level                     ,
            log_show                            )

        
        #-Acciones del constructor
       
        self.setCadena      (cadena_a_dividir   )        
        self.setSeparator   (separator          )            


  
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


    def getLastField(self):
        """ Retorno del Ultimo campo
        """    

        valor_a_devolver = self.__last_field
        self.logGet(valor_a_devolver, self.msg_last_field)
        return valor_a_devolver

    
    def setLastField(self):
        """ Establecimiento del ultimo campo
        """    
        
        pos_last_field= self.getNumFields()
        variable_a_establecer = self.getField(pos_last_field)

        self.logSet(
            variable_a_establecer , 
            variable_a_establecer , 
            self.msg_last_field)

        self.__last_field = variable_a_establecer


    def getNumFields(self):
        """ Retorno del numero de campos
        """    

        valor_a_devolver = self.__num_fields
        self.logGet(valor_a_devolver, self.msg_num_fields)
        return valor_a_devolver

    
    def setNumFields(self, argumento):
        """ Establecimiento del numero de campos
        """    

        variable_a_establecer = self.__num_fields

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_num_fields)

        self.__num_fields = argumento


    def getSeparator(self):
        """ Retorno del separador
        """    

        valor_a_devolver = self.__separator
        self.logGet(valor_a_devolver, self.msg_separator)
        return valor_a_devolver

    
    def setSeparator(self, argumento):
        """ Establecimiento del Sender
        """    

        variable_a_establecer = self.__separator

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_separator)

        self.__separator = argumento


    def getCadena(self):
        """ Retorno del Ultimo campo
        """    

        valor_a_devolver = self.__cadena
        self.logGet(valor_a_devolver, self.msg_cadena)
        return valor_a_devolver

    
    def setCadena(self, argumento):
        """ Establecimiento del Sender
        """    

        variable_a_establecer = self.__cadena

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_cadena)

        self.__cadena = argumento


    def addField(self               , 
                 argumento          , 
                 cont        = 0    ):
        """ Insertamos un campo
        """    
        posicion = self.getCont(cont)
        
        if posicion   == "00":
            self.__fields_00 = argumento
        elif posicion == "01":
            self.__fields_01 = argumento
        elif posicion == "02":
            self.__fields_02 = argumento
        elif posicion == "03":
            self.__fields_03 = argumento
        elif posicion == "04":
            self.__fields_04 = argumento
        elif posicion == "05":
            self.__fields_05 = argumento
        elif posicion == "06":
            self.__fields_06 = argumento
        elif posicion == "07":
            self.__fields_07 = argumento
        elif posicion == "08":
            self.__fields_08 = argumento
        elif posicion == "09":
            self.__fields_09 = argumento
        elif posicion == "10":
            self.__fields_10 = argumento
        elif posicion == "11":
            self.__fields_11 = argumento
        elif posicion == "12":
            self.__fields_12 = argumento
        elif posicion == "13":
            self.__fields_13 = argumento
        elif posicion == "14":
            self.__fields_14 = argumento
        elif posicion == "15":
            self.__fields_15 = argumento
        elif posicion == "16":
            self.__fields_16 = argumento
        elif posicion == "17":
            self.__fields_17 = argumento
        elif posicion == "18":
            self.__fields_18 = argumento
        elif posicion == "19":
            self.__fields_19 = argumento
        elif posicion == "20":
            self.__fields_20 = argumento
        

        #- se comporta como una lista global
##        self.__fields.append(argumento)


    def getField(self, cont = 0):
        """ Devolvemos un campo
            Por defecto el primero
        """    

        posicion = self.getCont(cont)

        if posicion   == "00":
            return self.__fields_00
        elif posicion == "01":
            return self.__fields_01 
        elif posicion == "02":
            return self.__fields_02 
        elif posicion == "03":
            return self.__fields_03 
        elif posicion == "04":
            return self.__fields_04 
        elif posicion == "05":
            return self.__fields_05
        elif posicion == "06":
            return self.__fields_06
        elif posicion == "07":
            return self.__fields_07 
        elif posicion == "08":
            return self.__fields_08 
        elif posicion == "09":
            return self.__fields_09 
        elif posicion == "10":
            return self.__fields_10 
        elif posicion == "11":
            return self.__fields_11 
        elif posicion == "12":
            return self.__fields_12 
        elif posicion == "13":
            return self.__fields_13 
        elif posicion == "14":
            return self.__fields_14 
        elif posicion == "15":
            return self.__fields_15 
        elif posicion == "16":
            return self.__fields_16 
        elif posicion == "17":
            return self.__fields_17 
        elif posicion == "18":
            return self.__fields_18 
        elif posicion == "19":
            return self.__fields_19 
        elif posicion == "20":
            return self.__fields_20 

##        return self.__fields[cont]


    def returnFields(self, inicio = 0   ,final = 0 ):
        """ Imiprimimos todos los campos
        """    
        mth = "returnFields"

        num_fields  = self.getNumFields()
        separator   = self.getSeparator()


        if final > num_fields:
            final = num_fields
            self.__Log("fuera de rango", self.bline, mth )

        cont = inicio      

        return_string = ""    
    
        while cont < final:                
            campo = self.getField(cont)
            
            if return_string != "":
                return_string = return_string + separator

            return_string = return_string + campo

            cont = cont + 1
        
        return return_string


    def getFileNameNoExt(self):
        """ Devuelve el nombre del fichero sin extension una vez paraseado
        """    
        num_fields = self.getNumFields()
        ultimo_campo_nombre= num_fields

        return self.returnFields(0 , ultimo_campo_nombre)


    def getExt(self):
        """ Devuelve la extension del fichero
            Si no tiene extension devolvera el fichero
        """    
        return self.getLastField()


    
    def logAllFields(self):
        """ Imiprimimos todos los campos
        """    
        mth = "logAllFields"
        num_fields = self.getNumFields()
        cont = 0      
    
        while cont < num_fields:                
            self.__Log("Campo posicion " + cont , 
                       self.getField(cont)      , mth)
            cont = cont + 1


    def getCont(self, posicion = 0):
        """ Devolvemos un campo
            Por defecto el primero
        """    

        if posicion   == 0:
            return "00"
        elif posicion == 1:
            return "01"
        elif posicion == 2:
            return "02" 
        elif posicion == 3:
            return "03" 
        elif posicion == 4:
            return "04" 
        elif posicion == 5:
            return "05"
        elif posicion == 6:
            return "06"
        elif posicion == 7:
            return "07" 
        elif posicion == 8:
            return "08" 
        elif posicion == 9:
            return "09" 
        elif posicion == 10:
            return "10" 
        elif posicion == 11:
            return "11" 
        elif posicion == 12:
            return "12" 
        elif posicion == 13:
            return "13" 
        elif posicion == 14:
            return "14" 
        elif posicion == 15:
            return "15" 
        elif posicion == 16:
            return "16" 
        elif posicion == 17:
            return "17" 
        elif posicion == 18:
            return "18" 
        elif posicion == 19:
            return "19"
        elif posicion == 20:
            return "20" 

    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

