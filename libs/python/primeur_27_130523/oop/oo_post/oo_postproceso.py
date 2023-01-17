#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.4
-----------------------------------------------------------
+ Clases definidas      : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- PostProceso   - Clase de Post Proceso
-----------------------------------------------------------
-+ Clases heredadas     : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- PostProcesoEst     - Clase de estructura de postproceso
-----------------------------------------------------------
- PostProcesoCmd     - Clase de comando de postproceso
-----------------------------------------------------------
-+ Clases utilizadas    : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- Sys               - Clase de parseo
-----------------------------------------------------------
- File              - Clase de acceso a ficheros de reglas
-----------------------------------------------------------
-+ Metodos definidos    : 
-----------------------------------------------------------
- processPost       - Lanzador de post proceso
-----------------------------------------------------------
- runTrigger        - Procesador de la bandera
-----------------------------------------------------------
- runCompress       - Procesador de la compresion
-----------------------------------------------------------
- runProcess        - Procesador del Post Proceso
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- Ninguna
===========================================================
+ Process Status  : [130523]
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

#- Importacion de librerias del sistema

##import sys

#- Importacion de clases heredadas

from oo_postproceso_est         import PostProcesoEst
from oo_postproceso_commands    import PostProcesoCmd
##from oo_rules_sff_est           import RulesSffEst

#- Importacion de clases utilizadas

from oo_sys     import Sys
from oo_file    import File


class PostProceso(PostProcesoEst        , 
                  PostProcesoCmd        ):

    #-Variable estatica para indicar el nombre de la clase
    __cls                       = "PostProceso"
    __mth                       = ""    
    __log_level                 = 0
    __log_class_level           = 0
    __log_show                  = "screen"

    
    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                               , 
                 dest_filename          = ""        ,
                 directory              = ""        ,
                 proceso                = ""        ,  
                 compresion             = "gz"      , 
                 trigger                = "TRG"     ,
                 log_level              = 0         ,
                 log_class_level        = 0         ,
                 log_show               = "screen"  ):
        """ Constructur del postproceso
        """

        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level

   
        PostProcesoEst.__init__(self    ,
                                dest_filename               ,
                                directory                   ,
                                proceso                     ,
                                compresion                  , 
                                trigger                     , 
                                log_level                   ,
                                log_class_level             ,
                                log_show                    )


        PostProcesoCmd.__init__(self                        ,
                                log_level                   ,
                                log_class_level             ,
                                log_show                    )

  
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


    def processPost(self):
        """ Procesa la recepcion del archivo
        """        
        mth = "processPost"
        self.LogInitMethod(self.__cls)


        trigger     = self.getPostTrigger()        
        compress    = self.getPostCompress()        
        process     = self.getPostProcess()        


        self.__Log("Evaluando Trigger"          , 
                   trigger                      , 
                   mth                          ,
                   "square_alt"              )
            
        #-- Crear la bandera
        #- No estan llegando bien los parametros del trigger 
        #- al post proceso
        if trigger != "":
            self.runTrigger()
        

        self.__Log("Evaluando Compresion"       , 
                   compress                     , 
                   mth                          ,
                   "square_alt"              )
        
        #-- Comprimir
        if compress != "":
            self.runCompress()
        

        self.__Log("Evaluando Post Proceso"       , 
                   compress                     , 
                   mth                          ,
                   "square_alt"              )


        #-- Ejecutar comando post proceso
##        if process != "":
##            self.runProcess()

        self.LogEndMethod(self.__cls)


    def runTrigger(self):
        """ Procesa la generacion del trigger
            Dos casos :
            Normal  : .trg
            Omitido : (dat).trg
        """        
        mth = "runTrigger"
        self.LogInitMethod(self.__cls)

        #- Tenemos este caso
        # spazio.ini20130520165242    
        

        fich_destino        =  self.getPostDestinationFileName()
        fich_destino_no_ext =  self.getPostDestinationFileNameNoExt()

        #-De momento no le veo sentido
