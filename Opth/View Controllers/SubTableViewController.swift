//
//  SubTableViewController.swift
//  Opth
//
//  Created by Cathy Hsieh on 4/18/19.
//  Copyright © 2019 Angie Ta. All rights reserved.
//

import UIKit

class SubTableViewController: UITableViewController {

    @IBOutlet weak var topicName: UILabel!
    var topicIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parse.csv(data:"/Users/cathyhsieh/Documents/GitHub/Opth/Opth/Information/TwoCategories.txt")
        
    }

    //number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return status.CategoryList.count
    }

    //number of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return status.CategoryList[section].topics[topicIndex].subtopics.count
    }
    
    //print out the subtopics
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        topicName.text = status.CategoryList[indexPath.section].topics[topicIndex].topicName
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "subCell", for: indexPath)

        cell.textLabel?.text = status.CategoryList[indexPath.section].topics[topicIndex].subtopics[indexPath.row].subtopicName
        cell.textLabel?.textColor = UIColor.white
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedTopic = status.CategoryList[indexPath.section].topics[topicIndex].subtopics[indexPath.row].subtopicName
//        let destinationVC = ViewController()
//        destinationVC.cardName = selectedTopic
//        destinationVC.performSegue(withIdentifier: "flashCardSegue", sender: self)
        
        performSegue(withIdentifier: "flashCardSegue", sender: self)
    }

}
