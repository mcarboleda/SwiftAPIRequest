//
//  PersonAPI.swift
//  StarTrivia
//
//  Created by Mc Clynrey Arboleda on 22/02/2019.
//  Copyright © 2019 Mc Clynrey Arboleda. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PersonAPI {
    
    //     -> API request using Alamofire, SwiftyJSON with Codable Object
    func getRandomPersonAlamofireSwiftyJsonCodable(id: Int, completion: @escaping PersonResponseCompletion) {
        
        guard let getPersonURL =  URL(string: "\(PERSON_URL)\(id)") else {return }
        
        AF.request(getPersonURL).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return completion(nil)}
            let jsonDecoder = JSONDecoder()
            do{
                let person = try jsonDecoder.decode(Person.self, from: data)
                DispatchQueue.main.async {
                    completion(person)
                }
            }catch{
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }

    //     -> API request using Alamofire and SwiftyJSON
    func getRandomPersonAlamofireSwiftyJson(id: Int, completion: @escaping PersonResponseCompletion) {
        
        guard let getPersonURL =  URL(string: "\(PERSON_URL)\(id)") else {return }
        
        AF.request(getPersonURL).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return completion(nil)}
            do{
                let json = try JSON(data: data)
                DispatchQueue.main.async {
                    let person = self.parsePersonSwiftyJson(json: json)
                    completion(person)
                }
            }catch{
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }

    //     -> API request using Alamofire
    func getRandomPersonAlamofire(id: Int, completion: @escaping PersonResponseCompletion) {

        guard let getPersonURL =  URL(string: "\(PERSON_URL)\(id)") else {return }

        AF.request(getPersonURL).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }

            guard let json = response.result.value as? [String: Any] else { return completion(nil)}

            let person = self.parsePersonManual(json: json)
            DispatchQueue.main.async {
                completion(person)
            }
        }
    }
    
    
    
    
    //     -> API request using URLSession
    func getRandomPersonURLSession(id: Int, completion: @escaping PersonResponseCompletion)  {
        
        guard let getPersonURL =  URL(string: "\(PERSON_URL)\(id)") else {return }
        
        let task = URLSession.shared.dataTask(with: getPersonURL) { (data, response, error) in
            
            guard error == nil else {
                debugPrint(error.debugDescription)
                completion(nil)
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonAny as? [String: Any] else { return }
                let person = self.parsePersonManual(json: json)
                
                DispatchQueue.main.async {
                    completion(person)
                }
//                return person
            }catch {
                debugPrint(error.localizedDescription)
                return
            }
        }
     
        task.resume()
        
    }
    
    
    
    //     -> Parsing json using SwiftyJson
    private func parsePersonSwiftyJson(json: JSON) -> Person{
        let name =  json["name"].stringValue
        let height = json["height"].stringValue
        let mass = json["mass"].stringValue
        let hair_color = json["hair_color"].stringValue
        let skin_color = json["skin_color"].stringValue
        let eye_color = json["eye_color"].stringValue
        let birth_year = json["birth_year"].stringValue
        let gender = json["gender"].stringValue
        let homeworld = json["homeworld"].stringValue
        let films = json["films"].arrayValue.map({$0.stringValue})
        let species = json["species"].arrayValue.map({$0.stringValue})
        let vehicles = json["vehicles"].arrayValue.map({$0.stringValue})
        let starships = json["starships"].arrayValue.map({$0.stringValue})
        
        return Person(name: name, height: height, mass: mass, hair_color: hair_color, skin_color: skin_color, eye_color: eye_color, birth_year: birth_year, gender: gender,homeworldurl: homeworld, films: films, species: species, vehicles: vehicles, starships: starships )
        
    }
    
//     -> Parsing json using manual method
    private func parsePersonManual(json: [String: Any] ) -> Person{
        let name =  json["name"] as? String ?? ""
        let height = json["height"] as? String ?? ""
        let mass = json["mass"] as? String ?? ""
        let hair_color = json["hair_color"] as? String ?? ""
        let skin_color = json["skin_color"] as? String ?? ""
        let eye_color = json["eye_color"] as? String ?? ""
        let birth_year = json["birth_year"] as? String ?? ""
        let gender = json["gender"] as? String ?? ""
        let homeworld = json["homeworld"] as? String ?? ""
        let films = json["films"]  as? [String] ?? [String]()
        let species = json["species"]  as? [String] ??  [String]()
        let vehicles = json["vehicles"]  as? [String] ??  [String]()
        let starships = json["starships"]  as? [String] ??  [String]()
        
        return Person(name: name, height: height, mass: mass, hair_color: hair_color, skin_color: skin_color, eye_color: eye_color, birth_year: birth_year, gender: gender,homeworldurl: homeworld, films: films, species: species, vehicles: vehicles, starships: starships )
        
    }
    
    
}
