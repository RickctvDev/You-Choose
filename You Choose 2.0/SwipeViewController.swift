//
//  SwipeViewController.swift
//  You Choose 2.0
//
//  Created by Ricky Crane on 25/05/2016.
//  Copyright © 2016 Rick Crane. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController {

    @IBOutlet var swipeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpGestures()
    }
    
    func respond(gesture : UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction{
            case UISwipeGestureRecognizerDirection.Right:
                swipeLabel.text! = "Swiped Right"
            case UISwipeGestureRecognizerDirection.Left:
                swipeLabel.text! = "Swiped Left"
            case UISwipeGestureRecognizerDirection.Up:
                swipeLabel.text! = "Swiped Up"
            case UISwipeGestureRecognizerDirection.Down:
                swipeLabel.text! = "Swiped Down"
            default:
                break
            }
        }
    }
    
    func setUpGestures(){
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(SwipeViewController.respond(_:)))
        swipeRight.direction = .Right
        view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(SwipeViewController.respond(_:)))
        swipeLeft.direction = .Left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(SwipeViewController.respond(_:)))
        swipeDown.direction = .Down
        view.addGestureRecognizer(swipeDown)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(SwipeViewController.respond(_:)))
        swipeUp.direction = .Up
        view.addGestureRecognizer(swipeUp)
    }    
}
