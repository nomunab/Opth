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
}
struct topicCellData {
    var opened = Bool()
    var topic: [String]
    var subtopic: [[String]]
}
class ContentsOfTableViewController: UITableViewController {
    var categoryViewData = [cellData]()
    var topicViewData = [topicCellData]()
    var subIndexRow = 0
    var topicIndexRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parse.csv(data:"/Users/cathyhsieh/Documents/GitHub/Opth/Opth/Information/biggerdata.txt")
        
        // use for loop to parse through all the categories,topics, and subtopic
        let categories = status.CategoryList
        var topicss = status.CategoryList[0].topics
        var subtopicss = status.CategoryList[0].topics[0].subtopics
        
        //use array to store all the values
        var categoryAr = [String]()
        var topicssAr = [String]()
        var subtopicssAr = [[String]]()
        var tempSubtopicAr = [String]()
        
        //use dictionary to store the key and values
        //var categoryDic = [String:[String]]()
        //var topicDic = [String:[String]]()
        
        var categoryCount = 0
        var topicCount = 0
        
        //parse and store all the data
        for category in categories {
            let trimmedCategory = category.categoryName.replacingOccurrences(of: "\n", with: "")  //remove any "\n"
            categoryAr.append(trimmedCategory)
            topicss = status.CategoryList[categoryCount].topics
            
            for topic in topicss {
                topicssAr.append("\t" + topic.topicName)
                //categoryDic[trimmedCategory] = topicssAr
                subtopicss = status.CategoryList[categoryCount].topics[topicCount].subtopics
                print("topic: ",topic.topicName)
                for subtopic in subtopicss {
                    tempSubtopicAr.append("\t\t" + subtopic.subtopicName)
                    print("sub: ",subtopic.subtopicName)
                    //topicDic["\t" + topic.topicName] = tempSubtopicAr
                }
                subtopicssAr.append(tempSubtopicAr)
                tempSubtopicAr.removeAll()
                topicCount += 1
            }
            topicViewData.append(topicCellData(opened: false, topic: topicssAr, subtopic: subtopicssAr))
            subtopicssAr.removeAll()
            topicssAr.removeAll()
            categoryCount += 1
            
        }
        categoryViewData.append(cellData(opened: false, category: categoryAr))
        categoryAr.removeAll()
        
        print(categoryViewData)
        print(topicViewData)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return topicViewData.count
    }
    
    //this one seems fine
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // shows subtopics when topic is clicked
        if categoryViewData[section].opened == true {
            return topicViewData[section].subtopic[section].count + 9
        }
        else {
            return categoryViewData[section].category.count
        }
    }
    
    //need to take a look here
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var subtopicCount = topicViewData[indexPath.section].subtopic[indexPath.section].count + 2
        var x = String(indexPath.row)
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell()}
            cell.textLabel?.text = categoryViewData[indexPath.section].category[indexPath.section] + " " + x
            cell.textLabel?.textColor = UIColor.white
            return cell
        }
        else if indexPath.row == 1 || indexPath.row == subtopicCount {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell()}
            cell.textLabel?.text = topicViewData[indexPath.section].topic[topicIndexRow] + " " + x
            cell.textLabel?.textColor = UIColor.white
            print(topicViewData[indexPath.section].topic[topicIndexRow])
            subIndexRow = 0
            return cell
        }
        else {
            // use different cell identifier if needed
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell()}
            subtopicCount = topicViewData[indexPath.section].subtopic[topicIndexRow].count
            
            cell.textLabel?.text = topicViewData[indexPath.section].subtopic[topicIndexRow][subIndexRow] + " " + x
            cell.textLabel?.textColor = UIColor.white
            
            print("T: ",topicIndexRow)
            print("S: ",subIndexRow)
            
            print(topicViewData[indexPath.section].subtopic[topicIndexRow][subIndexRow])
            if(subIndexRow == subtopicCount - 1) {topicIndexRow += 1}
            subIndexRow += 1
            return cell
        }
    }
    
    // write within this function in order to make subtopic redirect to card
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var subtopicCount = topicViewData[indexPath.section].subtopic[indexPath.section].count + 2
        
        // to make sure that subtopic doesn't close up and goes somewhere else
        if indexPath.row == 0 {
            if categoryViewData[indexPath.section].opened == true {
                categoryViewData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none) // play around with this
            }
            else {
                categoryViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none) // play around with this
            }
        }
    }
}
