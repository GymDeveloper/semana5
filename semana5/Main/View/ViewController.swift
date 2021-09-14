//
//  ViewController.swift
//  semana5
//
//  Created by Linder Hassinger on 14/09/21.
//

import UIKit

class ViewController: UIViewController {

    // Ahora vamos a ver como mostrar la informacion que acabamos de consumir
    
    // Hay que instanciar a nuestro ViewModelHistory
    var viewModelHistory = ViewModelHistoryPost()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Esta funcion se encarga de activar la peticion
        configureView()
        // Esta funciones ejecutra a refreshData para poder obtener la data que se guardo en la variable dataArrayHistoryPost
        bind()
        // Prindata itera al arregle dataArrayHistoryPost para poder leer cada valor00
        printData()
    }
    
    func configureView() {
        // aca ejecuta la funcion que hace el llamado al urlAPI
        viewModelHistory.getDataHistoryPost()
    }
    
    func printData() {
        for post in viewModelHistory.dataArrayHistoryPost {
            print("Title: \(post.title)")
            print("Body: \(post.body)")
            print("UserId: \(post.userId)")
            print("Id: \(post.id)")
        }
    }
    
    func bind() {
        viewModelHistory.refreshData = { [weak self] () in
            DispatchQueue.main.async {
//                self?.viewModelHistory.getDataHistoryPost()
                self?.printData()
            }
        }
    }

}

