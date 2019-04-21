//
//  ViewController.swift
//  Animation
//
//  Created by Harsh Khajuria on 19/04/19.
//  Copyright © 2019 horcrux2301. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func fadeIn(_ sender: Any) {
        image.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            self.image.alpha = 1
        })
    }
    
    @IBAction func slideIn(_ sender: Any) {
        image.center = CGPoint(x: image.center.x-500, y: image.center.y)
        UIView.animate(withDuration: 2, animations: {
            self.image.center = CGPoint(x: self.image.center.x+500, y: self.image.center.y)
        })
    }
    
    @IBAction func grow(_ sender: Any) {
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        UIView.animate(withDuration: 2, animations: {
            self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        })
    }
    
    var current = 0
    var isAnimating = false
    
    var timer = Timer()
    
    @objc func animate(){
        current = current+1
        current%=6
        image.image = UIImage(named: "frame_0\(current)_delay-0.1s.jpg")
    }
    
    @IBAction func nextImage(_ sender: Any) {
        if isAnimating {
            timer.invalidate()
            button.setTitle("Start animation", for: [])
            isAnimating=false
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            button.setTitle("Stop Animation", for: [])
            isAnimating=true
        }
    }
    
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

