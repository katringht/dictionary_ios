//
//  ViewController.swift
//  dict
//
//  Created by Ekaterina Tarasova on 09.04.2021.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    
    var pageControl = UIPageControl()
    
    lazy var orderedViewControllers: [UIViewController] = {
        return [self.newVC(viewController: "Orange"),
                self.newVC(viewController: "Pink")]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
        configurePageControl()
        
    }
    
    func newVC(viewController: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: viewController)
    }
    
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = orderedViewControllers.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.view.addSubview(pageControl)
    }
    
    //delegate methords
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.firstIndex(of: pageContentViewController)!
    }
    
    // data source functions.
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
                return nil
            }
            
            let previousIndex = viewControllerIndex - 1
            
            // User is on the first view controller and swiped left to loop to
            // the last view controller.
            guard previousIndex >= 0 else {
                return orderedViewControllers.last
                // Uncommment the line below, remove the line above if you don't want the page control to loop.
                // return nil
            }
            
            guard orderedViewControllers.count > previousIndex else {
                return nil
            }
            
            return orderedViewControllers[previousIndex]
        }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
                return nil
            }
            
            let nextIndex = viewControllerIndex + 1
            let orderedViewControllersCount = orderedViewControllers.count
            
            // User is on the last view controller and swiped right to loop to
            // the first view controller.
            guard orderedViewControllersCount != nextIndex else {
                return orderedViewControllers.first
                // Uncommment the line below, remove the line above if you don't want the page control to loop.
                // return nil
            }
            
            guard orderedViewControllersCount > nextIndex else {
                return nil
            }
            
            return orderedViewControllers[nextIndex]
        }
}

