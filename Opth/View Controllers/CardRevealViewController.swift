//
//  CardRevealViewController.swift
//  Opth
//
//  Created by Angie Ta on 2/18/19.
//  Copyright © 2019 Angie Ta. All rights reserved.
//

import Foundation

import UIKit

class CardRevealViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    

    @IBOutlet weak var subtopicTableView: SubtopicTableView!
    //count how many taps
    var counter = 0
    
    //Buttons
    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var unsureButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subtopicTableView.rowHeight = UITableView.automaticDimension
        
        //UI for buttons
        easyButton.layer.cornerRadius = 10
        unsureButton.layer.cornerRadius = 10
        hardButton.layer.cornerRadius = 10
        
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
    
    // Return the number of rows for the table.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return status.ReviewList[1].cards.count
    }
    
    // Provide a cell object for each row.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // fetch cell
        var cell = tableView.dequeueReusableCell(withIdentifier: "SubtopicInfoCell", for: indexPath) as! SubtopicTableViewCell
        
        // fill cell contents
        cell.Header.text = status.ReviewList[1].cards[indexPath.row].header
        cell.Info.text = status.ReviewList[1].cards[indexPath.row].info
        
        return cell
    }
    
}

