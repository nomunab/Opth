//
//  CardRevealViewController.swift
//  Opth
//
//  Created by Angie Ta on 2/18/19.
//  Copyright © 2019 Angie Ta. All rights reserved.
//

import Foundation

import UIKit
// add scroll view
class CardRevealViewController: UIViewController {
        
    @IBOutlet weak var backTitle: UILabel!
    @IBOutlet weak var backContent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backTitle.text = status.getFront(index: 0)
        backContent.text = status.getBack(index: 0)
    }
    
    @IBAction func dismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

