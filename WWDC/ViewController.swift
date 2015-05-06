//
//  ViewController.swift
//  WWDC (Swift)
//
//  Created by Grant Goodman on 4/16/15.
//  Copyright (c) 2015 Macster Software Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Set the background of the view to the image.
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "Background.png")?.drawInRect(self.view.bounds)
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        
        //Add the 'dock' to the view controller.
        let toolbar: UIToolbar = UIToolbar()
        toolbar.frame = CGRectMake(0, 631, 414, 105)
        toolbar.alpha = 0.8
        toolbar.backgroundColor = UIColor.blackColor()
        self.view.addSubview(toolbar)
        self.view.sendSubviewToBack(toolbar)
        
        //Sets up the vertical effect for the simple parallax.
        let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y",
            type: .TiltAlongVerticalAxis)
        verticalMotionEffect.minimumRelativeValue = -10
        verticalMotionEffect.maximumRelativeValue = 10
        
        //Sets up the horizontal effect for the simple parallax.
        let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x",
            type: .TiltAlongHorizontalAxis)
        horizontalMotionEffect.minimumRelativeValue = -10
        horizontalMotionEffect.maximumRelativeValue = 10
        
        //Creates a group to combine them both.
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
        
        //Adds both of the parallax effects to the view.
        self.view.addMotionEffect(group)
        
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return UIStatusBarStyle.LightContent
    }
    
    @IBAction func swipeGestureRecognizer(sender: AnyObject)
    {
        self.performSegueWithIdentifier("nextPageSegue", sender: self)
    }
    
    @IBAction func backGestureRecognizer(sender: AnyObject)
    {
       self.performSegueWithIdentifier("backPageSegue", sender: self)
    }
}

