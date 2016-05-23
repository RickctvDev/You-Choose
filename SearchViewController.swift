//
//  SearchViewController.swift
//  You Choose 2.0
//
//  Created by Ricky Crane on 23/05/2016.
//  Copyright © 2016 Rick Crane. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var artistTableView: UITableView!
    
    let artistNameArray = ["Rick Crane", "Erik Landvall", "Sexy Chick"]
    
    let artistImageArray = [UIImage(named: "ed"),
                            UIImage(named: "ed"),
                            UIImage(named: "ed")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = artistTableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ArtistTableViewCell
        
        cell.artistImage.image = self.artistImageArray[indexPath.row]
        cell.artistNameLabel?.text = self.artistNameArray[indexPath.row]
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
    }

}
