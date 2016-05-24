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
    
    let api = ITunesAPI()
    
    var artistNameArray = [String]()
    
    var artistImageArray = [UIImage()]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = artistTableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ArtistTableViewCell
        
        
        
        if(indexPath.row != 0)
        {
            cell.artistNameLabel?.text = self.artistNameArray[indexPath.row]
            cell.artistImage.image = self.artistImageArray[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistNameArray.count
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
        artistNameArray = [String]()
        
        if self.searchBar.text != ""
        {
            var results = api.searchForAlbum(self.searchBar.text!, limit: 20)
            for (_,subJson):(String, JSON) in results["results"]
            {
                print(subJson)
                
                artistNameArray.append(subJson["collectionName"].string!)
                
                let surl    = subJson["artworkUrl60"].string
                let url     = NSURL(string: surl!)
                let data    = NSData(contentsOfURL: url!)
                let img     = UIImage(data: data!)
                artistImageArray.append(img!)
            }
        }
        else
        {
            print("Emty search")
        }
        artistTableView.reloadData()
    }

}
