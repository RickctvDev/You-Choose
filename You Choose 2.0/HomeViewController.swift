//
//  FirstViewController.swift
//  You Choose 2.0
//
//  Created by Ricky Crane on 19/05/2016.
//  Copyright © 2016 Rick Crane. All rights reserved.
//

import UIKit
import iAd

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, ADBannerViewDelegate
{
    //DECLARING VARIABLES HERE
    @IBOutlet var adBannerView: ADBannerView!
    @IBOutlet var collectionView: UICollectionView!
    
    //TESTING ARTIST LIST IN COLLECTION VIEW - *******IMPORTANT******* THEY BOTH ARRAYS BELOW HAVE TO HAVE THE SAME AMOUNTS
    // CONSIDER USING ANOTHER CLASS TO MANAGE THIS!
    let artistList = ["Ed Sheeran",
                      "Nic Cage",
                      "Justin Timberlake",
                      "Justin Bieber",
                      
                      "Elton John",
                      "Rick C",
                      "Miren Campos",
                      "Marc Canneleta",
                      
                      "Rebbeca Marsden",
                      "Iron Man",
                      "Mo Ebrahim",
                      "Dave Cashmore",
                      
                      "Bon Jovi",
                      "Kasabian",
                      "Black Sabbath",
                      "Iron Maiden",
                      
                      "Macklemore",
                      "Kasabian",
                      "Black Sabbath",
                      "Iron Maiden",
                      
                      "Bon Jovi",
                      "Kasabian",
                      "Black Sabbath",
                      "Iron Maiden",
                      
                      "Macklemore",
                      "Kasabian",
                      "Black Sabbath",
                      "Iron Maiden",
                      
                      "Sytem of The Down",
                      
                      ]
    
    let artistImage = [UIImage(named: "ed"),
                       UIImage(named: "ed"),
                       UIImage(named: "ed"),
                       UIImage(named: "ed"),
                       
                       UIImage(named: "ed"),
                       UIImage(named: "ed"),
                       UIImage(named: "ed"),
                       UIImage(named: "ed"),
                       
                       UIImage(named: "ed"),
                       UIImage(named: "ed"),
                       UIImage(named: "ed"),
                       UIImage(named: "ed"),
                       
                       UIImage(named: "ed"),
                       UIImage(named: "ed"),
                       UIImage(named: "ed"),
                       UIImage(named: "ed"),
                       
                       UIImage(named: "ed"),
                       UIImage(named: "ed"),
                       UIImage(named: "ed"),
                       UIImage(named: "ed"),
                       
                       UIImage(named: "ed"),
                       UIImage(named: "ed"),
                       UIImage(named: "ed"),
                       UIImage(named: "ed"),
                       
                       UIImage(named: "ed"),
                       UIImage(named: "ed"),
                       UIImage(named: "ed"),
                       UIImage(named: "ed"),
                       
                       UIImage(named: "ed"),
                       
                       ]
    
    //SET UP ALL VIEW THINGS HERE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.canDisplayBannerAds = true
        self.adBannerView?.delegate = self
        self.adBannerView?.hidden = true
    }
    
    
    
    //COLLECTION OF FEATURED ARTIST SETUP HERE
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.artistList.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! ArtistCollectionViewCell
        
        cell.imageView.image = self.artistImage[indexPath.row]
        cell.titleLabel?.text = self.artistList[indexPath.row]
        return cell
    }
    
    
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showImage", sender: self)
    }
    
    //SELECTED ARTIST FROM FEATURED SECTION
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showImage"{
            let indexPaths = self.collectionView.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            
            let vc = segue.destinationViewController as! ArtistViewController
            
            vc.image = self.artistImage[indexPath.row]!
            vc.artistLabel.text = self.artistList[indexPath.row]
            
        }
    }
    
    //IAD SETUP HERE
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        self.adBannerView?.hidden = false
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        self.adBannerView?.hidden = true
    }
    
    
    
   
    
}

