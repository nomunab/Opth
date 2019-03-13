//
//  Subtopics.swift
//  Opth
//
//  Created by Angie Ta on 3/12/19.
//  Copyright © 2019 Angie Ta. All rights reserved.
//

import Foundation
class Subtopic{
    var subtopicName:String
    var cards:[Card]
    var img_list:[String]

    init(subtopic: String){
        self.subtopicName = subtopic
        self.cards = []
        self.img_list = []
    }
    
    func addImg(img: String){
        self.img_list.append(img)
    }
}
