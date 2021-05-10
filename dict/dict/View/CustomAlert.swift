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
    
    
    @IBOutlet var greenAlertBtn: UIButton!
    @IBOutlet var purpleAlertBtn: UIButton!
    @IBOutlet var pinkAlertBtn: UIButton!
    @IBOutlet var orangeAlertBtn: UIButton!
    @IBOutlet var blackAlertBtn: UIButton!
    
    func set(title: String) {
        alertTitle.text = title
    }
    
    var cornerRadius: CGFloat = 15.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        alertbackground.layer.cornerRadius = cornerRadius
        
        greenAlertBtn.selectedButtonStyle()
        purpleAlertBtn.deselectedButtonStyle()
        pinkAlertBtn.deselectedButtonStyle()
        orangeAlertBtn.deselectedButtonStyle()
        blackAlertBtn.deselectedButtonStyle()
        
    }
    @IBAction func cancel(_ sender: Any) {
    }
    
    @IBAction func addBtn(_ sender: Any) {
        
    }
}
