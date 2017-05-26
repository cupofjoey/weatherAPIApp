//
//  ViewController.swift
//  apiDemo
//
//  Created by BishopHill on 5/25/17.
//  Copyright © 2017 Dumb Unicorn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "http://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=aea7376e6321aec5c7e62c6ece86caa8")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                
                print(error)
                
            } else {
                
                if let urlContent = data {
                    
                    do {
                        
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        print(jsonResult)
                        
                        print(jsonResult["name"])
                        
                        if let description = ((jsonResult["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
                            
                            print(description)
                            
                            }
                        
                        } catch {
                        
                       print("JSON Processing Failed")
                            
                        }
                        
                    }
                        
                }
                    
            }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// API Key = aea7376e6321aec5c7e62c6ece86caa8
