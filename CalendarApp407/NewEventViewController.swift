//
//  NewEventViewController.swift
//  CalendarApp407
//
//  Created by Gaoyuan Chen on 10/25/15.
//  Copyright © 2015 Gaoyuan Chen. All rights reserved.
//

import UIKit

class NewEventViewController: UIViewController {

    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var eventTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == "add"{
            var svc = segue.destinationViewController as! ViewController;
            
            svc.toPassDate = dateTextField.text;
            svc.toPassMonth = monthTextField.text;
            svc.toPassEvent = eventTextField.text;
            
            
            
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
