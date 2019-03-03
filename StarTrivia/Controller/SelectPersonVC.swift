//
//  ViewController.swift
//  StarTrivia
//
//  Created by Mc Clynrey Arboleda on 20/02/2019.
//  Copyright © 2019 Mc Clynrey Arboleda. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {
    
    var  api = PersonAPI()
    var person: Person!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var mass: UILabel!
    @IBOutlet weak var hair: UILabel!
    @IBOutlet weak var birthdate: UILabel!
    @IBOutlet weak var gender: UILabel!
    
    @IBOutlet weak var homeworldBtn: UIButton!
    @IBOutlet weak var vihecleBtn: UIButton!
    @IBOutlet weak var spaceshipBtn: UIButton!
    @IBOutlet weak var fildBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomData()
    }

    @IBAction func randomPersonClick(_ sender: Any) {
        generateRandomData()
    }
    
    func generateRandomData(){
        let ramdon = Int.random(in: 1 ... 87)
        
        api.getRandomPersonAlamofireSwiftyJsonCodable(id: ramdon) { (Person) in
            if let person = Person{
                self.setupView(person: person)
                self.person =  person
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if var destination =  segue.destination as? PersonProtocol {
            destination.person = person
        }
        
// Long process
//        switch segue.identifier {
//        case Segue.homeworld.rawValue:
//            if let destination = segue.destination as? HomeworldVCViewController {
//                destination.person = person
//            }
//        case Segue.vehicle.rawValue:
//            if let destination = segue.destination as? VehicleVC {
//                destination.person = person
//            }
//        case Segue.starship.rawValue:
//            if let destination = segue.destination as? StarshipVC {
//                destination.person = person
//            }
//        case Segue.films.rawValue:
//            if let destination = segue.destination as? FilmVC {
//                destination.person = person
//            }
//        default:
//            break
//        }
    }
    
//    enum Segue: String {
//        case homeworld = "toHomeworld"
//        case vehicle = "toVehicle"
//        case starship = "toStarship"
//        case films = "toFilms"
//    }

    func setupView(person: Person){
        self.nameLbl.text = person.name
        self.height.text = person.height
        self.mass.text = person.mass
        self.hair.text = person.hair_color
        self.birthdate.text = person.birth_year
        self.gender.text = person.gender
        
        homeworldBtn.isEnabled = !person.homeworldurl.isEmpty
        vihecleBtn.isEnabled = !person.vehicles.isEmpty
        spaceshipBtn.isEnabled = !person.starships.isEmpty
        fildBtn.isEnabled = !person.films.isEmpty
    }
}

protocol PersonProtocol {
    var person: Person! {get set}
}
