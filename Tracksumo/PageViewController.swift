//
//  PageViewController.swift
//  Tracksumo
//
//  Created by Krystian Gontarek on 16/12/2016.
//  Copyright © 2016 Kreskow&Karrmarr DevHeroes. All rights reserved.
//

import UIKit
protocol Pageable {
    var pageIndex : Int {get}
}

class PageViewController: UIPageViewController {
    
    fileprivate var pages : [UIViewController] = []
    fileprivate var currentPage : Int = 1
    
    override func viewDidLoad() {
     
        loadPages()
        self.dataSource = self
        self.setViewControllers([pages[currentPage]], direction: .forward, animated: true, completion: nil)
        
    }
    
    private func loadPages() {
        
        pages.append(self.storyboard!.instantiateViewController(withIdentifier: "SettingsViewController"))
        pages.append(self.storyboard!.instantiateViewController(withIdentifier: "MainViewController"))
        pages.append(self.storyboard!.instantiateViewController(withIdentifier: "StatisticsViewController"))

    }

}

extension PageViewController : UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let vc = viewController as? Pageable {
            if vc.pageIndex == 0 {
                return nil
            } else {
                return self.pages[vc.pageIndex - 1]
            }
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let vc = viewController as? Pageable {
            if vc.pageIndex == 2 {
                return nil
            } else {
                return self.pages[vc.pageIndex + 1]
            }
        }
        
        return nil
    }
    
}
