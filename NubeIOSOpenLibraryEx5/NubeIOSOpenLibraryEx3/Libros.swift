//
//  Libros.swift
//  NubeIOSOpenLibraryEx3
//
//  Created by Marcos on 1/1/17.
//  Copyright © 2017 MSR. All rights reserved.
//

import Foundation
import UIKit

class LibroDto {
    
    var isbn = ""
    var titulo = ""
    var portada : UIImage?
    var autores = ""
    
    var lstAutores = Array<String>()
    
    init ( aIsbn : String , aTitulo : String){
        isbn = aIsbn
        titulo = aTitulo
        portada = nil
        autores=""
        lstAutores=Array<String>()
    }
    
    init () {
        
    }
}

class ListaIsbn {
    
    //
    //var libros = Array<Array<String>>()
    
    var libros = Array<LibroDto>()
    
    init() {
        //<#statements#>
    }
    
}

func existeIsbnInList( isbnToFind : String , aListaLibros : Array<LibroDto> ) -> Bool {
    let tam = aListaLibros.count
    if (tam > 0){
        for i in 1...tam {
            
            if (aListaLibros[i-1].isbn == isbnToFind){
                return true
            }
        }
    }
    return false
    
}
