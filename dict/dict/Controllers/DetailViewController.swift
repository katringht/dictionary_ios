//
//  DetailViewController.swift
//  dict
//
//  Created by Ekaterina Tarasova on 11.06.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    var label = "Label"
    var colorOfSeparator = UIColor.black
    private lazy var alertView: CustomAlert = {
        let alertView = Bundle.main.loadNibNamed("CustomAlert", owner: self, options: nil)?.first as? CustomAlert
        alertView?.set(title: "The word and translation ", quantity: 2)
        return alertView!
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryLabel.text = label
        categoryLabel.textColor = colorOfSeparator
        
        tableView.separatorColor = colorOfSeparator
        tableView?.dataSource = self
        tableView.delegate = self
        
        setupBlurEffect(view: view)
        
        alertView.bindToKeyboard()
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeGesture.direction = .right
        view.addGestureRecognizer(swipeGesture)
    }
    
// MARK: Gesture
    @objc func swipe(){
        navigationController?.popViewController(animated: true)
    }

// MARK: Alert
    
    func setAlert() {
        view.addSubview(alertView)
        alertView.center = view.center
        alertView.alertCancelBtn.addTarget(self, action: #selector(closeAlert), for: .touchUpInside)
        alertView.alertOkBtn.addTarget(self, action: #selector(addItem), for: .touchUpInside)
    }
    
    @objc func closeAlert() {
        alertView.removeFromSuperview()
        animationsOut(alert: alertView)
    }
    
    @objc func addItem(){
        var newItem = Translation(word: "n", tranlate: "n")
        guard let newWord = alertView.alertField.text, let newTransl = alertView.alertField2.text else {return}
        
        
        //не пришло в голову как убрать это нагромождение
        if newWord.isEmpty && newTransl.isEmpty {
            alertView.alertField.shakeAnimation()
            alertView.alertField2.shakeAnimation()
        } else if newWord.isEmpty{
            alertView.alertField.shakeAnimation()
        } else if newTransl.isEmpty{
            alertView.alertField2.shakeAnimation()
        } else {
            
            newItem.word = newWord
            newItem.tranlate = newTransl
            items.append(newItem)
            
            self.tableView.reloadData()
            alertView.removeFromSuperview()
            alertView.alertField.text = ""
            alertView.alertField2.text = ""
            alertView.alertTitle.textColor = .black
            
            animationsOut(alert: alertView)
            
        }
    }

// MARK: Buttons
    @IBAction func addItemsButton(_ sender: Any) {
        setAlert()
        animations(alert: alertView)
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: Table View Extension

extension UIViewController: UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordsCell") as! TableViewCell
        cell.setup(with: items[indexPath.row])
        cell.separatorVertical.backgroundColor = tableView.separatorColor
        
        let background = UIView()
        background.backgroundColor = tableView.separatorColor
        cell.selectedBackgroundView = background
        
        return cell
    }
    
}

extension UIViewController: UITableViewDelegate{

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let ac = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Delete", style: .destructive))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(ac, animated: true)
    }
    
}
