//
//  IndexViewController.swift
//  Opth
//
//  Created by Itzel Hernandez on 2/20/19.
//  Copyright © 2019 Angie Ta. All rights reserved.
//

import UIKit

class IndexViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    // in order to have something to populate, going to create an array
    let list = ["Layers of the Retina", "Table of Wavelengths", "Bruch's Membrane", "Imaging", "Central Serous Chorioretinopathy (CSCR)", "Age-Related Macular Degeneration (AMD)", "Dry AMD", "Choroidal Neovascularization (CNV)", "Wet AMD Treatments", "Wet AMD Treatments: Studies", "Anti-VEGF Studies", "Other Causes of CNV", "PCV", "Vitreoretinal Interface", "Macular Holes", "Heme", "Maculopathies", "Hypertension", "Diabetic Retinopathy", "Retinal Lasers"]
    
    //for searching
    var searchList = [String]()
    var searching = false
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //for searching
        if(searching) {
            return searchList.count
        }
        else {
            //return number of rows we want in our list
            return(list.count)
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // populate our table cells by creating a cell
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        // for search functionality
        if searching {
            cell.textLabel?.text = searchList[indexPath.row]
        }
            //attempt the area of the elements if nothing to search
        else {
            cell.textLabel?.text = list[indexPath.row]
        }
        return(cell)
    }

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchList = list.filter({$0.prefix(searchText.count) == searchText}) //$0 means it will populate every area
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
