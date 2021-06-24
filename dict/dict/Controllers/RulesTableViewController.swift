//
//  RulesTableViewController.swift
//  dict
//
//  Created by Ekaterina Tarasova on 24.06.2021.
//

import UIKit

class RulesTableViewController: UITableViewController {
    
    let rules = ["1", "3", "2"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsSelection = false
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rules.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RulesCell", for: indexPath) as! RulesTableViewCell
        cell.ruleImage.image = UIImage(named: rules[indexPath.row])
        return cell
    }
}
