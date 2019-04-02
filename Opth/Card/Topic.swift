//
//  Topic.swift
//  Opth
//
//  Created by Angie Ta on 3/12/19.
//  Copyright © 2019 Angie Ta. All rights reserved.
//

import Foundation
class Topic{
    var topicName:String
    var subtopics:[Subtopic]
    
    init(topic:String){
        self.topicName = topic
        self.subtopics = []
    }
}
