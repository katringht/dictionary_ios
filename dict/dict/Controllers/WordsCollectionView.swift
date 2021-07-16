//
//  WordCells.swift
//  dict
//
//  Created by Ekaterina Tarasova on 11.04.2021.
//

import UIKit



class WordsCollectionView: UIViewController {
    
    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var backgroundOfEmptyView: UILabel!
    
    var categories: [Category] = []
    
    private lazy var alertView: CustomAlert = {
        let alertView = Bundle.main.loadNibNamed("CustomAlert", owner: self, options: nil)?.first as? CustomAlert
        alertView?.set(title: "Add category", quantity: 1)
        return alertView!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        
        categories = DataManager.shared.fetchRequest()
        collectionView.reloadData()
        
        self.navBar.topItem?.title = "My dictionary"
        
        let navTitleFont = UIFont(name: "Courier New", size: 25)
        self.navBar.titleTextAttributes = [NSAttributedString.Key.font: navTitleFont as Any, NSAttributedString.Key.foregroundColor: UIColor.black]
        
        navBar.barTintColor =  .white
        
        alertView.bindToKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupBlurEffect(view: view)
    }
        
    // MARK: Alert additions
    func setAlert() {
        view.addSubview(alertView)
        alertView.center = view.center
        alertView.alertCancelBtn.addTarget(self, action: #selector(closeAlert), for: .touchUpInside)
        alertView.alertOkBtn.addTarget(self, action: #selector(addCategory), for: .touchUpInside)
    }
    
    @objc func closeAlert() {
        alertView.removeFromSuperview()
        animationsOut(alert: alertView)
    }
    
    @objc func addCategory() {
        guard let newLabel = alertView.alertField.text else {return}
        
        if newLabel.isEmpty {
            alertView.alertField.shakeAnimation()
        } else {
            let category = DataManager.shared.category(title: newLabel, color: (UIColor(named: "Pink"))!)
            for index in 0..<categories.count {
                if index % 2 == 0 {
                    if index % 4 == 0 {
                        category.color = (UIColor(named: "Yellow"))!
                    }
                    else {
                        category.color = (UIColor(named: "Purple"))!
                    }
                }
                else if index % 3 == 0{
                    category.color = (UIColor(named: "Pink"))!
                }
                else {
                    category.color = (UIColor(named: "Blue"))!
                }
            }
            categories.append(category)
            self.collectionView.reloadData()
            alertView.removeFromSuperview()
            DataManager.shared.save()
            
            alertView.alertField.text = ""
            animationsOut(alert: alertView)
        }
    }
    
    // MARK: Buttons from view
    @IBAction func rightBarBtn(_ sender: Any) {
        print("tapped")
        setAlert()
        animations(alert: alertView)
    }
    
    // MARK: StoryboardSegue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is DetailViewController {
            if let vc = segue.destination as? DetailViewController{
                if let path = collectionView?.indexPathsForSelectedItems {
                    let category = categories[path[0].row]
                    vc.currentCategory = category
                }
            }
        }
    }
    
// MARK: Edit categories
    @objc func editCategory(sender: UIButton){
        
        let ac = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Delete", style: .destructive) { [weak self] _ in
            self?.deleteCategory(sender: sender)
        })
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(ac, animated: true)
    }
    
    func deleteCategory(sender: UIButton) {
        let i = sender.tag
        let category = categories[i]
        
        let context = DataManager.shared.persistentContainer.viewContext
        context.delete(category)
        collectionView.reloadData()
        do {
            try context.save()
            categories.remove(at: i)
        }
        catch {
            print("error")
        }
    }
}

// MARK: Collection View Extension

extension WordsCollectionView: UICollectionViewDataSource{
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoriesCell
        let cat = categories[indexPath.row]
        cell.setup(with: cat)
        
        cell.editButton.tag = indexPath.row
        cell.editButton.addTarget(self, action: #selector(editCategory), for: .touchUpInside)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if categories.isEmpty {
            collectionView.isHidden = true
        } else {
            collectionView.isHidden = false
        }
        return categories.count
    }
}