##        clean_df            =  self.getPostCleanDestinationFilename()  
        extension           =  self.getPostExt()

        directorio          =  self.getPostDirectory()
    
        trigger             =  self.getPostTrigger()
        
        compress            =  self.getPostCompress()

        self.__Log("Trigger"                  , trigger             , mth)
        self.__Log("Compress"                 , compress            , mth)
        self.__Log("Fichero Destino"          , fich_destino        , mth)
        self.__Log("Fichero Destino no ext"   , fich_destino_no_ext , mth)
        self.__Log("Directorio"               , directorio          , mth)
        self.__Log("Extension"                , extension           , mth)

        low_compress = ""
        if compress != "":
            low_compress = "." + compress.lower()


        # Caso 1 .trg
        # Caso 2 (gz).trg
        linea_trg = trigger.split(")")

        len_linea_trg = len(linea_trg)     

        if len_linea_trg == 1:
            #-Trigger normal
            #-Formato .trg
   
            fich_name = directorio    + self.slash      +   \
                        fich_destino  + low_compress    +   \
                        trigger

        elif len_linea_trg ==2:
            #-Trigger cambiado
            #-Formato (ext).trg
            trigger_final = linea_trg[1]
            trigger_first = linea_trg[0]
            #- Tenemos (gz
            linea_trg_first = trigger_first.split("(")
            trigger_first_clean = linea_trg_first[1]

            #- Si es igual que la extension entonces la quitamos
            if trigger_first_clean.upper() == extension.upper():
                #-Este caso es .gz con trigger (gz).trg
                fich_name = directorio    + self.slash +  \
                            fich_destino_no_ext + trigger_final
            else:
                #-Este caso es .zip con trigger (gz).trg
                #-Ignoramos el gz
                fich_name = directorio    + self.slash +  \
                            fich_destino +  trigger_final


            

        self.__Log("Trigger a generar", fich_name       , mth)

        #-- Falta gestionar si no se crea bien
        self.createTrigger(fich_name)
##      Logear que ha creado la bandera

        self.LogEndMethod(self.__cls)

        

    def runCompress(self):
        """ Procesa la recepcion del archivo
        """        
        mth = "runCompress"
        self.LogInitMethod(self.__cls)

        #-Informacion del fichero
        fich_destino        =  self.getPostDestinationFileName()
        fich_destino_no_ext =  self.getPostDestinationFileNameNoExt()
        extension_fich      =  self.getPostExt()
        directorio          =  self.getPostDirectory()

        #-Informacion del tipo de compresion    
        format_file         =  self.getPostCompress()
        up_format_file      =  format_file.upper()

        self.__Log("Formato Compresion"       , format_file         , mth)
        self.__Log("Fichero Destino"          , fich_destino        , mth)
        self.__Log("Fichero Destino no ext"   , fich_destino_no_ext , mth)
        self.__Log("Extension Fichero"        , extension_fich      , mth)

        self.__Log("Directorio"               , directorio          , mth)

       
        csys = Sys()

        
        #-Fichero a componer en comando
        fich_name_no_ext = self.getPostDirectory()    + self.slash + \
                           fich_destino_no_ext 

    
        #-Fichero real extraido por filetdsp
        fich_name = self.getPostDirectory()    + self.slash + \
                    fich_destino 

        self.__Log("Formato compresion pasado"          , 
                   format_file                          , 
                   mth                                  ,
                   "simple_simple"                      )

        self.__Log("Nombre_fichero_destino"             , 
                   fich_name                            , 
                   mth                                  ,
                   "double_alt"                         )


        #-Permite que se pase zip o .zip
        if up_format_file.startswith("."):
            split_ext=up_format_file.split(".")
            up_format_file_sin_punto = split_ext[1]
            up_format_file_con_punto = up_format_file   
        else:
            up_format_file_sin_punto = up_format_file
            up_format_file_con_punto = "." + up_format_file   
                

        self.__Log("Formato compresion ajustado"        , 
                   up_format_file_sin_punto             , mth)


        full_command = ""
        
        if up_format_file_sin_punto     == "GZ":
            full_command = \
            self.createCompressCommandGzip(
                fich_name                   , 
                fich_name_no_ext            )
        elif up_format_file_sin_punto   == "ZIP":
            #- Le pasamos 
            # - el fichero con extension extraido
            # - el fichero sin extension a componer
            # - el formato a usar
            full_command = \
            self.createCompressCommandZip(
                fich_name                   , 
                fich_name_no_ext            )
        

        self.__Log("Comando compresion"     , 
                   full_command             ,
                   mth                      ,
                   "simple_alt"             )

            
        if full_command != "":

            csys.setRunStr(full_command)

            syscall_comp = csys.getRunStr()
    
            self.__Log("Llamada Compresion"         ,   
                       syscall_comp                 ,   
                       mth                          ,
                       "simple_simple"              )
    
            csys.runSys()

            syscode_comp        = csys.getSysCode()
            str_syscode_comp    = str(syscode_comp)

            sysstr_comp         = csys.getSysOutStr()


            self.__Log("Resultado Compresion"       ,   
                       str_syscode_comp             , 
                       mth                          ,
                       "simple_simple"              ) 

            self.__Log("Salida Compresion"          ,   
                       sysstr_comp                  ,   
                       mth                          ,
                       "square_alt"                 )


            #--- Hay que revisar este proceso            
            if syscode_comp == 0:

                self.__Log("Compresion Correcta"           ,   
                           self.bline       , mth)

                #-Estamos creando la bandera o un fichero
