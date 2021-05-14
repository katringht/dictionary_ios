//
//  ButtonExtention.swift
//  dict
//
//  Created by Ekaterina Tarasova on 10.05.2021.
//

import UIKit

extension UIButton {
    
    func selectedButtonStyle() {
        self.layer.borderWidth = 5
        self.layer.borderColor = UIColor.systemGray.cgColor
        self.layer.cornerRadius = 15
    }
    
    func deselectedButtonStyle() {
        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 15
    }
}
