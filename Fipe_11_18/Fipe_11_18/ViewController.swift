//
//  ViewController.swift
//  Fipe_11_18
//
//  Created by Grazi Berti on 18/11/20.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    var arrayMarcas = [Marcas] ()
    
    @IBOutlet weak var tableViewFipe: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewFipe.delegate = self
        tableViewFipe.dataSource = self
        
        tableViewFipe.register(UINib(nibName: "MarcasTableViewCell", bundle: nil), forCellReuseIdentifier: "MarcasTableViewCell")
        
        loadDataAlamofire()
    }
    
    func reloadTable(newArray: [Marcas]) {
        self.arrayMarcas = newArray
        self.tableViewFipe.reloadData()
    }
    
    func loadDataAlamofire() {
            AF.request("https://parallelum.com.br/fipe/api/v1/carros/marcas").responseJSON { response in
                if let arrayDictionary = response.value as? [[String: Any]] {
    
                    var newArray = [Marcas] ()
    
                    for item in arrayDictionary{
                        let marcas = Marcas(fromDictionary: item)
                        newArray.append(marcas)
                        print(marcas.nome)
                    }
                    self.reloadTable(newArray: newArray)
                }
            }
        }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let modelo = UIStoryboard(name: "ModelosViewController", bundle: nil).instantiateInitialViewController() as? ModelosViewController {
            
            navigationController?.pushViewController(modelo, animated: true)
            modelo.recebeCodigoModelo = arrayMarcas[indexPath.row].codigo
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMarcas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarcasTableViewCell", for: indexPath) as! MarcasTableViewCell
        cell.setup(carro: arrayMarcas[indexPath.row].nome)
        return cell
    }
    
    
}
