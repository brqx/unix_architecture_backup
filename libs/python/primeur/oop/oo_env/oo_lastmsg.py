#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas      : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- LastMsg           - Informacion de utilidad
-----------------------------------------------------------
-+ Clases heredadas     : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- getsetGen         - Clase de get y sets
-----------------------------------------------------------
-+ Metodos definidos    : 
-----------------------------------------------------------
-- getLast        - Informa de la ultima ejecuccion
-- setLast        - Establece mensaje de ultima ejecuccion
-----------------------------------------------------------
-- getCodLast     - Devuelve el codigo de la ultima orden
-- setCodLastOk   - Establece codigo correcto en ejecuccion
-- setCodLastFail - Establece codigo de error
-----------------------------------------------------------
-- msgClassVarOk  - Variable correcta en clase
-- msgClassVarFail- Mensaje de error en variable de clase
-- msgSysVarOk    - Variable correcta en sistema
-- msgSysVarFail  - Mensaje de error en variable de sistema

+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- pendiente        : pendiente
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- pendiente
===========================================================
+ Process Statuss : [130603]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [_] [4] [5]
===========================================================
"""

#- Importacion de clases heredadas

from oo_getsetgen import getsetGen


class LastMsg(getsetGen):


    #-Variable estatica para indicar el nombre de la clase
    __cls                       = "LastMsg"
    __mth                       = ""    
    __log_level                 = 0
    __log_class_level           = 0
   
    __log_show                  = "screen"
    __log_file                  = ""    # Log file por defecto
    __log_file_alt              = ""    # Log file alterno

   
    #- Creo que no se usan
    __last          =   ""      #- Ultimo mensaje de consulta
    __codlast       =   0       #- Resultado de la ultima ejecuccion

    sep             =   " "     #- Definimos espacio como separador

    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                                       ,
                 log_level              =   0               ,
                 log_class_level        =   0               ,
                 log_show               =   "screen"        ,
                 log_file               =   ""              ,
                 log_size               =   1000000         ):

        """ Pendiente de revisar
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


    #------------------------------------------------------
    #------------------ Acceso al Last- -------------------
    #------------------------------------------------------
    #-- Metodos de ultima actividad
    #------------------------------------------------------

    def getLast(self):
        """ Obtiene una variable de la clase
            - Y que pasa si no existe
        """
        return self.__last

    def setLast(self, cadena_pasada):
        """ Establece el mensaje Last con la cadena indicada
        """
        self.__last = cadena_pasada


    #------------------------------------------------------
    #-- Metodos de ultimo resultado
    #------------------------------------------------------

    def getCodLast(self):
        """ Devuelve el codigo de la ultima orden
        """
        return self.__codlast

    def setCodLastOk(self):
        """ Establece el codigo de retorno positivo para codlast
        """
        self.__codlast = 0

    def setCodLastFail(self):
        """ Establece el codigo de retorno de error para codlast
        """
        self.__codlast = 1

    #------------------------------------------------------
    #------------------ Gestion de mensajes ---------------
    #------------------------------------------------------

    def msgClassVarOk(self, variable, valor_variable):
        """ Define el mensaje de variable correcta en clase
        """
        msg = "Variable existe a nivel de clase"
        msg = msg + self.sep + "[" + variable       + "] ="
        msg = msg + self.sep + "[" + valor_variable + "]"

        self.setLast(msg)
        self.setCodLastOk()
      
        return msg
        

    def msgClassVarFail(self,variable):
        """ Define el mensaje de variable correcta en clase
        """
        msg = "Variable no existe a nivel de clase"
        msg =  msg + self.sep + "[" + variable + "]" 

        self.setLast(msg)
        self.setCodLastFail()

        return msg
        

    def msgSysVarOk(self, variable, valor_variable):
        """ Define el mensaje de variable correcta en clase
        """
        msg = "Variable existe a nivel de sistema"
        msg = msg + self.sep + "[" + variable       + "]" 
        msg = msg + self.sep + "[" + valor_variable + "]"

        self.setLast(msg)
        self.setCodLastOk()

        return msg
        

    def msgSysVarFail(self, variable):
        """ Define el mensaje de variable correcta en clase
        """
        msg = "Variable no existe a nivel de sistema"
        msg =  msg + self.sep + "[" + variable + "]" 

        self.setLast(msg)
        self.setCodLastFail()        

        return msg
        
        
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
