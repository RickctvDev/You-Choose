//
//  ArtistViewController.swift
//  You Choose 2.0
//
//  Created by Ricky Crane on 19/05/2016.
//  Copyright © 2016 Rick Crane. All rights reserved.
//

import UIKit

class ArtistViewController: UIViewController
{
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var artistName: UILabel!
    
    var image = UIImage()
    var artistLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.image = self.image
        self.artistName.text = self.artistLabel.text
    }
}
