//
//  ViewController.swift
//  Cat Years
//
//  Created by Harsh Khajuria on 15/03/19.
//  Copyright © 2019 horcrux2301. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ageInput: UITextField!
    @IBOutlet weak var ageOutput: UILabel!
    
    @IBAction func calculateAge(_ sender: Any) {
        let tempAgeAnswer = Int(ageInput.text!)! * 7
        ageOutput.text = String(tempAgeAnswer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

