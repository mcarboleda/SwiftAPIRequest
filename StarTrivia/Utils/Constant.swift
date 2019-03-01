//
//  Constant.swift
//  StarTrivia
//
//  Created by Mc Clynrey Arboleda on 20/02/2019.
//  Copyright © 2019 Mc Clynrey Arboleda. All rights reserved.
//

import UIKit



let BlackBG =  UIColor.black.withAlphaComponent(0.6).cgColor

let URL_BASE = "https://swapi.co/api/"
let PERSON_URL = URL_BASE + "people/"


typealias PersonResponseCompletion = (Person?) -> Void
