//
//  ViewController.swift
//  TimesTables
//
//  Created by Dan Gonzalez on 2016-02-07.
//  Copyright © 2016 varyag00. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    //MARK: Attributes
    
    //mult table array
    var multTable:[Int] = []
    
    @IBOutlet weak var SliderValue: UISlider!
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //initialize array values 0...12
        multTable = [Int](1...12)
    }

    
    @IBAction func SliderUpdate(sender: AnyObject) {
        //let val = SliderValue.value
        table.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        //we want 13 rows of in our tableview, because we want to display up to x * 12, (0, 12)
        return multTable.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        //give cell style and identify the prototype cell we're going to use ("Cell", which is defined in the main storyboard as the tableview cell prototype)
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "MultiplicationCell")
        
        //what we want to change in our cell
        cell.textLabel?.text = String(multTable[indexPath.row] * Int(SliderValue.value)) //displays the respective row
        
        let timesTable = Int(SliderValue.value * 20)
        //cell.textLabel?.text = String(timesTable * indexPath.row)
        
        return cell
    }
    
    
    
    //MARK: MEMORY WARNING
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

