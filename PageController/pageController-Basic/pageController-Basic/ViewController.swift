//
//  ViewController.swift
//  pageController-Basic
//
//  Created by Mayurii Gajbhiye on 06/01/20.
//  Copyright © 2020 q. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    
    
    @IBOutlet weak var pageContrler: UIPageControl!
    @IBOutlet weak var scrolView: UIScrollView!
    
    var imageArray = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
        loadImages()

pageContrler.addTarget(self, action: #selector(onPageControlChnge), for: UIControl.Event.valueChanged)

Timer.scheduledTimer(timeInterval: 6, target:self, selector: #selector(timer), userInfo: nil, repeats: true)
          // Do any additional setup after loading the view.
    }

    
    
    
    
    func loadImages(){
     
        
        imageArray = ["pokemon007","pokemon008","pokemon0011","pokemon0016","pokemon0018","pokemon0019","pokemon002","pokemon005"]
        
    for i in 0..<imageArray.count{
            
        let imagesObj = UIImageView()
        imagesObj.image = UIImage(named: imageArray[i])
           
        let xValue = i*450
       
        imagesObj.frame = CGRect(x: xValue, y: 0, width: 450, height: 400)
   scrolView.contentSize = CGSize(width: imageArray.count*450, height: 400)
        
        scrolView.isPagingEnabled = true
     
        scrolView.showsHorizontalScrollIndicator =  false
        scrolView.addSubview(imagesObj)
            
        }
        
        pageContrler.numberOfPages = imageArray.count
    }
    
    
    
    
    
    
    @objc func onPageControlChnge(){
        print(pageContrler.currentPage)
        
    scrolView.scrollRectToVisible(CGRect(x: pageContrler.currentPage*450, y:0 , width: 450, height: 300), animated: true)

    }
    

    
    @objc func timer (){
        print(pageContrler.currentPage)
      
        if(pageContrler.currentPage < Int(pageContrler.numberOfPages-1))
           {
            pageContrler.currentPage += 1
     
        }else{
            
            
            pageContrler.currentPage = 0
        }
    scrolView.scrollRectToVisible(CGRect(x: pageContrler.currentPage*450, y: 0, width: 450, height: 300), animated: true)
    }
    
}

