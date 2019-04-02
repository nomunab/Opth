//
//  Category.swift
//  Opth
//
//  Created by Angie Ta on 3/12/19.
//  Copyright © 2019 Angie Ta. All rights reserved.
//

import Foundation
class Category{
    var categoryName:String
    var topics:[Topic]

    init(name:String){
        self.categoryName = name
        self.topics = []
    }
}
