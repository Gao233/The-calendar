//
//  TableViewCell.swift
//  CalendarApp407
//
//  Created by Gaoyuan Chen on 10/25/15.
//  Copyright © 2015 Gaoyuan Chen. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var event: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func loadItem(theDate: String, theMonth: String, theEvent: String ) {

        date.text = theDate
        month.text = theMonth
        event.text = theEvent
    }
    
}
