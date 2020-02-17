//
//  PageViewController.swift
//  PageController_twisted
//
//  Created by Mayurii Gajbhiye on 08/02/20.
//  Copyright © 2020 q. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {

    @IBOutlet weak var imgeViewContent: UIImageView!
    
     var displayText:String?
       
       var displayImg:UIImage?
       
       var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imgeViewContent.image  = displayImg
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
