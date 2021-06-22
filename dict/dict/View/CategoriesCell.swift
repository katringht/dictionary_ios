//
//  CategoriesCell.swift
//  dict
//
//  Created by Ekaterina Tarasova on 11.04.2021.
//

import UIKit

class CategoriesCell: UICollectionViewCell {
    @IBOutlet var label: UILabel!
    @IBOutlet var cell: UIView!
    
    func setup(with cat: Category) {
        label.text = cat.label
        cell.backgroundColor = cat.color
        
    }
    
    var cornerRadius: CGFloat = 15.0
    
    override func awakeFromNib() {
        super.awakeFromNib()

        contentView.layer.cornerRadius = cornerRadius
        contentView.layer.masksToBounds = true

        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false

        layer.shadowRadius = 3.0
        layer.shadowOpacity = 0.16
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Improve scrolling performance with an explicit shadowPath
        layer.shadowPath = UIBezierPath(
            roundedRect: bounds,
            cornerRadius: cornerRadius
        ).cgPath
    }
    
    @IBAction func changeBtn(_ sender: Any) {
    }
    
}
