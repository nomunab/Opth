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
    @IBAction func easyOnClick(_ sender: Any) {
        print("easy")
        dismiss(animated: true, completion: nil)
    }
    @IBAction func unsureOnClick(_ sender: Any) {
         print("unsure")
         dismiss(animated: true, completion: nil)
    }
    @IBAction func hardOnClick(_ sender: Any) {
         print("hard")
         dismiss(animated: true, completion: nil)
    }
    
//    @IBAction func dismissSlide(_ sender: UIButton) {
//        dismiss(animated: true, completion: nil)
//    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // programmically add uiview
//        let currentReviewIndex = status.curReviewIndex
//        if(status.ReviewList[currentReviewIndex].img_list[currentReviewIndex] != "no image"){
//            
//        }
        subtopicTableView.rowHeight = UITableView.automaticDimension
    }
    
    //Fade in effect
    func fadeIn(name: UILabel){
        UIView.animate(withDuration: 0.5, animations: {name.alpha = 1.0})
    }
    
    // Return the number of rows for the table.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return status.ReviewList[status.curReviewIndex].cards.count
    }
    
    // Provide a cell object for each row.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // fetch cell
        var cell = tableView.dequeueReusableCell(withIdentifier: "SubtopicInfoCell", for: indexPath) as! SubtopicTableViewCell
        
        // fill cell contents
        cell.Header.text = status.ReviewList[status.curReviewIndex].cards[indexPath.row].header
        cell.Info.text = status.ReviewList[status.curReviewIndex].cards[indexPath.row].info
        
        return cell
    }
    
}

