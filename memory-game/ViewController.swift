//
//  ViewController.swift
//  memory-game
//
//  Created by Manoj Ashok Kurien on 17/02/2018.
//  Copyright © 2018 Manoj Ashok Kurien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: cardButtons.count / 2)
    
    @IBOutlet weak var flips: UILabel!
    
    var flipCount = 0 {
        didSet{
            flips.text = "Flips: \(flipCount)"
            print(flips.text!)
        }
    }
    @IBOutlet var cardButtons: [UIButton]!
    
    func newGame() {
        game = Concentration(numberOfPairsOfCards: cardButtons.count / 2)
        flipCount = 0
        updateViewFromModel()
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            flipCount += 1
            if game.isGameOver() {
                newGame()
            }
        }
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🎃", "👻", "🌈","❄️","🍌","🚘","🚀","🐥","🔫"]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil, emojiChoices.count > 0{
            let randomNumbr = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomNumbr)
        }
        
        return emoji[card.identifier] ?? "?"
    }
}

