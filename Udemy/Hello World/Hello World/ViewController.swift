//
//  ViewController.swift
//  Hello World
//
//  Created by Harsh Khajuria on 14/03/19.
//  Copyright © 2019 horcrux2301. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func buttonTapped(_ sender: Any) {
        label.text = textField.text
    }
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var nameViewField: UILabel!
    
    
    @IBAction func nameSubmitButton(_ sender: Any) {
        nameViewField.text = nameField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        // Do any additional setup after loading the view, typically from a nib.
    }
}

