//
//  CardRevealViewController.swift
//  Opth
//
//  Created by Angie Ta on 2/18/19.
//  Copyright © 2019 Angie Ta. All rights reserved.
//

import Foundation

import UIKit
// view controller of card back
// add scroll view
class CardRevealViewController: UIViewController {
        
//    @IBOutlet weak var backTitle: UILabel!
//    @IBOutlet weak var backContent: UILabel!

    //count how many taps
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        backTitle.text = status.getFront(index: 0)
//        backContent.text = status.getBack(index: 0)
        //Hide all the labels in the beginning
        //recognize the tap by users
//        let tap = UITapGestureRecognizer(target: self, action: #selector(CardRevealViewController.tap))
//        myView.isUserInteractionEnabled = true
//        myView.addGestureRecognizer(tap)
        
    }
    
    //Fade in effect
    func fadeIn(name: UILabel){
        UIView.animate(withDuration: 0.5, animations: {name.alpha = 1.0})
    }
    /*Needs to find a more efficient way
     like put all the labels in a array/vector,
     and use for loop to reveal each label
     */
    //Show the label one by one when tap
    @objc func tap(sender:UITapGestureRecognizer) {
        counter = counter + 1

    }
    
    @IBAction func dismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

