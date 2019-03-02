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

    
    @IBAction func randomClick(_ sender: Any) {
        generateRandomData()
    }
    
    func generateRandomData(){
        let ramdon = Int.random(in: 1 ... 87)
        
        api.getRandomPersonAlamofireSwiftyJsonCodable(id: ramdon) { (Person) in
            if let person = Person{
                self.setupView(person: person)
            }
        }
        
    }

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
    
    @IBAction func homeworldClick(_ sender: Any) {
        print("click")
        
    }
    
    @IBAction func vehicleClick(_ sender: Any) {
        print("click")
        
    }
    
    @IBAction func spaceshipClick(_ sender: Any) {
        print("click")
        
    }
    @IBAction func filmClick(_ sender: Any) {
        print("click")
        
    }
}



