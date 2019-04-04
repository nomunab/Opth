//
//  ContentsOfTableViewController.swift
//  Opth
//
//  Created by Itzel Hernandez on 4/1/19.
//  Copyright © 2019 Angie Ta. All rights reserved.
//

import UIKit
import Foundation

//TODO: add category
//populate the table
struct cellData {
    var opened = Bool()
    var topic: String
    var subtopic: [String]
}

class ContentsOfTableViewController: UITableViewController {
    var tableViewData = [cellData]()
    var topic:Topic = Topic(topic: "null")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parse.csv(data:"/Users/Itzel/Desktop/Opth/Opth/Information/biggerdata.txt")
        
        // use for loop to parse through all the categories,topics, and subtopic
        let categories = status.CategoryList
        let topicss = status.CategoryList[0].topics
        let subtopicss = status.CategoryList[0].topics[0].subtopics
        
        for category in categories {
            print ("I am category: ",category.categoryName)
        }
        for topic in topicss {
            print("I am topics: ",topic.topicName)
        }
        for subtopic in subtopicss {
            print("I am subtopics: ", subtopic.subtopicName)
        }
        
        for category in categories {
            for topic in topicss {
                for subtopic in subtopicss {
                   tableViewData = [cellData(opened: false, topic: topic.topicName, subtopic: [subtopic.subtopicName])]
                }
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }

    //this one seems fine
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // shows subtopics when topic is clicked
        if tableViewData[section].opened == true {
            return tableViewData[section].subtopic.count + 1
        }
        else {
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataIndex = indexPath.row - 1
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].topic
            print("I am the cell text: ", tableViewData[indexPath.section].topic)
            return cell
        }
        else {
            // use different cell identifier if needed
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].subtopic[dataIndex]
            print("I am the cell text if not topic: ", tableViewData[indexPath.section].subtopic[dataIndex])
            return cell
        }
    }
    
    // write within this function in order to make subtopic redirect to card
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // to make sure that subtopic doesn't close up and goes somewhere else
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].opened == true {
                tableViewData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none) // play around with this
            }
            else {
                tableViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none) // play around with this
            }
        }
    }
    
}

