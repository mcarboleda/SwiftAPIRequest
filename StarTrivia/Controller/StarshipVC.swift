//
//  StarshipVC.swift
//  StarTrivia
//
//  Created by Mc Clynrey Arboleda on 03/03/2019.
//  Copyright © 2019 Mc Clynrey Arboleda. All rights reserved.
//

import UIKit

class StarshipVC: UIViewController, PersonProtocol  {

    var person : Person!
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Person" + person.name)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
