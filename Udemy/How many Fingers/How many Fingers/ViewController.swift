//
//  ViewController.swift
//  How many Fingers
//
//  Created by Harsh Khajuria on 20/03/19.
//  Copyright © 2019 horcrux2301. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var userGuess: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func guessSubmit(_ sender: Any) {
        let input = Int(userGuess.text!)
        //let random = Int.random(in: 1...10)
        let random = Int(arc4random_uniform(13))
        if input==random {
            messageLabel.text = "You are right!"
        } else {
            messageLabel.text = "Wrong! It was a " + String(random) + "."
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

