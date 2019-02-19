//
//  Data.swift
//  Opth
//
//  Created by Angie Ta on 2/14/19.
//  Copyright © 2019 Angie Ta. All rights reserved.
//

// maintains the list of all cards
// holds cards of one topic, possibly used for searching by
// topic later
import Foundation

class CardDeck{
    var topic:String!
    var cards:[Card]
    init(){
        topic="empty"
        cards=[]
    }
}

