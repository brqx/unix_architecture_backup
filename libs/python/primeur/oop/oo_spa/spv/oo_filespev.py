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
- FileSpv       - Clase de spazio para reenvio - SpevCmd 
-----------------------------------------------------------
-+ Clases heredadas     : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- SpazioSpv     - Clase de Spazio para Spv
-----------------------------------------------------------
- Sys           - Clase de comandos de ejecuccion
-----------------------------------------------------------
-+ Clases utilizadas    : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- Parse         - Clase de parseo
-----------------------------------------------------------
-+ Metodos definidos    : 
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
+ Process Status  : [130610]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [3] [_] [5]
===========================================================
"""

#- Importacion de librerias del sistema

##import os

#- Importacion de clases heredadas
from oo_sys         import Sys
#from oo_rules_spv   import RulesSpv
from oo_spspv       import SpazioSpv


#- Importacion de clases utilizadas


class FileSpv(SpazioSpv                     ,
              Sys                           ):
    
    __cls                           = "FileSpv"
    __mth                           = ""    
    __log_level                     = 0
    __log_class_level               = 0


    __log_show                      = "screen"
    __log_file                      = ""    # Log file por defecto
    __log_file_alt                  = ""    # Log file alterno
    __log_file_err                  = ""    # Log file de error

    
    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                                       , 
                 qmname                 =   ""              , 
                 sess_id                =   ""              , 
                 spev_type              =   "E"             , 
                 log_level              =   0               ,
                 log_class_level        =   0               ,
                 log_show               =   "screen"        ,
                 log_file               =   ""              ,
                 log_file_err           =   ""              ,
                 log_size               =   1000000         ):
        """ Constructor SpevCmd
            spevcmd ?QMANAGER? ?SESS_ID? E|A|R

            spevcmd ?QMANAGER? ?SESS_ID? E|A|R
            donde E|A|R será uno sólo en función de cómo finalice el procedimiento 
            y de lo que se solicite al gestor de eventos.
            End ‘E’ – El procedimiento de extracción se ha completado correctamente.
            Restart ‘R’  - El procedimiento de extracción NO se ha completado 
            correctamente y es debido a un problema temporal.
            Abort ‘A’  - El procedimiento de extracción NO se ha completado 
            correctamente y es debido a un problema no recuperable y por ello 
            no debe de ser relanzado.

        """
        mth = "init"
        
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

       
        SpazioSpv.__init__( self                        ,
                            qmname                      , 
                            sess_id                     , 
                            spev_type                   , 
                            log_level                   ,
                            log_class_level             ,
                            log_show                    ,
                            log_file                    ,
                            log_file_err                ,
                            log_size                    )

        command         =       ""

        Sys.__init__(       self                        ,
                            command                     ,
                            log_level                   ,
                            log_class_level             ,
                            log_show                    ,
                            log_file                    ,
                            log_file_err                ,
                            log_size                    )

  
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


    def processSpv(self):
        """ Procesa la recepcion del archivo
        """        
        mth = "processSpv"
    
        #-- Generar cadena del sistema
        self.createRunStr()
                
                #-- Ejecuccion de la cadena
        self.runSys()
       
        

    def createRunStr(self):
        """ Genera la cadena para llamar a spevcmd
            spevcmd ?QMANAGER? ?SESS_ID? E|A|R
        """        
        mth = "createRunStr"

        self.LogInitMethod(self.__cls)

        qmname          = self.getQmName()
        sess_id         = self.getSessId()
        spev_type       = self.getSpevType()


        usuario         = self.getUser()
        passwd          = self.getPasswd()

        if usuario  != "":
            c_usuario   = "-u " + usuario 

        if passwd   != "":
            c_passwd    = "-p " + passwd


        #-- Falta encontrar por que extraccion llega vacio

        self.__Log("Queue Manager"              , 
                   qmname                       , 
                   mth                          ,
                   "simple_simple"              )   


        self.__Log("Sess Id"                    , 
                   sess_id                      , 
                   mth                          ,
                   "simple_simple"              )   


        self.__Log("SpevCmd Type"               , 
                   spev_type                    , 
                   mth                          ,
                   "simple_simple"              )   


        #-Hay que gestionar el separador

        cadena_spevcmd = "spevcmd"      + self.sep + \
                         qmname 

        cadena_spevcmd = cadena_spevcmd + self.sep + \
                         sess_id 
##        cadena_spevcmd = cadena_spevcmd + self.sep + c_usuario
##        cadena_spevcmd = cadena_spevcmd + self.sep + c_passwd

        cadena_spevcmd = cadena_spevcmd + self.sep + \
                         spev_type


        self.__Log("Creada la cadena SpevCmd"   , 
                   cadena_spevcmd               , 
                   mth                          ,
                   "square_simple"              )        
                   
        
        self.runstr = cadena_spevcmd

        self.LogEndMethod(self.__cls)
    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

## qm           = "QM"
## sess_id      = "IdSess"
## spev_type    = "E"

## log_level       = 30
## log_class_level = 0
## log_show        = "screen"
## log_file        = ""


## ae = FileSpv(qm                 , 
##              sess_id            , 
##              spev_type          , 
##              log_level          ,
##              log_class_level    ,
##              log_show           ,
##              log_file           )

## ae.processSpv()

## print (ae.getRunStr())

## print (ae.getSpevType())

## print ae.getSysOutStr()

### ej = Rules(tupla_correlid, fichero_reglas)

### print ej.getDestinationFileName()
### print ej.getDirectorio()

