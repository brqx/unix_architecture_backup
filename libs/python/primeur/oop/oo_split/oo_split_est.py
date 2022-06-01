#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
@pythonver: 3.3
-----------------------------------------------------------
+ Clases definidas      : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- SplitEst          - Clase de estructura para subcadenas
-----------------------------------------------------------
-+ Clases heredadas     : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- SplitMsg          - Clase de mensajes apra subcadenas
-----------------------------------------------------------
-+ Metodos definidos    : 
-----------------------------------------------------------
- get/setCadena             - Cadena
-----------------------------------------------------------
- get/setLastField          - Ultimo campo
-----------------------------------------------------------
- get/setNumFields          - Numero de campos
-----------------------------------------------------------
- get/setSeparator          - Separador de salida
-----------------------------------------------------------
- get/setSplitSeparator     - Separador de parseo
-----------------------------------------------------------
- addField                  - Inserta campo en estructura
-----------------------------------------------------------
- getField                  - Devuelve el campo indicado
-----------------------------------------------------------
- returnFields              - Devuelve subconjunto campos
-----------------------------------------------------------
- getFileNameNoExt          - Devuelve todos los campos menos el ultimo
-----------------------------------------------------------
- getExt                    - Devuelve el ultimo campo
-----------------------------------------------------------
- getCont                   - Devuelve cadena contador
-----------------------------------------------------------
- logAllFields              - Imprime todos los campos
-----------------------------------------------------------
+ Librerias Primeur requeridas  :
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas  :
-----------------------------------------------------------
- Ninguna
===========================================================
+ Process Statuss : [130530]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [3] [4] [_]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [3] [_] [5]
===========================================================
"""

#- Importacion de clases heredadas

from oo_split_msg import SplitMsg
#-- necesitamos una clase de split para conseguir el ultimo caracter
#-- y para poder procesar argumentos - pendiente de otro desarrollo


class SplitEst(SplitMsg):

    #-Variable estatica para indicar el nombre de la clase
    __cls                   = "SplitEst"
    __mth                   = ""    
    __log_level             = 0
    __log_class_level       = 0

    __log_show              = "screen"
    __log_file              = ""    # Log file por defecto
    __log_file_alt          = ""    # Log file alterno
    __log_file_err          = ""    # Log file alterno

    #- Atributos privados principales

    __cadena                = ""    #- Cadena a parsear
    __separator             = "."   #- Separador de la cadena
    
    
    #- Python3 obliga a escapar  algunos caracteres como expresiones
    #  regulares
    __split_separator       = "\."

    #- Atributos privados / de momento no consigo que funcione
    __fields                = []    #- Lista de campos a evaluar    
    
    __fields_00             = "" #- Lista de campos a evaluar    
    __fields_01             = "" #- Lista de campos a evaluar    
    __fields_02             = "" #- Lista de campos a evaluar    
    __fields_03             = "" #- Lista de campos a evaluar    
    __fields_04             = "" #- Lista de campos a evaluar    
    __fields_05             = "" #- Lista de campos a evaluar    
    __fields_06             = "" #- Lista de campos a evaluar    
    __fields_07             = "" #- Lista de campos a evaluar    
    __fields_08             = "" #- Lista de campos a evaluar    
    __fields_09             = "" #- Lista de campos a evaluar    
    __fields_10             = "" #- Lista de campos a evaluar    
    __fields_11             = "" #- Lista de campos a evaluar    
    __fields_12             = "" #- Lista de campos a evaluar    
    __fields_13             = "" #- Lista de campos a evaluar    
    __fields_14             = "" #- Lista de campos a evaluar    
    __fields_15             = "" #- Lista de campos a evaluar    
    __fields_16             = "" #- Lista de campos a evaluar    
    __fields_17             = "" #- Lista de campos a evaluar    
    __fields_18             = "" #- Lista de campos a evaluar    
    __fields_19             = "" #- Lista de campos a evaluar    
    __fields_20             = "" #- Lista de campos a evaluar    


    __last_field            = ""    #- Ultimo campo pasado
    __num_fields            = 0     #- Numero de campos


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
        """ Constructor de estructura de subcadenas
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


        SplitMsg.__init__(  self                    ,
                            log_level               ,
                            log_class_level         ,
                            log_show                ,
                            log_file                ,
                            log_size                )

        
        #-Acciones del constructor
       
        self.setCadena          (cadena_a_dividir       )        
        self.setSplitSeparator  (split_separator        )            
        self.setSeparator       (output_separator       )            

  
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


    #-Clase de log de error
    def __ErrLog(self                           ,
              texto                             ,
              valor         =   ""              ,
              mth           =   "init"          ,
              dec           =   "normal"        ):
        """ Log de la clase para error
        """        
        self.__log_file_alt  = self.__log_file_err

        self.__LogAlt(texto                 ,
                      valor                 ,
                      mth                   ,
                      dec                   )


    def getLastField(self):
        """ Retorno del Ultimo campo
        """    

        valor_a_devolver = self.__last_field
        self.logGet(valor_a_devolver, self.msg_last_field)
        return valor_a_devolver

    
    def setLastField(self):
        """ Establecimiento del ultimo campo
        """    
        
        pos_last_field= self.getNumFields() - 1
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


    def getSplitSeparator(self):
        """ Retorno del separador
        """    

        valor_a_devolver = self.__split_separator
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


    def setSplitSeparator(self, argumento):
        """ Establecimiento del Sender
        """    

        variable_a_establecer = self.__split_separator

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_separator)

        self.__split_separator = argumento


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


    def addField(self                           , 
                 argumento      =   ""          ,  
                 cont           =   0           ):
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

        clean_string = ""
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
        else:
            return clean_string
