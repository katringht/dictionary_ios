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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.navBar.topItem?.title = "My dictionary"
        
        
        let navTitleFont = UIFont(name: "Courier New", size: 25)
        self.navBar.titleTextAttributes = [NSAttributedString.Key.font: navTitleFont as Any, NSAttributedString.Key.foregroundColor: UIColor.black]
        
        navBar.barTintColor =  .white
    }
    
    
    @IBAction func rightBarBtn(_ sender: Any) {
        print("tapped")
//        let ac = UIAlertController(title: "Add category", message: nil, preferredStyle: .alert)
//        ac.addTextField()
//
//        ac.addAction(UIAlertAction(title: "OK", style: .default))
//        present(ac, animated: true)
        let new = Category(label: "new", color: (UIColor(named: "Color1"))!)
        caterories.append(new)
        let indexPath = IndexPath(item: caterories.count - 1, section: 0)
        collectionView.insertItems(at: [indexPath])
        collectionView.reloadData()
        
        
    }
}

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

//extension UIViewController: UICollectionViewDelegateFlowLayout{
//    
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let collectionViewCellSize = collectionView.frame.size.width / 2
//
//        return CGSize(width: collectionViewCellSize, height: collectionViewCellSize)
//    }
//    
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
//    }
//
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//    }
//    
//    
//}

