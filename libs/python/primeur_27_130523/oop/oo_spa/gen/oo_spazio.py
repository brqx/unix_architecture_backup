#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
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
+ Process Statuss : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality       : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Comments      : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info          : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Just          : [0] [1] [_] [3] [4] [5]
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

    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                           , 
                 qmname                         , 
                 queue                          , 
                 numint                         , 
                 log_level          = 0         ,
                 log_class_level    = 0         ,
                 log_show           = "screen"  ):
        """ Inicio de Spazio generico
        """
        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level

        
        SpazioInit.__init__ (
            self            , 
            qmname          , 
            queue           , 
            numint          , 
            log_level       ,
            log_class_level ,
            log_show        )

        
        if log_level > log_class_level:
            self.sInfoConstructor(self.__cls)
            self.__Log(self.msg)

        self.LogEndConstructor()


    def __Log(self                          ,
              texto         =   ""          ,
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


    def initSpAcq(self                          , 
                 destination_filename           , 
                 source_filename                , 
                 correl_id                      ,
                 sender                         ,
                 ruta_temporal                  ,
                 rules_filename = ""            ,
                 log_level          = 0         ,
                 log_class_level    = 0         ,
                 log_show           = "screen"  ):
        """ Metodo inicializador de Spazio
        """
       
        self.initAcq(
            destination_filename    , 
            source_filename         , 
            correl_id               ,
            sender                  ,
            ruta_temporal           ,
            rules_filename          ,
            log_level               ,
            log_class_level         ,
            log_show                )


    def initSpFil(self                          , 
                 nod                = ""        , 
                 csv                = ""        ,
                 banner             = ""        ,
                 log_level          = 0         ,
                 log_class_level    = 0         ,
                 log_show           = "screen"  ):
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
       
        self.initFil(   nod, csv , banner   , 
                        log_level           ,
                        log_class_level     ,
                        log_show            )


    def initSpDsp(self, 
                 destination_filename       , 
                 source_filename            , 
                 sender                     ,
                 userclass                  ,
                 description                ,
                 standard                   ,
                 compressor                 ,
                 dirbackup                  ,
                 user                       ,
                 passwd                     ,
                 log_level          = 0         ,
                 log_class_level    = 0         ,
                 log_show           = "screen"  ):
        """ Recibe la cadena de variables que debe comprobar y cargar
            Si alguna no existe el programa no debe funcionar                
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
                        passwd                          ,
                        log_level           ,
                        log_class_level     ,
                        log_show            )

    
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