//
//  ViewController.swift
//  Is it Prime
//
//  Created by Harsh Khajuria on 20/03/19.
//  Copyright © 2019 horcrux2301. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    
    
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var primeResult: UILabel!
    
    @IBAction func checkPrimeButton(_ sender: Any) {
        if let userInputString = userInput.text{
            
            let userInputInteger = Int(userInputString)
            
            if let number = userInputInteger {
                
                var f = true
                
                if number == 1 {
                    f = false
                }
                
                for index in 2..<number{
                    if number % index == 0 {
                        f = false
                    }
                }
                
                if f{
                    primeResult.text = "\(number) is prime"
                } else {
                    primeResult.text = "\(number) is not prime"
                }
                
                
            } else {
                primeResult.text = "Enter a positive whole number"
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

