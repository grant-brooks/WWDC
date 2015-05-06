//
//  Settings-Controller.swift
//  WWDC (Swift)
//
//  Created by Grant Goodman on 4/16/15.
//  Copyright (c) 2015 Macster Software Inc. All rights reserved.
//

import UIKit

class SEC: UIViewController
{
    @IBOutlet weak var compilationDateLabel: UILabel!
    @IBOutlet weak var versionNumberLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Updates the appearance of the status bar.
        self.setNeedsStatusBarAppearanceUpdate()
        
        let appInfo = NSBundle.mainBundle().infoDictionary as! Dictionary<String,AnyObject>
        let buildNumber = appInfo["CFBundleShortVersionString"] as! String
        let bundleVersion = appInfo["CFBundleVersion"] as! String
        let finalBuildNumber = "\(buildNumber).\(bundleVersion)"
        self.versionNumberLabel.text = finalBuildNumber
        
//        let initialDateString = appInfo["CFBuildDate"] as! String
//        let initialDateFormatter = NSDateFormatter()
//        initialDateFormatter.dateFormat = "E MM dd HH:mm:ss zzz yyyy"
//        let initialDate = initialDateFormatter.dateFromString(initialDateString)
//        
//        let dateFormatter = NSDateFormatter()
//        dateFormatter.dateFormat = "EEEE, MMMM dd yyyy"
//        let dateFromDateString = dateFormatter.stringFromDate(initialDate!)
//        
//        let timeFormatter = NSDateFormatter()
//        timeFormatter.dateFormat = "hh:mm:ss a zzz"
//        let timeFromDateString = timeFormatter.stringFromDate(initialDate!)
//        
//        self.compilationDateLabel.text = NSString(format: "%@ at %@", dateFromDateString, timeFromDateString) as String
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return UIStatusBarStyle.Default
    }
    
    @IBAction func homeButton(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

