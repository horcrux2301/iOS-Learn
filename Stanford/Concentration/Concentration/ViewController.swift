//
//  ViewController.swift
//  Concentration
//
//  Created by Harsh Khajuria on 21/04/19.
//  Copyright © 2019 horcrux2301. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flippedCount:Int = 0{
        didSet {
            flipCounter.text = "Flips: \(flippedCount)"
        }
    }
    
    var emojiChoices: Array<String> = ["👻","🎃","👻","🎃"]
    
    @IBOutlet weak var flipCounter: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flippedCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            print("card number = \(cardNumber)")
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("Chosen card wasn't in card buttons")
        }
    }
    
    func flipCard(withEmoji emoji:String, on button:UIButton){
        // print("flipcard(with: \(emoji))")
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

