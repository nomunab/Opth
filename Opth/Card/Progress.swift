//
//  Progress.swift
//  Opth
//
//  Created by Angie Ta on 2/18/19.
//  Copyright © 2019 Angie Ta. All rights reserved.
//

import Foundation
// handles all interactions with the main deck, and future file and user progress
class Progress{
    private var deck = CardDeck()
    
    init(){
    }
    
    func getDeck() -> CardDeck{
        return deck
    }
    
    func setTopic(topic: String){
        deck.topic = topic
    }
    
    func insert(card: Card){
        deck.cards.append(card);
    }
    
    func getFront(index: Int)->String{
        return deck.cards[index].front
    }
    
    func getBack(index: Int)->String{
          return deck.cards[index].back
    }
    
    func printDeck(){
        for item in deck.cards{
            print(item.front)
        }
    }
}

var status = Progress()
