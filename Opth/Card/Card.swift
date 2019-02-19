//
//  DataNode.swift
//  Opth
//
//  Created by Angie Ta on 2/14/19.
//  Copyright © 2019 Angie Ta. All rights reserved.
//

// stores the information on one card
import Foundation

class Card{
    var front:String!
    var back:String!
    var score:Int!
    
    init(front:String, back:String){
        self.front = front
        self.back = back
        self.score = 0
    }
}
