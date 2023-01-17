#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.4
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- SpazioInit      : Clase de inicializacion de Spazio
-----------------------------------------------------------
-+ Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- SpazioEst          : Clase de estructura de Spazio
-----------------------------------------------------------
-+ Metodos definidos : 
-----------------------------------------------------------
- initAcq           - Carga atributos para Acq
-----------------------------------------------------------
- initFil           - Carga atributos para FileList
-----------------------------------------------------------
- initDsp           - Carga atributos para Filetdsp
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- Ninguna
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

from oo_spazio_est import SpazioEst


class SpazioInit(SpazioEst):

    #-Variable estatica para indicar el nombre de la clase
    __cls                   =   "SpazioInit"
    __mth                   =   ""    
    __log_level             =   0
    __log_class_level       =   0

    __log_show              =   "screen"
    __log_file              =   ""    # Log file por defecto
    __log_file_alt          =   ""    # Log file alterno

    __log_file_err          =   ""    # Log file de error
    
    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                                       , 
                 qmname                 =   ""              , 
                 queue                  =   ""              , 
                 numint                 =   ""              , 
                 log_level              =   0               ,
                 log_class_level        =   0               ,
                 log_show               =   "screen"        ,
                 log_file               =   ""              ,
                 log_file_err           =   ""              ,
                 log_size               =   1000000         ):
        """ Clase de Inicio de Spazio para llamadas Acq Dsp y Lis
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


        SpazioEst.__init__( self                        ,     
                            qmname                      , 
                            queue                       , 
                            numint                      , 
                            log_level                   ,
                            log_class_level             ,
                            log_show                    ,
                            log_file                    ,
                            log_file_err                ,    
                            log_size                    )


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


    def initAcq(self                                        , 
                 destination_filename       =   ""          , 
                 source_filename            =   ""          , 
                 correl_id                  =   ""          ,
                 sender                     =   ""          ,
                 ruta_temporal              =   ""          ,
                 rules_filename             =   ""          ):
        """ Inicio de la clase de Spazio que carga parametros para Acq
        """

        mth = "initAcq"
        self.LogInitMethod(self.__cls)

        #Nueva funcionalidad - el fichero de reglas puede no existir        


        self.__Log("Fichero_Fuente" ,
                   source_filename  , 
                   mth              ,
                   "square_alt"     )


        #-- Acciones constructor
        #   Debemos construir el objeto
        correl_id_tuple = correl_id + "." + sender

        self.setCorrelIdTuple(correl_id_tuple)

        self.setSourceFileName              (source_filename        )
        self.setDestinationFileName         (destination_filename   )
        self.setCorrelId                    (correl_id              )
        self.setSender                      (sender                 )
        self.setDirectory                   (ruta_temporal          )
        self.setRulesFileName               (rules_filename         )

        self.LogEndMethod(self.__cls)



    def initFil(self                                            , 
                 nod                    =   "oNOD"              , 
                 csv                    =   "o CSV"             ,
                 banner                 =   "oNOBanner"         ):
        """ Establece los atributos especificos para Filelist
            nod - csv - banner                
        """

        #-Ajuste multi sistema
        nod     = self.pmt_ind + "oNOD"     
        csv     = self.pmt_ind + "o CSV"    
        banner  = self.pmt_ind + "oNOBanner"


        self.setNod     (nod)
        self.setCsv     (csv)
        self.setBanner  (banner)
                

    def initDsp(self                                    , 
                 destination_filename   =   ""          , 
                 source_filename        =   ""          , 
                 sender                 =   ""          ,
                 userclass              =   ""          ,
                 description            =   ""          ,
                 standard               =   ""          ,
                 compressor             =   ""          ,
                 dirbackup              =   ""          ,
                 user                   =   ""          ,
                 passwd                 =   ""          ,
                 fichero_reglas         =   ""          ):
        """ Inicializador para Spazio Dsp
            Debe llegarle el fichero de reglas
            no podemos establecer uno por defecto al ser multiplataforma
        """

        mth = "initDsp"        
        self.LogInitMethod(self.__cls)

        self.__Log("Fichero_Fuente"         ,
                   source_filename          , 
                   mth                      ,
                   "simple_simple"          )


        self.setDestinationFileName         (destination_filename   )
        self.setSourceFileName              (source_filename        )
        self.setDestinationFileNameNoExt    ()
        self.setSourceFileNameNoExt         ()
        self.setSender                      (sender                 )
        self.setUserClass                   (userclass              )
        self.setDescription                 (description            )
        self.setStandard                    (standard               )
        self.setCompressor                  (compressor             )
        self.setBackupDir                   (dirbackup              )
        self.setUser                        (user                   )
        self.setPasswd                      (passwd                 )

        self.LogEndMethod(self.__cls)


    def initSpv(self                                        , 
                 sess_id                =   ""              , 
                 spev_type              =   "E"             ):
        """ Inicio de la clase de Spazio que carga parametros para Spv
        """

        mth = "initSpv"
        self.LogInitMethod(self.__cls)

        #Nueva funcionalidad - el fichero de reglas puede no existir        


        self.__Log("Session Id"         ,
                   sess_id              , 
                   mth                  ,
                   "simple_simple"      )

        self.__Log("Spev Type"          ,
                   spev_type            , 
                   mth                  ,
                   "simple_simple"      )


        #-- Acciones constructor
        #   Debemos construir el objeto

        self.setSessId                      (sess_id                )
        self.setSpevType                    (spev_type              )

        self.LogEndMethod(self.__cls)

    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

