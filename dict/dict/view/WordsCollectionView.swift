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
    
    private lazy var alertView: CustomAlert = {
        let alertView = Bundle.main.loadNibNamed("CustomAlert", owner: self, options: nil)?.first as? CustomAlert
        return alertView!
    }()
    
    let blurEffect: UIVisualEffectView = {
        let blurEff = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blurEff)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.navBar.topItem?.title = "My dictionary"
        
        
        let navTitleFont = UIFont(name: "Courier New", size: 25)
        self.navBar.titleTextAttributes = [NSAttributedString.Key.font: navTitleFont as Any, NSAttributedString.Key.foregroundColor: UIColor.black]
        
        navBar.barTintColor =  .white
        
        setupBlurEffect()
    }

// MARK: Alert additions
    func setupBlurEffect() {
        view.addSubview(blurEffect)
        blurEffect.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        blurEffect.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        blurEffect.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        blurEffect.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        blurEffect.alpha = 0
    }
    
    func animations() {
        alertView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        alertView.alpha = 0
        
        UIView.animate(withDuration: 0.3) {
            self.blurEffect.alpha = 1
            self.alertView.alpha = 1
            self.alertView.transform = CGAffineTransform.identity
        }
    }
    
    func animationsOut() {
        UIView.animate(withDuration: 0.3) {
            self.blurEffect.alpha = 0
            self.alertView.alpha = 0
        } completion: { (_) in
            self.alertView.removeFromSuperview()
        }

    }
    
    func setAlert() {
        view.addSubview(alertView)
        alertView.center = view.center
        alertView.alertCancelBtn.addTarget(self, action: #selector(closeAlert), for: .touchUpInside)
        alertView.alertOkBtn.addTarget(self, action: #selector(addCategory), for: .touchUpInside)
    }
    
    @objc func closeAlert() {
        alertView.removeFromSuperview()
        animationsOut()
    }
    
    @objc func addCategory() {
        var new = Category(label: "new", color: (UIColor(named: "Color1"))!)
        guard let newLabel = alertView.alertField.text else {return}
        new.label = newLabel
        caterories.append(new)
        self.collectionView.reloadData()
        alertView.removeFromSuperview()
        
        animationsOut()
    }
    
// MARK: Buttons from view
    
    @IBAction func rightBarBtn(_ sender: Any) {
        print("tapped")
        setAlert()
        animations()
    }
}

// MARK: Collection View Extension

extension UIViewController: UICollectionViewDelegate{
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        print("u tapped me")
    }
}
extension UIViewController: UICollectionViewDataSource{
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoriesCell
        
        cell.setup(with: caterories[indexPath.row])
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return caterories.count
    }
}


