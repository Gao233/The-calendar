//
//  ViewController.swift
//  CalendarApp407
//
//  Created by Gaoyuan Chen on 10/25/15.
//  Copyright © 2015 Gaoyuan Chen. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    class singleEvent{
        var date: String
        var month: String
        var event: String
        init(date: String, month: String, event: String){
            self.date = date
            self.month = month
            self.event = event
        }
        
        func getDate() -> String {
            return self.date
        }
        func getMonth() -> String {
            return self.month
        }
        func getEvent() -> String {
            return self.event
        }
        
    }
    
    var items = [singleEvent]()
    
    struct globalItems {
        static var items = [singleEvent]()
    }

    let cellIdentifier = "mycell"
    
    @IBOutlet weak var tableView: UITableView!
    
    var toPassDate: String!
    var toPassMonth: String!
    var toPassEvent: String!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.setHidesBackButton(true, animated:true);
        tableView.delegate = self
        tableView.dataSource = self
        var nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "mycell")
        
        
        if(toPassDate != nil && toPassEvent != nil && toPassMonth != nil){
            
        var newEvent = singleEvent(date: toPassDate, month: toPassMonth, event: toPassEvent)
            
        globalItems.items.append(newEvent)
            
            toPassDate = nil;
            toPassMonth = nil;
            toPassEvent = nil;
        }
        
        for(var i = 0; i < globalItems.items.count; i++){
            print(globalItems.items[i].getDate(),globalItems.items[i].getMonth(),globalItems.items[i].getEvent(), "\n", globalItems.items.count)
        }
    }


    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return globalItems.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:TableViewCell = self.tableView.dequeueReusableCellWithIdentifier("mycell") as! TableViewCell
        
        // this is how you extract values from a tuple
        var date = globalItems.items[indexPath.row].getDate()
        var month = globalItems.items[indexPath.row].getMonth()
        var event = globalItems.items[indexPath.row].getEvent()
        
        cell.loadItem(date, theMonth: month, theEvent: event)
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        navigationItem.title = nil
        
        if segue.identifier == "add"{
            navigationItem.title = "Add New Event"
        }
       
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            globalItems.items.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }

}

