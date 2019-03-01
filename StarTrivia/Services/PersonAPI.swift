//
//  PersonAPI.swift
//  StarTrivia
//
//  Created by Mc Clynrey Arboleda on 22/02/2019.
//  Copyright © 2019 Mc Clynrey Arboleda. All rights reserved.
//

import Foundation


class PersonAPI {
    
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
//     -> Person
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
        
        return Person(name: name, height: height, mass: mass, hair_color: hair_color, skin_color: skin_color, eye_color: eye_color, birth_year: birth_year, gender: gender,homeworld: homeworld, films: films, species: species, vehicles: vehicles, starships: starships )
        
    }
    
    
}
