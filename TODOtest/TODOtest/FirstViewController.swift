//
//  FirstViewController.swift
//  TODOtest
//
//  Created by Dan Gonzalez on 2016-02-08.
//  Copyright © 2016 varyag00. All rights reserved.
//

import UIKit

var todoList = [String]()

class FirstViewController: UIViewController {

    @IBOutlet weak var todoListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    //MARK: Tableview Methods
    
    //how many cells do we have
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return todoList.count;
    }
    
    //define cell(s) and its style
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "ProtoCell")
        
        cell.textLabel?.text = todoList[indexPath.row]
        
        return cell
    }
    
    //refresh table
    override func viewDidAppear(animated: Bool) {
        todoListTable.reloadData()
    }

    
}

