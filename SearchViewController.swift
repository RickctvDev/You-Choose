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
    var artistNameArray     = [String]()
    var artistAlbumName     = [String]()
    var artistImageArray    = [UIImage]()
    let searchLimit = 3
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
            let cell = artistTableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ArtistTableViewCell
            
            cell.artistNameLabel?.text = self.artistNameArray[indexPath.row]
            cell.artistImage.image = self.artistImageArray[indexPath.row]
            cell.artistAlbumName?.text = self.artistAlbumName[indexPath.row]
            return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return artistNameArray.count
    }
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
        self.view.endEditing(true)
        
        artistNameArray     = [String]()
        artistImageArray    = [UIImage]()
        artistAlbumName     = [String]()
        
        if self.searchBar.text != ""
        {
            //TODO Is this what we really want to search for?
            let resultsForAlbum = api.searchForAlbum(self.searchBar.text!, limit: searchLimit)
            searchResultsOfType("collectionType", results: resultsForAlbum)
            
            let resultsForSong = api.searchForSong(self.searchBar.text!, limit: searchLimit)
            searchResultsOfType("trackName", results: resultsForSong)
            
            let resultsForArtist = api.searchForArtist(self.searchBar.text!, limit: searchLimit)
            searchResultsOfTypeArtist("artistName", results: resultsForArtist)
            
            
            
        }
        else
        {
            print("Empty search")
        }
        artistTableView.reloadData()
    }

    
    func searchResultsOfType(primary: String, results: JSON)
    {
            for (_,subJson):(String, JSON) in results["results"]
            {
                //Provides the table with an array of names found for the NAME label in the Cell
                artistAlbumName.append(subJson[primary].string!)
            
                //Provides the tablewith the name of the artist
                artistNameArray.append(subJson["artistName"].string!)
            
                //Provides the table with an array of images for the IMAGE in the Cell
                let surl    = subJson["artworkUrl60"].string
                let url     = NSURL(string: surl!)
                let data    = NSData(contentsOfURL: url!)
                let img     = UIImage(data: data!)
                artistImageArray.append(img!)
            }
    }
    
    func searchResultsOfTypeArtist(secondary: String, results: JSON)
    {
        for (_,subJson):(String, JSON) in results["results"]
        {
            
            //Provides the table with an array of names found for the NAME label in the Cell
            artistAlbumName.append(subJson["wrapperType"].string!.capitalizedString)
            
            //Provides the tablewith the name of the artist
            artistNameArray.append(subJson["artistName"].string!)
            
            //Provides the table with an array of images for the IMAGE in the Cell
            
            let id    = subJson["artistId"]
            let surl = "https://itunes.apple.com/lookup?id=\(id)&entity=album"
            print(surl)
            
            let url     = NSURL(string: surl)
            let data    = NSData(contentsOfURL: url!)
            
            let _results = JSON(data: data!)["results"]
            if(_results.array!.count > 1)
            {
                let imgSurl = _results[1]["artworkUrl60"].string!
                let imgUrl  = NSURL(string: imgSurl)
                let imgData = NSData(contentsOfURL: imgUrl!)
                let img     = UIImage(data: imgData!)
                artistImageArray.append(img!)
            }
            else
            {
                artistImageArray.append(UIImage(named: "ed")!)
            }
        }
        
    }
}
