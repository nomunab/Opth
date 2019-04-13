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
    var category: [String]
    var topic: [String]
    var subtopic: [String]
}
class ContentsOfTableViewController: UITableViewController {
    var tableViewData = [cellData]()
    var topic:Topic = Topic(topic: "null")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parse.csv(data:"/Users/Angie/Desktop/test/biggerdata.txt")
        
        // use for loop to parse through all the categories,topics, and subtopic
        let categories = status.CategoryList
        var topicss = status.CategoryList[0].topics
        var subtopicss = status.CategoryList[0].topics[0].subtopics
        
        //use array to store all the values
        var categoriesAr = [String]()
        var topicssAr = [String]()
        var subtopicssAr = [String]()
        
        //use dictionary to store the key and values
        var categoryDic = [String:[String]]()
        var topicDic = [String:[String]]()
        
        var categoryCount = 0
        var topicCount = 0
        
        //parse and store all the data
        for category in categories {
            let trimmed = category.categoryName.replacingOccurrences(of: "\n", with: "")  //remove any \n
            categoriesAr.append(trimmed)
            topicss = status.CategoryList[categoryCount].topics
            
            for topic in topicss {
                topicssAr.append(topic.topicName)
                categoryDic[trimmed] = topicssAr
                subtopicss = status.CategoryList[categoryCount].topics[topicCount].subtopics
                
                for subtopic in subtopicss {
                    subtopicssAr.append("\t\t  " + subtopic.subtopicName)
                    topicDic["\t" + topic.topicName] = subtopicssAr
                }
                subtopicssAr.removeAll()
                topicCount += 1
            }
            topicssAr.removeAll()
            categoryCount += 1
        }
        
        //add cells to table of content
        var category = ""
        for (categoryKey, _) in categoryDic{
            category = categoryKey
            //need to move category to here
            
            for (topicKey, topicValue) in topicDic{
                tableViewData.append(cellData(opened: false, category: [categoryKey], topic: [topicKey], subtopic: topicValue))
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
    
    //need to take a look here
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newIndex = indexPath.row
        let dataIndex = indexPath.row - 1
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].category[newIndex]
            cell.textLabel?.textColor = UIColor.white
            return cell
        }
        else if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].topic[dataIndex]
            cell.textLabel?.textColor = UIColor.white
            return cell
        }
        else {
            // use different cell identifier if needed
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].subtopic[dataIndex]
            cell.textLabel?.textColor = UIColor.white
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
