//
//  ViewController.swift
//  Navigation Bar
//
//  Created by Harsh Khajuria on 21/03/19.
//  Copyright © 2019 horcrux2301. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    var time = 210
    
    @objc func decreaseTimer(){
        if time>0 {
            time -= 1
            timerLabel.text = String(time)
        } else {
            timer.invalidate()
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        time = 210
        timerLabel.text = String(time)
    }
    
    @IBAction func minusTen(_ sender: Any) {
        if time-10>0{
            time -= 10
            timerLabel.text = String(time)
        }
    }
    
    @IBAction func plusTen(_ sender: Any) {
        time += 10
        timerLabel.text = String(time)
    }
    
    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func play(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreaseTimer), userInfo: nil, repeats: true)
        
    }
    
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
}

