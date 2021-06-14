//
//  TableViewCell.swift
//  dict
//
//  Created by Ekaterina Tarasova on 14.06.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var englishWordLabel: UILabel!
    @IBOutlet var translateLabel: UILabel!
    @IBOutlet var separatorVertical: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