##        return self.__fields[cont]


    def returnFields(self                   , 
                     inicio     = 0         ,
                     final      = 0         ,     
                     separator  = "."       ):
        """ Imiprimimos todos los campos
        """    
        mth = "returnFields"

        num_fields  = self.getNumFields()

        str_num_fields = str(num_fields)
        

        self.__Log("Numero de campos"   ,
                   str_num_fields       ,
                   mth                  ,
                   "simple_simple"      )

        self.__Log("separador"          ,
                   separator            ,
                   mth                  ,
                   "simple_simple"      )



        if final > num_fields:
            str_final   = str(final)
            final       = num_fields

            self.__ErrLog("fuera de rango"      , 
                          str_final             , 
                          mth                   ,
                          "simple_simple"       )


        cont = inicio      

        return_string = ""    
    
        while cont <= final:                
            campo = self.getField(cont)
            
            if campo:
        
                if return_string != "":
                    return_string = return_string + separator
    
                return_string = return_string + campo

            cont = cont + 1
        
        return return_string


    def getFileNameNoExt(self):
        """ Devuelve el nombre del fichero sin extension una vez paraseado
        """    
        mth = "getFileNameNoExt"

        num_fields = self.getNumFields()
        str_num_fields = str(num_fields)
        ultimo_campo_nombre= num_fields - 2

        self.__Log("Numero de campos"                   ,
                   str_num_fields                       ,
                   mth                                  ,
                   "simple_simple"                      )

        fichero_sin_extension = \
            self.returnFields(0 , ultimo_campo_nombre)

        return fichero_sin_extension

    def getExt(self):
        """ Devuelve la extension del fichero
            Si no tiene extension devolvera el fichero
        """    
        return self.getLastField()


    
    def logAllFields(self):
        """ Imprimimos todos los campos
        """    
        mth = "logAllFields"
        num_fields = self.getNumFields()
        str_num_fields = str(num_fields)        
        
        cont = 0 

        self.__Log("Numero de campos"   ,
                   str_num_fields       ,
                   mth                  ,
                   "simple_simple"      )

        while cont < num_fields:                
            str_cont = str(cont)
            self.__Log("Campo posicion " + str_cont , 
                       self.getField(cont)          , 
                       mth                          ,
                       "simple_simple"              )
                       
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
        else:
            return "100"
    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

