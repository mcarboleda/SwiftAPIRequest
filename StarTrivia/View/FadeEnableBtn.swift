//
//  FadeEnableBtn.swift
//  StarTrivia
//
//  Created by Mc Clynrey Arboleda on 03/03/2019.
//  Copyright © 2019 Mc Clynrey Arboleda. All rights reserved.
//

import UIKit


class FadeEnableBtn: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.4) {
                    self.alpha = 1.0
                }
            }else{
                UIView.animate(withDuration: 0.4) {
                    self.alpha = 0.4
                }
            }
        }
    }
    
}

