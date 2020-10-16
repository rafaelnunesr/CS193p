//
//  ViewController.swift
//  Concentration_Exe
//
//  Created by Rafael Nunes Rios on 10/15/20.
//

import UIKit

class ConcentrationViewController: UIViewController {

    
    var gameThemes = ["Halloween": ["👻", "🎃", "🦇", "🕷", "🕸", "🍭", "💀", "🧛🏻‍♀️", "🧙🏼", "🧟‍♂️"],
                      "Animals": ["🐶", "🐮", "🐱", "🐸", "🦉", "🦁", "🐙", "🐠", "🦢", "🐫"],
                      "Nature": ["🌲", "⛈", "🌤", "🌈", "❄️", "🌹", "🍄", "🌵", "🌊", "🌪"],
                      "Food": ["🍓", "🍔", "🥥", "🍕", "🧁", "🍷", "🍣", "🥩", "🧀", "🍞"],
                      "Objects": ["⌚️", "🎥", "💽", "☎️", "💡", "💻", "📱", "🖨", "🔑", "🪑"],
                      "Countries": ["🇺🇸", "🇿🇦", "🇧🇷", "🇵🇹", "🇯🇵", "🇮🇹", "🇬🇧", "🇩🇪", "🇦🇷", "🇰🇵"]]
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount  = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else {
            print("chosen card was not in cardButtons")
        }
        chooseThemeRandom()
        
    }
    
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 0) :  #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            }
        }
        
    }
    
    var emojiChoices = ["🦇", "😱", "🙀", "😈", "🎃", "👻", "🍭", "🍬", "🍎", "🍎"]
    
    var emoji = [Int: String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        return emoji[card.identifier] ?? "?"
    }
    
    func chooseThemeRandom() {
        
        let themes = gameThemes.keys
        
        print(themes)
        
        
    }


}

