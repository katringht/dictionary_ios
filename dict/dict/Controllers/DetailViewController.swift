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
    
    var currentCategory: Category?
    private var translate: [Translation] = []
    
    private lazy var alertView: CustomAlert = {
        let alertView = Bundle.main.loadNibNamed("CustomAlert", owner: self, options: nil)?.first as? CustomAlert
        alertView?.set(title: "The word and translation ", quantity: 2)
        return alertView!
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let cat = currentCategory {
            categoryLabel.text = cat.label?.uppercased()
            categoryLabel.textColor = cat.color
            tableView.separatorColor = cat.color
            
            translate = DataManager.shared.fetchTransl(category: cat)
            tableView.reloadData()
        }

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
            
            guard let cat = currentCategory else {
                print("category not set")
                return
            }
            let newItem = DataManager.shared.translate(word: newWord, translate: newTransl, category: cat)
            translate.append(newItem)
            self.tableView.reloadData()
            DataManager.shared.save()
            
            alertView.removeFromSuperview()
            alertView.alertField.text = ""
            alertView.alertField2.text = ""
            
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

extension DetailViewController: UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return translate.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordsCell") as! TableViewCell
        cell.setup(with: translate[indexPath.row])
        cell.separatorVertical.backgroundColor = tableView.separatorColor
        
        let background = UIView()
        background.backgroundColor = tableView.separatorColor
        cell.selectedBackgroundView = background
        
        return cell
    }
    
}

extension DetailViewController: UITableViewDelegate{

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let ac = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Delete", style: .destructive))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(ac, animated: true)
    }
    
}
