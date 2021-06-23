//
//  TextFieldExtention.swift
//  dict
//
//  Created by Ekaterina Tarasova on 23.06.2021.
//

import UIKit

extension UITextField{
    func shakeAnimation() {
        let values = [-5, 5, -5, 5, -3, 3, -2, 2, 0]
        
        let translation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        translation.timingFunction = CAMediaTimingFunction(name: .linear) // defines the pacing of an animation
        translation.values = values
        layer.add(translation, forKey: "shakeIt")
    }
}
