//
//  ModelosViewController.swift
//  Fipe_11_18
//
//  Created by Grazi Berti on 18/11/20.
//

import UIKit
import Alamofire

class ModelosViewController: UIViewController {

    var recebeCodigoModelo: String?
    var arrayModelos = [Modelo] ()
    @IBOutlet weak var tableViewModelos: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewModelos.delegate = self
        tableViewModelos.dataSource = self
        
        tableViewModelos.register(UINib(nibName: "MarcasTableViewCell", bundle: nil), forCellReuseIdentifier: "MarcasTableViewCell")
        
        loadDataAlamofire()
    }
    func reloadTable(newArray: [Modelo]) {
        self.arrayModelos = newArray
        self.tableViewModelos.reloadData()
    }
    func loadDataAlamofire() {
       
            AF.request("https://parallelum.com.br/fipe/api/v1/carros/marcas/\(recebeCodigoModelo!)/modelos").responseJSON { response in
                if let dictionary = response.value as? [String: Any] {
                    let modelos = Modelo(fromDictionary: dictionary)
                    var newArray = [Modelo] ()
    
                    for item in modelos.modelos{
                        
                        newArray.append(item)
                        print(item.nome!)
                    }
                    self.reloadTable(newArray: newArray)
                }
            }
    }

}


extension ModelosViewController: UITableViewDelegate {
    
}

extension ModelosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayModelos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarcasTableViewCell", for: indexPath) as! MarcasTableViewCell
        cell.setup(carro: arrayModelos[indexPath.row].nome)
        return cell
    }
    
    
}
