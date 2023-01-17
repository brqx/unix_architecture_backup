#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.2
-----------------------------------------------------------
+ Clases definidas      : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- EnvSys            - Gestion del entorno a nivel de sistema
-----------------------------------------------------------
-+ Clases heredadas     : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- EnvCad            - Clase de estructura de entorno
-----------------------------------------------------------
-+ Metodos definidos    : 
-----------------------------------------------------------
-- getVar  - Informa del valor de la variable
-- setVar  - Establece la variable con el valor pasado
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- os
===========================================================
+ Process Statuss : [130516]
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

import os

from oo_envcad import EnvCad


class EnvSys(EnvCad):
                       
    #-Variable estatica para indicar el nombre de la clase
    __cls                       = "EnvSys"
    __mth                       = ""    
    __log_level                 = 0
    __log_class_level           = 0


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self, *cadena_variables):
        """ Recibe la cadena de variables que debe comprobar y cargar
            Si alguna no existe el programa no debe funcionar                
        """

        self.LogInitConstructor()

        EnvCad.__init__(self)


        self.LogEndConstructor()


    def initEnv (self, *cadena_variables):
        """ Metodo para reemplazar la funcionalidad del constructor actual
            Pendiente de implementar
        """        


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

    #------------------------------------------------------
    #------------------ Acceso a la clase -----------------
    #------------------------------------------------------

    def getVar(self, variable_entorno):
        """ Obtiene una variable de la clase
            - Si no existe actualizamos el valor y devolvemos vacio
        """
        valor_variable = ""
        
        try:

            valor_variable = self.getCodVar(variable_entorno)
            #-Si ha sido correcto no cambiamos el codlast
            msg = self.msgClassVarOk(variable_entorno, valor_variable)
            
        except KeyError as e:
            #-Si hay error entonces si lo cambiamos
            msg = self.msgClassVarFail(variable_entorno)
            msg = msg + self.sep + "excepcion KeyError" + self.sep + str(e)                
            #- Establecemos el codigo de retorno
            #- No es necesario establecer la variable
            
        self.setLast(msg)
        return valor_variable


    def setVar(self, variable_entorno, valor_variable):
        """ Establece una variable de la clase
        """
        valor_interno = ""
        if valor_variable != "":
            #- Lanzamos el get para ver si la variable esta definida
            valor_interno = self.getVar(variable_entorno)
            #-- Esto es para el futuro. Ahora sobrescribimos siempre
                
            msg =       "Variable ["    + variable_entorno + "] establecida "
            msg = msg + "con valor ["   + valor_variable   + "]"

            #- Establecemos el valor
            self.setCodVar(variable_entorno, valor_variable)

            self.setCodLastOk()
        else:
            msg = "Valor no pasado para [" + variable_entorno + "] "
            self.setCodLastFail()
            
        self.setLast(msg)


    def clrVar(self, nombre_variable):
        """ Vacia una variable de la clase
        """

        valor_variable = ""
        self.setVar(nombre_variable,valor_variable)


    #------------------------------------------------------
    #------------------ Acceso al entorno -----------------
    #------------------------------------------------------


    def sfsClassVar(self, variable_entorno):
        """ Carga una variable del sistema en la clase
            Set From System
        """
        self.setVar(variable_entorno , 
                    self.getSystemVar(variable_entorno))

    #------------------------------------------------------
    #------------------ Acceso al Entorno -----------------
    #------------------------------------------------------

    def getSystemVar(self,nombre_variable):
        """ Recupera una variable de sistema del entorno
            - Si no existe devuelve cadena vacia
              pero igual si esta definida pero nos da igual no es correcto
        """

        valor_variable = os.getenv(nombre_variable)        
        if valor_variable:
            self.msgSysVarOk(nombre_variable, valor_variable)

        else:
            self.msgSysVarFail(nombre_variable)
            valor_variable = ""

        return valor_variable

##        setVar(nombre_variable,os.getenv(nombre_variable,'None'))        
   
    def sfcSystemVar(self, nombre_variable):
        """ Establece una variable de la clase en el sistema
            Set From Class
        """
        valor_variable = self.getVar(nombre_variable)
    
        if valor_variable != "":
            self.setSystemVar(nombre_variable, valor_variable)
            msg = "Variable establecida a nivel de sistema -" 
            msg = msg + self.sep + "[" + nombre_variable + "] = " 
            msg = msg + self.sep + "[" + valor_variable + "]" 
            self.setLast(msg)            
            self.setCodLastOk()
        else:
            self.msgClassVarFail(nombre_variable)


    def setSystemVar(self, nombre_variable, valor_variable):
        """ Establece una variable de sistema en el entorno
        """        

        if nombre_variable != "":
            if valor_variable != "":
                msg = "Variable establecida a nivel de sistema -" 
                msg = msg + self.sep + "[" + nombre_variable + "] = " 
                msg = msg + self.sep + "[" + valor_variable + "]" 
                self.setLast(msg)            
                self.setCodLastOk()

                os.environ[nombre_variable]=valor_variable

            else:
                msg = "Variable anulada a nivel de sistema -" 
                msg = msg + self.sep + "[" + nombre_variable + "] " 
                self.setLast(msg)            
                self.setCodLastOk()
        else:
            self.msgSysVarFail(nombre_variable)


    def clrSystemVar(self, nombre_variable):        
        """ Vacia una variable de sistema en el entorno
        """        
        valor_variable = ""
        self.setSystemVar(nombre_variable,valor_variable)

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

### try:
#----====----====----====----====----====----====----====---
#              INICIO  BLOQUE
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=


###     var1= "RCT"
###     var2= "IOP"
###     var3= ""
###     valor="pepito"
###     valor2=""
    
###     ejs=EnvSys()
###     ejs.setVar(var1,valor)
###     ejs.setSystemVar(var2,valor2)
#    valor_variable = ejs.getVar(var1)

#    print (ejs.getCodLast()
###     print (ejs.getSystemVar(var1))
###     print (ejs.getLast())
##    print (valor_variable)


#----====----====----====----====----====----====----====---
#              FIN  BLOQUE
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
### except NameError as e:
###		cadena_out = "Error de nombre. Clase igual no existe " + \
###		str(e)

###     print (cadena_out)

