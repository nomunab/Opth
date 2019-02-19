//
//  ViewController.swift
//  Opth
//
//  Created by Angie Ta on 2/14/19.
//  Copyright © 2019 Angie Ta. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    static let cardCornerRadius: CGFloat = 25
    
    @IBOutlet weak var cardFront: UILabel!
    @IBOutlet weak var card: UIView!
    
    //var deck = CardDeck() // store in seperate class later
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createDeck(data: csv(data:"/Users/Angie/Desktop/Topic.txt"))
        status.printDeck()
        
        cardFront.text = status.getFront(index: 0)
        
        card.layer.cornerRadius = 4.0
        card.layer.borderWidth = 1.0
        card.layer.borderColor = UIColor.clear.cgColor
        card.layer.masksToBounds = false
        card.layer.shadowColor = UIColor.gray.cgColor
        card.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        card.layer.shadowRadius = 4.0
        card.layer.shadowOpacity = 1.0
        card.layer.masksToBounds = false
        card.layer.shadowPath = UIBezierPath(roundedRect: card.bounds, cornerRadius: card.layer.cornerRadius).cgPath
    }
    @IBAction func handleTap(_ sender: Any) {
        print("tap")
        performSegue(withIdentifier: "reveal", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "reveal",
            let destinationViewController = segue.destination as? CardRevealViewController {
            destinationViewController.transitioningDelegate = self
        }
    }
    
    
    
    
    // these functions will be in another class eventually but for simplicity/laziness they are here...
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
                status.setTopic(topic: item[0])
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
            status.insert(card: card)
        }
    }

}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
            return FlipPresentAnimationController(originFrame: card.frame)
    }
}
