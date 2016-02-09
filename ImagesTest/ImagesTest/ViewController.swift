//
//  ViewController.swift
//  ImagesTest
//
//  Created by Dan Gonzalez on 2016-02-09.
//  Copyright © 2016 varyag00. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Attributes
    
    @IBOutlet weak var ImageView: UIImageView!
    
    var i = 2;

    //"animates" a spooky dancing alien
    @IBAction func UpdateImage(sender: AnyObject) {
        ImageView.image = UIImage(named: "frame\(i).png")
        i++
        
        if i > 5{
            i = 1;
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

