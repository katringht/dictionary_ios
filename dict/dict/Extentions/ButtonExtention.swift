//
//  ButtonExtention.swift
//  dict
//
//  Created by Ekaterina Tarasova on 10.05.2021.
//

import UIKit

extension UIButton {
    
    func selectedButtonStyle() {
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.cornerRadius = 5
    }
    
    func deselectedButtonStyle() {
//        self.layer.borderWidth = 1
//        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 5
    }
}
