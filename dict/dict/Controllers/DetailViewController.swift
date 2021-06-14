//
//  DetailViewController.swift
//  dict
//
//  Created by Ekaterina Tarasova on 11.06.2021.
//

import UIKit

var test: [String] = ["sssssssssss", "HHHH djdjdkskdnckjnc sdjncknc nkcanjkc"]

class DetailViewController: UIViewController {

    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    var label = "Label"
    var colorOfSeparator = UIColor.black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryLabel.text = label
        categoryLabel.textColor = colorOfSeparator
        
        tableView.separatorColor = colorOfSeparator
        tableView?.dataSource = self
    }

    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension UIViewController: UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return test.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordsCell") as! TableViewCell
        cell.englishWordLabel.text = test[indexPath.row]
        cell.separatorVertical.backgroundColor = tableView.separatorColor
        return cell
    }
    
    
}
