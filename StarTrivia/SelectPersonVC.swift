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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateRandomData()
    }

    
    @IBAction func randomClick(_ sender: Any) {
        generateRandomData()
    }
    
    func generateRandomData(){
        let ramdon = Int.random(in: 1 ... 87)
        
        api.getRandomPersonURLSession(id: ramdon) { (Person) in
            if let person = Person{
                print("sdfsdf"+person.name)
                
                self.nameLbl.text = person.name
                self.height.text = person.height
                self.mass.text = person.mass
                self.hair.text = person.hair_color
                self.birthdate.text = person.birth_year
                self.gender.text = person.gender
            }
        }
        
    }

}
sige po, akapin mo nalang yong gamit mo para safe mamaya may pumasok taz kunin habang d pa umaalis bus hehe 
