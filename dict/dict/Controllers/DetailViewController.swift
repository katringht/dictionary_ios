//
//  DetailViewController.swift
//  dict
//
//  Created by Ekaterina Tarasova on 11.06.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var categoryLabel: UILabel!
    var label = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryLabel.text = label
    }


    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
