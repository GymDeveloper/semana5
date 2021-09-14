//
//  ViewModelHistoryPost.swift
//  semana5
//
//  Created by Linder Hassinger on 14/09/21.
//

import Foundation

class ViewModelHistoryPost {
    
    // Aca voy a cosumir un API
    // url: https://jsonplaceholder.typicode.com/posts
    let urlAPI = "https://jsonplaceholder.typicode.com/posts"
     
    // Necesito una funcion que se encargue de hacerle un refresh a la data
    
    var refreshData = {
        () -> () in
    }
    
    // funcion que se encargue de guarda la data en un array
    var dataArrayHistoryPost : [HistoryPost] = [] {
        didSet {
            refreshData()
        }
    }
    
    // funcuin que se encargue de hacer la peticion de la url y ademas haga la
    // serializacion de los datos segun el modelo
    // cada vez que hagamos la peticion hay que limpiar el arreglo anterior
    // serializacion: Parsear la data del API con nuestro modelo
    func getDataHistoryPost() {
        // urlAPI para swift es un stringm, por ende yo debo convertir esta string
        // a URL
        
        // Aca la clase URL recibe un string el cual convierte a una URL
        // para evitar problemas a futuro yo debo validar que la url sea correct
        // guard let
        // En caso la url sea nil el guard hara que mi funcion terminte (por el return)
        guard let url = URL(string: urlAPI) else { return }
        
        // Ahora yo debo consumir la información que devuel el API
        // URLSession, la cual permite crear una conexion entre mi app y API
        
        // Esto abre el enlace entre mi app y el API
        // me devuel 3 cosas (data, response, error
        // data => Esta la informacion
        // response => La informacion del request
        // error => O no es nulo es caso ocurra algo y devuelve un mensaje de error
        
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            // dentro de data tengo la informacion del API
            // para poder leer data: String tengo que convertirlo a un JSON
            
            // valido que data no sea nil
            guard let dataJSON = data else { return }
            
            // Me toca formatear data a un JSON
            // Em swift JSONDecoder()
            
            // Este do catch es el equivalente try catch
            do {
                // En caso todo este ok aca debo hacer la serializacion
                let decoder = JSONDecoder()
                // ahora quiero guardar la informacion de data en dataArrayHistoryPost
                
                // aca le decimos que nuestro dataArrayHistoryPost es igual al decode de la data que de dataJSON esto haria que la data que vino de mi API ahora se encuentre en mi variable dataArrayHistoryPost
                
                /* decoder recibe dos cosas
                 * 1) El modelo
                 * 2) Desde donde viene la data
                 */
              
                self.dataArrayHistoryPost = try decoder.decode([HistoryPost].self, from: dataJSON)
            
            } catch let error as NSError {
                // NSError es una clase de Swift la cual contiene la prevencion de
                // errores
                print(error.localizedDescription)
            }
            // Para indicar que esto es el fin de mi peticion debo poner .resume()
        }.resume()
    }
    
}
