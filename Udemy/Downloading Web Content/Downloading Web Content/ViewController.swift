//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Harsh Khajuria on 18/04/19.
//  Copyright © 2019 horcrux2301. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // let url = URL(string: "https://www.stackoverflow.com")!
        // webView.load(URLRequest(url: url))
        // webView.loadHTMLString("<h1>Hey hey</h1>", baseURL: nil)
        
        if let url = URL(string: "https://www.stackoverflow.com") {
            let request = NSMutableURLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request as URLRequest){
                data, response, error in
                if error != nil {
                    print(error)
                } else {
                    if let unwrappedData = data {
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        print(dataString)
                    }
                }
            }
            task.resume()
        }
        
    }


}

