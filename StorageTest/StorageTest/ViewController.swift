//
//  ViewController.swift
//  StorageTest
//
//  Created by Dan Gonzalez on 2016-02-08.
//  Copyright © 2016 varyag00. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //NSUserDefaults
        
        //creates an object name with value Dan
        //NSUserDefaults.standardUserDefaults().setObject("Dan", forKey: "name")
    
        //to get it back
        var username = NSUserDefaults.standardUserDefaults().objectForKey("name")! as! String
        
        print(username)
        
        
        var c = [1,2,3,4,5,6,7,8,9,10]
        
        NSUserDefaults.standardUserDefaults().setObject(c, forKey: "array")
        
        print(NSUserDefaults.standardUserDefaults().objectForKey("array")!)
    
        let newC = NSUserDefaults.standardUserDefaults().objectForKey("array")! as! NSArray
        print(newC)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

