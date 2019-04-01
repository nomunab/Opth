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
class CardRevealViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    

    @IBOutlet weak var subtopicTableView: SubtopicTableView!
    //count how many taps
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        // Fetch a cell of the appropriate type.
        var cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.value2, reuseIdentifier: "infoCell")
        }
        
        // Configure the cell’s contents.
        //cell.textLabel!.text = "Cell text"
        cell.textLabel!.text = status.ReviewList[1].cards[indexPath.row].header
        cell.detailTextLabel!.text = status.ReviewList[1].cards[indexPath.row].info
        
        return cell
    }
    
}

