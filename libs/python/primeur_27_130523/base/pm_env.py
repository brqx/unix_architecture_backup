#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
Created on Wed Apr 17 12:39:47 2013

@author: Ricardo Cabello
"""
#-- Clase operaciones de sistema
#--- Gestion de variables de entorno

import os

def ckall_ent(*params):
    """ Comprueba si estan definidas todas las variable de entorno.
        Devuelve:    
        0 : Definidas
        1 : Alguna no esta definida
        2 : Alguna esta definida pero no inicializada
    """    
    existen = 0    
        
    for i in params:
        valor_variable= os.getenv('RRR','None')
                
        if valor_variable is 'None':           
            existen = 1                
            
        if valor_variable == '':
            existen = 2
                
    return existen


def ck_ent(params):
    """ Comprueba si estan definidas la variable de entorno indicada.
        Devuelve:    
        0 : Definida
        1 : No esta definida
        2 : No esta inicializada
    """
    existen = 0    
        
    for i in params:
        valor_variable= os.getenv('RRR','None')
                
        if valor_variable is 'None':           
            existen = 1                
            
        if valor_variable == '':
            existen = 2
                
    return existen


def st_ent(param, valor):
    """ Comprueba si estan definidas las variable de entorno.
        y si no lo estan las define.
    """    
    if ck_ent(param) > 0 :
        os.putenv(param, valor)
    
    return 0
