//
//  iTunesApi.swift
//  You Choose 2.0
//
//  Created by Ricky Crane on 22/05/2016.
//  Copyright © 2016 Rick Crane. All rights reserved.
//

import Foundation

class ITunesAPI {
    
    let urlString = "https://itunes.apple.com/search?term="
    
    func apiLoader(search: String) -> JSON
    {
        var results = JSON(NSData())
        // let url = NSURL(string: search)
        
        if let url = NSURL(string: search)
        {
            let contents = NSData(contentsOfURL: url)
            results = JSON(data: contents!, options: NSJSONReadingOptions.MutableContainers , error: nil)
        }
        else
        {
            print("the URL was bad!")
        }
        
        /*
        let urlTask = NSURLSession.sharedSession().dataTaskWithURL(url!)
        {
            (data, response, error) in
            
            if error == nil
            {
                //This will hit if it is working
                results = JSON(data: data!, options: NSJSONReadingOptions.MutableContainers , error: nil)
            }
         }
         urlTask.resume()
        */
        
        return results
    }
    
    func searchForArtist(name: String, limit: Int) -> JSON
    {
        return searchFor(name, searchType: "&entity=musicArtist&limit=\(limit)&attribute=allArtistTerm")
    }
    
    func searchForSong(name: String, limit: Int) -> JSON
    {
        return searchFor(name, searchType: "&entity=song&limit=\(limit)&entity=allArtist&attribute=allArtistTerm")
    }
    
    func searchForAlbum(name: String, limit: Int) -> JSON
    {
        return searchFor(name, searchType: "&entity=album&limit=\(limit)&attribute=albumTerm")
    }
    
    func searchFor(name: String, searchType : String) -> JSON
    {
        let nameSetup = name.stringByReplacingOccurrencesOfString(" ", withString: "+").lowercaseString
        let search = urlString + "\(nameSetup)" + searchType
        
        return apiLoader(search)
    }
}