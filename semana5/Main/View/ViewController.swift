//
//  ViewController.swift
//  semana5
//
//  Created by Linder Hassinger on 14/09/21.
//

import UIKit

// protocolos: UITableViewDelegate, UITableViewDataSource
// ademas UITableViewDataSource necesita minimo 2 funciones
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    // Ahora vamos a ver como mostrar la informacion que acabamos de consumir
    
    // Hay que instanciar a nuestro ViewModelHistory
    @IBOutlet weak var tableView: UITableView!
    
    var viewModelHistory = ViewModelHistoryPost()
    
    // Primero declare mi arreglo de nombres
    let names: [String] = ["Pepe", "Juan", "Lucas", "Sultano"]
    
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
        // Hice la vista se encargue del delegate y el datasource de mi table
        // al hacer esto autmaticamente me importo 2 protocolos
        tableView.delegate = self
        tableView.dataSource = self
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // por default UITableViewDataSource este necesita estas 2 funciones
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // ? numberOfRowsInSection
        // iba el count
        return names.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cellForRowAt
        // aca seteo la informacion
        // Busco a la celda con el id cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!

        // aca seteo la informacion dando el valor del arreglo como texto
        cell.textLabel?.text = names[indexPath.row]

        // retorno la lista
        return cell
    }

}