##                fich = File()
##                fich.createFile(fich_name)        
                # depende del que se haya usado para comprimir
                #-- Si es zip debemos borrar el archivo
                if up_format_file_sin_punto == "ZIP":
                    self.processDelete(fich_name)

            else:
                #- Eror al comprimir
                self.__Log("Error Compresion"           ,   
                           sysstr_comp                  ,   
                           mth                          ,
                           "square_double"              )

        else:
            self.__Log("Formato no conocido"            ,   
                       format_file                      , 
                       mth                              ,
                       "simple_simple"                  )


        self.LogEndMethod(self.__cls)


    def processDelete(self, fich_name):
        """ Procesa la recepcion del archivo
        """        
        #-- Falta gestionar el borrado

        fich = File()
        fich.deleteFile(fich_name)        


    def runProcess(self):
        """ Procesa la recepcion del archivo
        """        

        mth = "runProcess"
        self.LogInitMethod(self.__cls)

        process = self.getPostProcess()
        post_args = self.getPostArgs()

        full_command = process + self.slash + post_args

        self.__Log("Comando Post Proceso"   , 
                   full_command             , mth)
   
   
        if full_command != "":

   
            csys = Sys(full_command)

            syscall_post = csys.getRunStr()

            self.__Log(self.dlines                  ,   
                       self.dlines                  , mth)            
            self.__Log("Llamada Post Proceso"       ,   
                       self.bline                   , mth) 
            self.__Log(syscall_post                 ,   
                       self.bline                   , mth)
            self.__Log(self.lines                   ,   
                       self.lines                   , mth)
      
            csys.runSys()

            syscode_post        = csys.getSysCode()
            str_syscode_post    = str(syscode_post)

            sysstr_post         = csys.getSysOutStr()


            self.__Log(self.dlines                  ,   
                       self.dlines                  , mth)            
            self.__Log("Resultado Post"             ,   
                       str_syscode_post             , mth) 
            self.__Log(self.lines                   ,   
                       self.lines                   , mth)

            self.__Log("Salida Post"                ,   
                       self.lines                   , mth)
            self.__Log(self.dlines                  ,   
                       self.dlines                  , mth)
            self.__Log(sysstr_post                  ,   
                       self.bline                   , mth)
            self.__Log(self.endlines                ,   
                       self.endlines                , mth)    

                
            if syscode_post == 0:
                #- Se ha comprimdo perfectamente. Borramos
                self.__Log("Post proceso correcto"  ,   
                           self.bline               , mth)
            else:
                self.__Log("Error en Post proceso"  ,   
                           self.bline               , mth)
                
        self.LogEndMethod(self.__cls)
        
    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

## df = "COManDO.dat"
## d  = "/brqx/arquitectura/unix/libs/python/primeur/oop/oo_post"
## p  = "/opt/scripts/caso_1.ksh"
## comp = ".ZIP"
## trg = ".trg"
## args = "argum1 argun2 argun3"

## op = PostProceso(df, d, p ,comp, trg)

## op.createCompressCommandGzip(df,"dat")

