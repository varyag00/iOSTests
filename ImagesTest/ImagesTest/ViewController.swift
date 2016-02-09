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
    
    @IBOutlet weak var StartStopButton: UIButton!
    
    @IBOutlet weak var ImageView: UIImageView!
    
    var timer = NSTimer()
    var i = 2;
    var dancing = true;

    //"animates" a spooky dancing alien
    @IBAction func UpdateImage(sender: AnyObject) {
        
        if !dancing{
            //NOTE: you can't just use timer.fire() when you're using scheduledTimerWithTimeInterval()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
            dancing = true
            StartStopButton.setTitle("Stop", forState: UIControlState.Normal)
        }
        else {
            timer.invalidate()
            dancing = false
            StartStopButton.setTitle("Start", forState: UIControlState.Normal)

        }
//        ImageView.image = UIImage(named: "frame\(i).png")
//        i++
//        
//        if i > 5{
//            i = 1;
//        }
    }
    
    
    func doAnimation(){
        //to continuous animate spooky alien, this is being triggered ever 0.1 second interval by the timer
        ImageView.image = UIImage(named: "frame\(i).png")
        i++
        
        if i > 5{
            i = 1;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
        //timer.invalidate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    //MARK: Important Methods
    
    
    /*
    
    //some animations
    
    //called BEFORE view displays; when objects have been created but not yet displayed
    override func viewDidLayoutSubviews() {
        //1. moves spooky alien left off screen, out of view
        //ImageView.center = CGPointMake(ImageView.center.x - 400, ImageView.center.y)
    
        //2. make image invisible
        //ImageView.alpha = 0
        
        //3. change size animation (grow)
        //setting width & height = 0 means image is invisible
        ImageView.frame = CGRectMake(100, 50, 0, 0)
    }

    //called when objects appear (from above)
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1) { () -> Void in
            //remember to use "self" to identify WHICH ImageView you're referring to
            //1. move image back into view
            //self.ImageView.center = CGPointMake(self.ImageView.center.x + 400, self.ImageView.center.y)
        
            //2. fade it into view
            //self.ImageView.alpha = 1
            
            //3. grow ImageView back
            self.ImageView.frame = CGRectMake(100, 50, 200, 200)
        }
        
    }
    */
    
    
}

