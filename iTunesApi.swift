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
    
    func apiLoader(search: String){
        print(search)
        let url = NSURL(string: search)
        let urlTask = NSURLSession.sharedSession().dataTaskWithURL(url!)
        {
            (data, response, error) in
            
            if error == nil {
                //This will hit if it is working
                var jsonFormatter = JSON(data: data!, options: NSJSONReadingOptions.MutableContainers , error: nil)
                let results = jsonFormatter["results"]
                print(results)
                
            }else{
                print("There was an error")
            }
        }
        urlTask.resume()
    }
    
    func searchForArtist(name: String, limit: Int){
        searchFor(name, searchType: "&entity=musicArtist&limit=\(limit)&entity=allArtist&attribute=allArtistTerm")
    }
    
    func searchForSong(name: String, limit: Int){
        searchFor(name, searchType: "&entity=song&limit=\(limit)&entity=allArtist&attribute=allArtistTerm")
    }
    
    func searchForAlbum(name: String, limit: Int){
        searchFor(name, searchType: "&entity=album&limit=\(limit)&entity=allArtist&attribute=allArtistTerm")
    }
    
    func searchFor(name: String, searchType : String){
        let nameSetup = name.stringByReplacingOccurrencesOfString(" ", withString: "+").lowercaseString
        let search = urlString + "\(nameSetup)" + searchType
        apiLoader(search)
    }
}