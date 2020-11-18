//
//    Modelo.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Modelo : NSObject, NSCoding{

    var codigo : Int!
    var nome : String!
    var anos : [Ano]!
    var modelos : [Modelo]!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        codigo = dictionary["codigo"] as? Int
        nome = dictionary["nome"] as? String
        anos = [Ano]()
        if let anosArray = dictionary["anos"] as? [[String:Any]]{
            for dic in anosArray{
                let value = Ano(fromDictionary: dic)
                anos.append(value)
            }
        }
        modelos = [Modelo]()
        if let modelosArray = dictionary["modelos"] as? [[String:Any]]{
            for dic in modelosArray{
                let value = Modelo(fromDictionary: dic)
                modelos.append(value)
            }
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if codigo != nil{
            dictionary["codigo"] = codigo
        }
        if nome != nil{
            dictionary["nome"] = nome
        }
        if anos != nil{
            var dictionaryElements = [[String:Any]]()
            for anosElement in anos {
                dictionaryElements.append(anosElement.toDictionary())
            }
            dictionary["anos"] = dictionaryElements
        }
        if modelos != nil{
            var dictionaryElements = [[String:Any]]()
            for modelosElement in modelos {
                dictionaryElements.append(modelosElement.toDictionary())
            }
            dictionary["modelos"] = dictionaryElements
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         codigo = aDecoder.decodeObject(forKey: "codigo") as? Int
         nome = aDecoder.decodeObject(forKey: "nome") as? String
         anos = aDecoder.decodeObject(forKey :"anos") as? [Ano]
         modelos = aDecoder.decodeObject(forKey :"modelos") as? [Modelo]

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if codigo != nil{
            aCoder.encode(codigo, forKey: "codigo")
        }
        if nome != nil{
            aCoder.encode(nome, forKey: "nome")
        }
        if anos != nil{
            aCoder.encode(anos, forKey: "anos")
        }
        if modelos != nil{
            aCoder.encode(modelos, forKey: "modelos")
        }

    }

}



//
//    Ano.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Ano : NSObject, NSCoding{

    var codigo : String!
    var nome : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        codigo = dictionary["codigo"] as? String
        nome = dictionary["nome"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if codigo != nil{
            dictionary["codigo"] = codigo
        }
        if nome != nil{
            dictionary["nome"] = nome
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         codigo = aDecoder.decodeObject(forKey: "codigo") as? String
         nome = aDecoder.decodeObject(forKey: "nome") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if codigo != nil{
            aCoder.encode(codigo, forKey: "codigo")
        }
        if nome != nil{
            aCoder.encode(nome, forKey: "nome")
        }

    }

}
