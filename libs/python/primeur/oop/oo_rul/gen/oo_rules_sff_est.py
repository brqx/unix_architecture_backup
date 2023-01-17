#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.4
@pythonver: 3.3
-----------------------------------------------------------
+ Clases definidas                  : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- RulesSffEst   : Clase de estructura de Reglas SFFPost 
-----------------------------------------------------------
-+ Clases heredadas                 : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- RulesEst          : Clase de estructura de reglas
-----------------------------------------------------------
- FileSearch        : Clase de busqueda de cadenas en ficheros
-----------------------------------------------------------
-+ Metodos definidos                : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- getKeyValue                   - Obtiene el valor de la clave
-----------------------------------------------------------
- chekFileSff                   - Establece codigo apertura fichero
-----------------------------------------------------------
- setSpazioVars                 - Establece configuracion para Spazio
-----------------------------------------------------------
- sSpazioTmp                    - Establece directorio temporal
-----------------------------------------------------------
- sSpazioCfg                    - Establece directorio de configuracion
-----------------------------------------------------------
- sSpazioLog                    - Establece directorio de logs
-----------------------------------------------------------
- sffRulDestinationFileName     - Establece Destination Filename
-----------------------------------------------------------
- sffRulDirectory               - Establece Directorio
-----------------------------------------------------------
- sffRulSobrescritura           - Establece Sobrescritura
-----------------------------------------------------------
- sffRulPostProceso             - Establece Post Proceso
-----------------------------------------------------------
- sffRulPostArgs                - Establece argumentos Post Proceso
-----------------------------------------------------------
- sffRulCompresion              - Establece compresion
-----------------------------------------------------------
- sffRulTrigger                 - Establece bander
-----------------------------------------------------------
- sffRulCopyDup                 - Establece copydup
-----------------------------------------------------------
- getOpenFileCode               - Devuelve codigo apertura fichero
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- pm_string        : Libreria de primeur de cadenas
-----------------------------------------------------------
+ Librerias Sistema requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
===========================================================
+ Process Status  : [130603]
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

#- Importacion de librerias de primeur

import pm_string

#- Importacion de clases heredadas

from oo_rules_est import RulesEst

from oo_filesearch import FileSearch


