//
//  ViewController.swift
//  Opth
//
//  Created by Angie Ta on 2/14/19.
//  Copyright © 2019 Angie Ta. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{

    var deck = CardDeck() // store in seperate class later
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createDeck(data: csv(data:"/Users/Angie/Desktop/Topic.txt"))
        printDeck()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1 // number of cards on the screen
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.cardFront.text = deck.cards[0].front
       // cell.cardFront = deck.cards[indexPath.row].front
        // possibly have previous cards disappear if flipped
        //This creates the shadows and modifies the cards a little bit
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        return cell
    }
    
    // these functions will be in another class eventually but for simplicity they are here...
    func csv(data: String) -> [[String]]{
        var parsedData:[[String]] = [[]]
        do {
            let contents = try String(contentsOfFile: data)
            let parsedCSV: [[String]] = contents
                .components(separatedBy: "\n")
                .map({
                    $0.components(separatedBy: "\t")
                })
            parsedData = parsedCSV // if successful return this
        } catch {
            print(error);
        }
        return parsedData
    }
    
    func createDeck(data:[[String]]){
        var count = 0;
        for item in data{
            if count == 0 {// topic heading
                deck.topic = item[0]
                count=1
                continue
            }
            var front = "empty"
            var back = ""
            for backItem in 0..<item.count{
                if backItem == 0{
                    front = item[backItem]
                }
                else{
                    back.append(item[backItem])
                }
            }
            var card = Card(front: front, back: back);
            deck.cards.append(card)
        }
    }

    func printDeck(){
        for item in deck.cards{
            print(item.front)
        }
    }

}

