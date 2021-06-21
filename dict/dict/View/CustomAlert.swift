//
//  CustomAlert.swift
//  dict
//
//  Created by Ekaterina Tarasova on 16.04.2021.
//

import UIKit

class CustomAlert: UIView {
    @IBOutlet var alertTitle: UILabel!
    @IBOutlet var alertCancelBtn: UIButton!
    @IBOutlet var alertOkBtn: UIButton!
    @IBOutlet var alertbackground: UIView!
    @IBOutlet var alertField: UITextField!
    @IBOutlet var alertField2: UITextField!
    
    func set(title: String, quantity: Int) {
        alertTitle.text = title
        
        if quantity == 1 {
            alertField2.isHidden = true
            
            alertField.placeholder = "Name"
        }
    }
    
    var cornerRadius: CGFloat = 15.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        alertbackground.layer.cornerRadius = cornerRadius
    
        
    }
    @IBAction func cancel(_ sender: Any) {
        alertField.text = ""
    }
    
    @IBAction func addBtn(_ sender: Any) {
    }

}
