//
//  BlackBgView.swift
//  StarTrivia
//
//  Created by Mc Clynrey Arboleda on 20/02/2019.
//  Copyright © 2019 Mc Clynrey Arboleda. All rights reserved.
//

import UIKit


class BlackBgView: UIView {
    
    
    override func awakeFromNib() {
        layer.backgroundColor = BlackBG
        layer.cornerRadius = 10
    }

    
}


class BlackBGButton: UIButton {
    override func awakeFromNib() {
        
        layer.backgroundColor = BlackBG
        layer.cornerRadius = 10
    }
    
}
