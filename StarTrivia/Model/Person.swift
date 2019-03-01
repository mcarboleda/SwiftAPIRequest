//
//  Person.swift
//  StarTrivia
//
//  Created by Mc Clynrey Arboleda on 23/02/2019.
//  Copyright © 2019 Mc Clynrey Arboleda. All rights reserved.
//

import Foundation


struct Person : Codable {
    let name: String
    let height: String
    let mass: String
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let birth_year: String
    let gender: String
    let homeworldurl: String
    let films: [String]
    let species: [String]
    let vehicles: [String]
    let starships: [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hair_color
        case skin_color
        case eye_color
        case birth_year
        case gender
        case homeworldurl = "homeworld"
        case films
        case species
        case vehicles
        case starships
    }
}
