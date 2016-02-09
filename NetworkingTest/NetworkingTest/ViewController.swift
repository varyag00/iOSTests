//
//  ViewController.swift
//  NetworkingTest
//
//  Created by Dan Gonzalez on 2016-02-08.
//  Copyright © 2016 varyag00. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Attributes
    
    @IBOutlet weak var WebView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("Test")
        
        let url = NSURL(string: "https://www.stackoverflow.com")!
        
        
        //much nicer way to download URL and display it
        WebView.loadRequest(NSURLRequest(URL: url))
        
        /*  //One way to download data; does not format it because it only DL's html and displays it
        
        //fetch data at URL into data, some info about data in response, error info in error (if error occurred)
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            //will happen after code completes:

            //if urlContent is not empty
            if let urlContent = data {
                
                //encode as UTF-8
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                
                //print(webContent)
                
                //wait for task to return data before attempting the following
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.WebView.loadHTMLString(String(webContent!), baseURL: nil)
 
                })
                
            } else {
                print("Bad URL")
            }
        }
        
        //start task
        task.resume()
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

