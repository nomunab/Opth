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
    
    @IBOutlet weak var Alpha: UILabel!
    @IBOutlet weak var Amiodarone: UILabel!
    @IBOutlet weak var Beta: UILabel!
    @IBOutlet weak var Carbonic: UILabel!
    @IBOutlet weak var Carmustine: UILabel!
    @IBOutlet weak var Chloroquine: UILabel!
    @IBOutlet weak var Cidofovir: UILabel!
    @IBOutlet weak var Digoxin: UILabel!
    @IBOutlet weak var Diuretics: UILabel!
    @IBOutlet weak var Echothiophate: UILabel!
    @IBOutlet weak var Epinephrine: UILabel!
    @IBOutlet weak var myView: UIView!
    
    //count how many taps
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        backTitle.text = status.getFront(index: 0)
//        backContent.text = status.getBack(index: 0)
        //Hide all the labels in the beginning
        self.Alpha.alpha = 0.0
        self.Amiodarone.alpha = 0.0
        self.Beta.alpha = 0.0
        self.Carbonic.alpha = 0.0
        self.Carmustine.alpha = 0.0
        self.Chloroquine.alpha = 0.0
        self.Cidofovir.alpha = 0.0
        self.Digoxin.alpha = 0.0
        self.Diuretics.alpha = 0.0
        self.Echothiophate.alpha = 0.0
        self.Epinephrine.alpha = 0.0
        
        //recognize the tap by users
        let tap = UITapGestureRecognizer(target: self, action: #selector(CardRevealViewController.tap))
        myView.isUserInteractionEnabled = true
        myView.addGestureRecognizer(tap)
        
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
        
        fadeIn(name: Alpha)
        if(counter == 2) {fadeIn(name: Amiodarone)}
        if(counter == 3) {fadeIn(name: Beta)}
        if(counter == 4) {fadeIn(name: Carbonic)}
        if(counter == 5) {fadeIn(name: Carmustine)}
        if(counter == 6) {fadeIn(name: Chloroquine)}
        if(counter == 7) {fadeIn(name: Cidofovir)}
        if(counter == 8) {fadeIn(name: Digoxin)}
        if(counter == 9) {fadeIn(name: Diuretics)}
        if(counter == 10) {fadeIn(name: Echothiophate)}
        if(counter == 11) {fadeIn(name: Epinephrine)}
    }
    
    @IBAction func dismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

