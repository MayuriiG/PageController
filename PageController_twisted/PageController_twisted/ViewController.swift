//
//  ViewController.swift
//  PageController_twisted
//
//  Created by Mayurii Gajbhiye on 08/02/20.
//  Copyright © 2020 q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewContent: UIView!
 
 
//     //  let dataSource = ["Meri Moti","Babuu","Shonaa","Meri Januuu"]

    let dataSource:[UIImage] = [#imageLiteral(resourceName: "allu01"),#imageLiteral(resourceName: "allu02") ,#imageLiteral(resourceName: "aalu0678"),#imageLiteral(resourceName: "allu0019"),#imageLiteral(resourceName: "allu05"), #imageLiteral(resourceName: "allu099") ,#imageLiteral(resourceName: "allu07") ,#imageLiteral(resourceName: "allu0987") ,#imageLiteral(resourceName: "allu034"),#imageLiteral(resourceName: "allu0018"),#imageLiteral(resourceName: "allu089") ]

    
    var currentVCIndex = 0
    
    override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
   
      cofigureViewController()
    
    }
    func cofigureViewController(){

        
        
            guard let pageViewController = storyboard?.instantiateViewController(identifier: "CustomizePageViewController") as? CustomizePageViewController
                
                
           else {return}

        pageViewController.delegate = self as! UIPageViewControllerDelegate
        pageViewController.dataSource = self as! UIPageViewControllerDataSource


            addChild(pageViewController)
          pageViewController.didMove(toParent: self)


        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false

            viewContent.addSubview(pageViewController.view)

            let views:[String:Any] = ["pageView": pageViewController.view]


    viewContent.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[pageView]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views))


    viewContent.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[pageView]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views))


              
    guard let startingViewController = detailViewControllerAt(index:currentVCIndex) else {return}

    pageViewController.setViewControllers([startingViewController], direction: .reverse, animated: true)
         
    }
            
            
            
    func detailViewControllerAt(index:Int) -> PageViewController? {
            
    if index >= dataSource.count || dataSource.count == 0 {


        return nil
        
        }

    guard let dataViewController = storyboard?.instantiateViewController(identifier: "PageViewController") as? PageViewController else { return nil }
                
        dataViewController.index = index
        dataViewController.displayImg = dataSource[index]
                
            
        return dataViewController
         
    }

        }

extension ViewController:UIPageViewControllerDelegate,UIPageViewControllerDataSource {

          func presentationIndex(for pageViewController: UIPageViewController) -> Int {
               return currentVCIndex
                }


          func presentationCount(for pageViewController: UIPageViewController) -> Int {
                   return dataSource.count
                }


           func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    
    
                     print("before")
            
    let dataVC = viewController as? PageViewController
    
    
    guard var currentIndex = dataVC?.index else {
        
        return nil
    }
    
    currentVCIndex = currentIndex
    
    
    if currentIndex == 0 {
        
        return nil
        
    }
    
    currentIndex -= 1
    
    
    return detailViewControllerAt(index: currentIndex)
    
    
    
}


func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    
    
      print("after")
    let dataVC = viewController as? PageViewController
           
    guard var currentIndex = dataVC?.index else {
               
    return nil
   
    }
           
    
    
    if currentIndex == dataSource.count {
        
        return nil
    }
    
    
    currentIndex += 1
    
    currentVCIndex = currentIndex
    
    return detailViewControllerAt(index: currentIndex)
    
}
}
