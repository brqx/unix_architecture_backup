#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.4
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Spazio        : Clase principal de Spazio
-----------------------------------------------------------
+- Clases heredadas  :
--=----=----=----=----=----=----=----=----=----=----=----=-
- SpazioInit    : Clase de inicio de Spazio 
-----------------------------------------------------------
+- Clases Padre / invocantes  :
--=----=----=----=----=----=----=----=----=----=----=----=-
- SpazioAcq    : Clase de inicio de Spazio 
-----------------------------------------------------------
-+ Metodos definidos : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- initSpAcq         -   Inicializa atributos Spazio Acq
-----------------------------------------------------------
- initSpDsp         -   Inicializa atributos Spazio Dsp
-----------------------------------------------------------
- initSpFil         -   Inicializa atributos Spazio Filelist
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- Ninguna
===========================================================
+ Process Statuss : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality       : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Comments      : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info          : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Just          : [0] [1] [2] [3] [_] [5]
===========================================================
"""

#- Importacion de clases heredadas

from oo_spazio_init import SpazioInit


class Spazio(SpazioInit):

    #-Variable estatica para indicar el nombre de la clase
    __cls                       = "Spazio"
    __mth                       = ""    
    __log_level                 = 0
    __log_class_level           = 0

    __log_show                  = "screen"
    __log_file                  = ""    # Log file por defecto
    __log_file_alt              = ""    # Log file alterno


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                                   , 
                 qmname                 =   ""          , 
                 queue                  =   ""          , 
                 numint                 =   ""          , 
                 log_level              =   0           ,
                 log_class_level        =   0           ,
                 log_show               =   "screen"    ,
                 log_file               =   ""          ,
                 log_file_err           =   ""          ,
                 log_size               =   1000000     ):
        """ Inicio de Spazio generico
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


        SpazioInit.__init__ (   self                , 
                                qmname              , 
                                queue               , 
                                numint              , 
                                log_level           ,
                                log_class_level     ,
                                log_show            ,
                                log_file            ,
                                log_file_err        ,
                                log_size            )

        
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


    def initSpAcq(self                                  , 
                 destination_filename   =   ""          , 
                 source_filename        =   ""          , 
                 correl_id              =   ""          ,
                 sender                 =   ""          ,
                 ruta_temporal          =   ""          ,
                 rules_filename         =   ""          ):
        """ Metodo inicializador de Spazio
        """
       
        self.initAcq(
            destination_filename    , 
            source_filename         , 
            correl_id               ,
            sender                  ,
            ruta_temporal           ,
            rules_filename          )


    def initSpFil(self                                      , 
                 nod                    =   ""              , 
                 csv                    =   ""              ,
                 banner                 =   ""              ):
        """ Invoca a la inicializacion de atributos espcificos
            Filelist - nod - csv - banner               
        """

        #-Ajuste multi sistema
        if nod  == "":
            nod     = self.pmt_ind + "oNOD"

        if csv  == "":
            csv     = self.pmt_ind + "o CSV"

        if banner == "":
            banner  = self.pmt_ind + "oNOBanner"
       
        self.initFil(   nod                 , 
                        csv                 , 
                        banner              )


    def initSpDsp(self                                  , 
                 destination_filename   =   ""          , 
                 source_filename        =   ""          , 
                 sender                 =   ""          ,
                 userclass              =   ""          ,
                 description            =   ""          ,
                 standard               =   ""          ,
                 compressor             =   ""          ,
                 dirbackup              =   ""          ,
                 user                   =   ""          ,
                 passwd                 =   ""          ):
        """ Inicializador Dsp
        """
        
        self.initDsp(   destination_filename            , 
                        source_filename                 , 
                        sender                          ,
                        userclass                       ,
                        description                     ,
                        standard                        ,
                        compressor                      ,
                        dirbackup                       ,
                        user                            ,
                        passwd                          )


    def initSpSpv(self                                      , 
                 sess_id                =   ""              , 
                 spev_type              =   "E"             ):
        """ Metodo inicializador de Spazio
        """
       
        self.initSpv(
            sess_id                 , 
            spev_type               )

    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

## qm = "Gestor"
## q  = "Cola"
## n  = "numint"
## df = "destination_filename_brqx"
## co = "correl_id"
## se = "sender"
## rt = "ruta_temporal"
## L  = "LOG_SHOW"
## ll = 30

## ej = Spazio(qm,q,n,
##             df,co,se,rt,L , re, ll)

## ej.setQmName("Pepe")
## print (ej.getDestinationFileName()	)