class RulesSffEst(RulesEst):

    #-Variable estatica para indicar el nombre de la clase
    __cls                       = "RulesSffEst"
    __mth                       = ""    
    __log_level                 = 0
    __log_class_level           = 0

    __log_show                  = "screen"
    __log_file                  = ""    # Log file por defecto
    __log_file_alt              = ""    # Log file alterno
    __log_file_err              = ""    # Log file de error


    __open_file_code            = 0

    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                               , 
                 nombre_fichero_reglas  = ""        ,
                 comment                = "#"       ,
                 log_level              = 0         ,
                 log_class_level        = 0         ,
                 log_show               = "screen"  ,
                 log_file               = ""        ,
                 log_file_err           = ""        ,
                 log_size               = 1000000   ):

        """ Inicializa la clase de estructura Rules SFF 
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


        RulesEst.__init__  (self                    , 
                            comment                 ,
                            log_level               ,
                            log_class_level         ,
                            log_show                ,
                            log_file                ,
                            log_file_err            ,
                            log_size                )


        self.setSpazioVars(nombre_fichero_reglas    ,
                           comment                  )

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


    #-Clase de log de error
    def __ErrLog(self                          ,
              texto                         ,
              valor         =   ""          ,
              mth           =   "init"      ,
              dec           =   "normal"    ):
        """ Log de la clase para error
        """        
        self.__log_file_alt  = self.__log_file_err

        self.__LogAlt(texto                 ,
                      valor                 ,
                      mth                   ,
                      dec                   )

     
    def getKeyValue (self                           , 
                     nombre_argumento   = ""        ,
                     nombre_fichero     = ""        ,
                     tupla_correlid     = ""        ,
                     comment            = "#"       ):
        """ Devuelve una clave solicitada del archivo
            Hay que  considerar si la linea fuese un comentario
            El problema es que necesito tanto la linea como la clave
            y claro se me sobreponen

        """
        mth = "getKeyValue"
        self.LogInitMethod(self.__cls)

        valor_justif        = ""

        linea_completa      = ""


        if nombre_fichero == "":
            nombre_fichero = self.getRulesFileName()

        if tupla_correlid == "":
            tupla_correlid = self.getRulCorrelIdTuple()


        #-Falta gestionar los los en parse
        #-------------------------------------++++++
        log_level       = self.__log_level
        log_class_level = self.__log_class_level
        log_show        = self.__log_show
        log_file        = self.__log_file
        log_file_err    = self.__log_file_err
        log_size        = self.get_log_size()
    
        filesearch_linea = FileSearch(
                nombre_fichero          , 
                comment                 ,
                log_level               ,
                log_class_level         ,
                log_show                ,
                log_file                ,
                log_file_err            ,
                log_size                )

        filesearch_clave = FileSearch(
                nombre_fichero          , 
                comment                 ,
                log_level               ,
                log_class_level         ,
                log_show                ,
                log_file                ,
                log_file_err            ,
                log_size                )

        open_file_code = filesearch_linea.getOpenFileCode()

        if open_file_code == 0:
            #-Version anterior
    ##        cadena = tupla_correlid + nombre_argumento
    
            #-Version actual
            cadena = nombre_argumento
    
            self.__Log("Clave a buscar"         , 
                       nombre_argumento         , mth    )
            self.__Log("Fichero donde buscar"   , 
                       nombre_fichero           , mth    )
            self.__Log("Comentario a considerar", 
                       comment                  , mth    )
    
            #--------------- Gestion de la linea ---------------
##            filesearch_linea.searchClean()
            filesearch_linea.searchLineFile(cadena          , 
                                            nombre_fichero  )
    
            try:
                linea_completa = \
                    filesearch_linea.getFirstLine()
            except Exception:
                self.__ErrLog("Error al acceder a la linea" , 
                           self.bline                    , mth    )
                linea_completa = ""

    
            if linea_completa != "":

                linea_completa_justif = \
                            pm_string.str_clean(linea_completa)

                self.__Log("Linea Completa"                 , 
                           linea_completa_justif            , 
                           mth                              ,
                           "simple_simple"                  )

                if linea_completa.startswith(comment):        
                    self.__ErrLog("Clave comentada"         , 
                               self.bline                , mth    )
                    valor_justif = ""                
                else:
##                    filesearch_clave.searchClean()
                    filesearch_clave.searchKeyFile(
                                cadena                  , 
                                nombre_fichero          )
    
    
                    try:
                        primera_linea = \
                            filesearch_clave.getFirstLine()
                    except Exception:
                        primera_linea = ""
    
                    filesearch_clave.endSearch()
    
                    if primera_linea != "":
                        self.__Log("Clave encontrada"   ,    
                                    primera_linea       ,    
                                    mth                 ,
                                    "double_alt"        )
    
                        valor_justif = \
                            pm_string.str_clean(primera_linea)


                    else:
                        self.__ErrLog("Linea no encontrada", 
                                   self.bline           , mth    )
                        valor_justif = ""

       
            else:    
                #-No encuentra ninguna linea
                self.__ErrLog("Linea vacia"              , 
                           self.bline                 , mth    )
       
                valor_justif = ""

            filesearch_linea.endSearch()


        else:
            self.__ErrLog("Error al abrir fichero"     , 
                       nombre_fichero               , 
                       mth                          ,
                       "simple_double"              )
            

        self.LogEndMethod(self.__cls)


        return valor_justif


    #-- Metodos de acceso a la configuracion
    def chekFileSff(self                        , 
                    nombre_fichero  =   ""      ,
                    comment         =   ""      ):
        """ Establece configuracion para Spazio
            Rutas del sistema
        """

        log_level       = self.__log_level
        log_class_level = self.__log_class_level
        log_show        = self.__log_show
        log_file        = self.__log_file
        log_file_err    = self.__log_file_err
        log_size        = self.get_log_size()
      



        fsearch = FileSearch(nombre_fichero         ,
                             comment                ,
                             log_level              ,
                             log_class_level        ,
                             log_show               ,
                             log_file               ,
                             log_file_err           ,
                             log_size               )


        self.__open_file_code = fsearch.getOpenFileCode()



    #-- Metodos de acceso a la configuracion
    def setSpazioVars(self                      ,
                      nombre_fichero = ""       ,
                      comment        = ";"      ):

        """ Establece configuracion para Spazio
            Rutas del sistema
        """
        mth = "setSpazioVars"

        #Antes de seguir hay que ver si podemos abrir el archivo


        if nombre_fichero == "":
           spazio_ini  =   self.spazio + self.slash + "spazio.ini"

           self.__Log("No se indica fichero. Usamos configuracion",
                      spazio_ini,
                      mth,
                      "double_alt")

           self.chekFileSff(spazio_ini , comment)

          
           if self.__open_file_code == 0:
               self.__Log("Acceso a configuracion correcto",
                      self.bline,
                      mth,
                      "simple_simple")


               self.sSpazioTmp("TempPath"       , 
                               spazio_ini       ,
                               comment          )

               self.sSpazioCfg("CfgPath"        , 
                               spazio_ini       ,
                               comment          )

               self.sSpazioLog("LogPath"        , 
                               spazio_ini       ,
                               comment          )
           else:
               self.__ErrLog("Error en fichero",
                          nombre_fichero,
                          mth,
                          "double_double")
        else:
           self.chekFileSff(nombre_fichero)



    def sSpazioTmp(self                         ,
                     clave      = ""            ,
                     spazio_ini = ""            ,
                     comment    = ";"           ):
        """ 
        """

        mth = "sSpazioTmp"
        
        tupla_correlid  = ""
        
        ruta_temporal = self.getKeyValue(
                        clave               , 
                        spazio_ini          ,
                        tupla_correlid  ,
                        comment          )

        if ruta_temporal == "":
            ruta_temporal   = self.tmp_path

        self.tmp_path = ruta_temporal


            
        self.__Log("Ruta temporal"     , 
                   ruta_temporal       , mth)                    
    

    def sSpazioCfg(self                         ,
                     clave      = ""            ,
                     spazio_ini = ""            ,
                     comment    = ";"           ):
        """ 
        """

        mth = "sSpazioCfg"

        tupla_correlid  = ""
        
        ruta_config   = self.getKeyValue(
                        clave           , 
                        spazio_ini      ,
                        tupla_correlid  ,
                        comment         )

        self.__Log("Clave Ruta Configuracion"       , 
                   ruta_config                      , 
                   mth                              ,
                   "simple_alt"                     )                    



        if ruta_config == "":
            self.__Log("Establecemos ruta por defecto"      , 
                       self.spazio                          , 
                       mth                                  ,
                       "simple_alt"                         )                    

            ruta_config = self.spazio + self.slash + "cfg"

        self.cfg_path = ruta_config
            
##        self.cfg = ruta_config
            
        self.__Log("Ruta Configuracion"     , 
                   ruta_config            , mth)                    


    def sSpazioLog(self                         ,
                     clave      = ""            ,
                     spazio_ini = ""            ,
                     comment    = ";"           ):
        """ Devuelve la ruta de los logs
        """

        mth         = "sSpazioLog"

        tupla_correlid  = ""
        
        ruta_logs =  self.getKeyValue(
                          clave             , 
                          spazio_ini        ,
                          tupla_correlid  ,
                          comment           )

        if ruta_logs == "":
            ruta_logs = self.spazio + self.slash + "log"

        self.log_path   = ruta_logs

##        self.log = ruta_logs

        self.__Log("Ruta logs"          , 
                   ruta_logs            , 
                   mth                  ,
                   "simple_simple"      )                    



    def sffRulDestinationFileName (self):
        """ Devuelve el Destination FileName
        """
        argumento = "DESTFILENAME"
        valor_clave =  self.getKeyValue (argumento)

        if valor_clave == "":
            #-Probamos tambien con otra etiqueta
            argumento = "DESTINATIONFILENAME"
            valor_clave =  self.getKeyValue (argumento)
           
        self.setRulDestinationFileName(valor_clave)


    def sffRulDirectory (self):
        """ Devuelve el Directorio
            Set From File
        """
        argumento = "DIRECTORIO"
        valor_clave =  self.getKeyValue (argumento)

        self.setRulDirectory(valor_clave)


    def sffRulSobrescritura (self):
        """ Devuelve el Directorio
        """
        argumento = "SOBRESCRITURA"

        valor_clave =  self.getKeyValue (argumento)
        
        self.setRulSobrescritura(valor_clave)


    def sffRulCaracteres (self):
        """ Devuelve el Directorio
        """
        argumento = "CARACTERES"
        valor_clave =  self.getKeyValue (argumento)
        self.setRulCaracteres(valor_clave)


    def sffRulExtraccion (self):
        """ Devuelve el Directorio
        """
        argumento = "EXTRACCION"
        valor_clave =  self.getKeyValue (argumento)
        
        self.setRulExtraccion(valor_clave)


    def sffRulPostProceso (self):
        """ Devuelve el Directorio
        """
        argumento = "POSTPROCESO"
        valor_clave =  self.getKeyValue (argumento)
        self.setRulPostProcess(valor_clave)


    def sffRulPostArgs (self):
        """ Devuelve los argumentos del postproceso
        """
        argumento = "ARGUMENTOS"
        valor_clave =  self.getKeyValue (argumento)
        self.setRulPostProcessArgs(valor_clave)


    def sffRulCompresion (self):
        """ Devuelve los argumentos del postproceso
        """
        argumento = "COMPRESION"
        valor_clave =  self.getKeyValue (argumento)
        self.setRulCompress(valor_clave)


    def sffRulTrigger (self):
        """ Devuelve los argumentos del postproceso
        """
        argumento = "TRIGGER"
        valor_clave =  self.getKeyValue (argumento)
        self.setRulTrigger(valor_clave)

    def sffRulCopyDup (self):
        """ Devuelve los argumentos del postproceso
        """
        argumento = "COPYDUP"
        valor_clave =  self.getKeyValue (argumento)
        self.setRulCopyDup(valor_clave)


    #- Pendiente de colocar
    def getOpenFileCode(self):
        """ Devuelve los argumentos del postproceso
        """
        return self.__open_file_code

    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=


## clave = "LogPath"
## fichero = ""
## comment = ";"

## log_level        = 90
## log_class_level  = 0 
## log_show         = "screen"   


## ej = RulesSffEst(fichero            , 
##                  comment            ,
##                  log_level          ,
##                  log_class_level    ,
##                  log_show           )    



