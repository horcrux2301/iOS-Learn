//
//  ViewController.swift
//  Concentration
//
//  Created by Harsh Khajuria on 21/04/19.
//  Copyright © 2019 horcrux2301. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game:Concetration = Concetration(numberOfPairsOfCards: (cardButtons.count+1) / 2)
    
    var flippedCount:Int = 0{
        didSet {
            flipCounter.text = "Flips: \(flippedCount)"
        }
    }

    @IBOutlet weak var flipCounter: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flippedCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chosen card wasn't in card buttons")
        }
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices: Array<String> = ["👻","😱","🙀","🎃","😈"]
    
    //var emoji = Dictionary<Int,String>()
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices[randomIndex]
            emojiChoices.remove(at: randomIndex)
//            return "?"
        }
//        else {
//            return emoji[card.identifier]!
//        }
        return emoji[card.identifier] ?? "?"
    }
    
//    func flipCard(withEmoji emoji:String, on button:UIButton){
//        // print("flipcard(with: \(emoji))")
//        if button.currentTitle == emoji {
//            button.setTitle("", for: .normal)
//            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
//        } else {
//            button.setTitle(emoji, for: .normal)
//            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

