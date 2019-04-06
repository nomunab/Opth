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
    var topic: [String]
    var subtopic: [String]
}

class ContentsOfTableViewController: UITableViewController {
    var tableViewData = [cellData]()
    var topic:Topic = Topic(topic: "null")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parse.csv(data:"/Users/cathyhsieh/Documents/GitHub/Opth/Opth/Information/biggerdata.txt")
        
        // use for loop to parse through all the categories,topics, and subtopic
        let categories = status.CategoryList
        let topicss = status.CategoryList[0].topics
        let subtopicss = status.CategoryList[0].topics[0].subtopics

        var categoriesAr = [String]()
        var topicssAr = [String]()
        var subtopicssAr = [String]()
        
        var categoryDic = [String:[String]]()
        var topicDic = [String:[String]]()
        var topicKey = Array(topicDic.keys)
        
        for subtopics in subtopicss{
            print("this is suptopics: ", subtopics.subtopicName)
        }
        
        for category in categories {
            print ("category: " + category.categoryName)
            categoriesAr.append(category.categoryName)
            for topic in topicss {
                print("topic: " + topic.topicName)
                topicssAr.append(topic.topicName)
                for subtopic in subtopicss {
                    print("subtopic: " + subtopic.subtopicName)
                    subtopicssAr.append(subtopic.subtopicName)
                    categoryDic[category.categoryName] = topicssAr
                    topicDic[topic.topicName] = subtopicssAr
                    topicKey = Array(topicDic.keys)
                    print(topicKey)
                }
            }
        }
        
        for numTopic in topicssAr{
            tableViewData.append(cellData(opened: false, topic: [numTopic], subtopic: subtopicssAr))
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

    //need to take a look here
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newIndex = indexPath.row
        let dataIndex = indexPath.row - 1
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].topic[newIndex]
            cell.textLabel?.textColor = UIColor.white
            print("I am the cell text: ", tableViewData[indexPath.section].topic[newIndex])
            return cell
        }
        else {
            // use different cell identifier if needed
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].subtopic[dataIndex]
            cell.textLabel?.textColor = UIColor.white
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

