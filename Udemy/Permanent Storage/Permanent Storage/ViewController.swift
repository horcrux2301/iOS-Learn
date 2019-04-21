//
//  ViewController.swift
//  Permanent Storage
//
//  Created by Harsh Khajuria on 22/03/19.
//  Copyright © 2019 horcrux2301. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    @IBAction func phoneNumberSubmit(_ sender: Any) {
        UserDefaults.standard.set(phoneNumberField.text, forKey:"number")
    }
    
    override func viewDidLoad() {
        
        // UserDefaults.standard.set("Rob",forKey:"name")
        let nameObject = UserDefaults.standard.object(forKey:"name")
        if let name = nameObject as? String {
            print(name)
        }
        
        let arr = [1,2,3,4]
        // UserDefaults.standard.set(arr,forKey:"array")
        let arrObject = UserDefaults.standard.object(forKey:"array")
        if let array = arrObject as? NSArray{
            print(array)
        }
        
        let numberObject = UserDefaults.standard.object(forKey:"number")
        print(numberObject!)
        if let number = numberObject as? NSInteger {
            print(number)
            phoneNumberLabel.text = String(number)
        }
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

