//
//  ViewController.swift
//  page_Controller
//
//  Created by Mayurii Gajbhiye on 13/12/19.
//  Copyright © 2019 q. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIScrollViewDelegate{

    
    @IBOutlet weak var pageControler: UIPageControl!
    
    @IBOutlet weak var scrolView: UIScrollView!
   
    var fetchedData:[Movie]!
    
    var buttonValue:UIButton!
    var labelValue:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
        scrolView.delegate = self
    }

    // func returning the value
    func dataFromServer () -> [Movie]{
           var convertedData:[Movie]!
        
        
     // Coverting String into url
var URLReqObj = URLRequest(url: URL(string: "https:www.brninfotech.com/tws/MovieDetails2.php?mediaType=movies")!)
    URLReqObj.httpMethod = "GET"

      // Fetching the data using url session datatask
var dataTaskObj = URLSession.shared.dataTask(with: URLReqObj) { (data, response, error) in
            print("Got data from server")
do
   {
    var decoder = JSONDecoder()
     convertedData = try decoder.decode([Movie].self, from: data!)
        
    print(convertedData.count)
    } catch {
            
        print("something went wrong")
            
        }
    }
    dataTaskObj.resume()
    while convertedData == nil {
    }
        
    return convertedData
     }
    
    
    
    
    
    
    
        
    @objc func buttonClicked(sender:UIButton)
    {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SVC") as! SecondViewController
           //  nextVC.serverData = self.fetchedData
           //  nextVC.serverTag = sender.tag
              print(next)
            present(nextVC, animated: true) {
            
        
        }
 }

}
