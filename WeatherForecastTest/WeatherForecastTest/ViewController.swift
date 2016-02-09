//
//  ViewController.swift
//  WeatherForecastTest
//
//  Created by Dan Gonzalez on 2016-02-08.
//  Copyright © 2016 varyag00. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Attributes
    
    @IBOutlet weak var CityTextField: UITextField!
    @IBOutlet weak var WebView: UIWebView!
    
    var city:String = ""
    var url = NSURL(string: "http://www.weather-forecast.com/locations/Calgary/forecasts/latest")!
    let urlString = NSString(string: "http://www.weather-forecast.com/locations/<city>/forecasts/latest")

    
    //MARK: Actions
    
    @IBAction func DoneButtonClicked(sender: AnyObject) {
        
        if CityTextField.text?.characters.count > 0 {
            city = String(UTF8String: CityTextField.text!)!
            city = NSString(string: city).stringByReplacingOccurrencesOfString(" ", withString: "-")
            
            //newUrlString should now contain a valid URL if valid city given
            let newUrlString = urlString.stringByReplacingOccurrencesOfString("<city>", withString: city)
            url = NSURL(string: newUrlString)!
            
            WebView.loadRequest(NSURLRequest(URL: url))
        }
        
        else{
            print("Don't try to break the app!")
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

    
    //CODE YOU ADD ANY TIME YOU USE A KEYBOARD
    
    //when user clicks outside of keyboard, end editing (close keyboard)
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //close keyboard when return pressed
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        
        //could also probably trigger button functionality
        
        textField.resignFirstResponder()    //close the keyboard
        return true
    }

}

