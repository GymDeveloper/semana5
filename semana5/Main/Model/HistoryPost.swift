//
//  HistoryPost.swift
//  semana5
//
//  Created by Linder Hassinger on 14/09/21.
//

import Foundation

// Mark - Esto sera la clase la cual contenga el modelo de datos del mi aplicacion
// Recordemos que el modelo estabaso en mi API
// url: https://jsonplaceholder.typicode.com/posts

// Codable: Permite que nuestra clase no tega la necesidad de ser inicializada
class HistoryPost: Codable {
    
    // Ojo: Recuerden que los nombres de las variables deben ser iguales que el API
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
}
