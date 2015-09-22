//
//  TestViewController.swift
//  Study
//
//  Created by Sungho Yong on 9/22/15.
//  Copyright © 2015 chris. All rights reserved.
//

import UIKit

class TestViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableview: UITableView!
    
    var datas:[String] = ["a","b","c","d","e"]
    
    override func viewDidLoad() {
//        tableview.delegate = self
    }
    override func viewDidAppear(animated: Bool) {
        
    }
    override func viewWillAppear(animated: Bool) {

    }
    
    override func viewDidDisappear(animated: Bool) {

    }
    override func viewWillDisappear(animated: Bool) {

    }
 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if(indexPath.item % 2 == 0){
            let cell:TestTableCell = tableView.dequeueReusableCellWithIdentifier("cell2") as! TestTableCell
            cell.label.text = datas[indexPath.item]
            
            return cell
        }else {
            let cell:TestTableCell = tableView.dequeueReusableCellWithIdentifier("cell") as! TestTableCell
            cell.label.text = datas[indexPath.item]
            return cell
        }
        
    }
}


class TestTableCell : UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
}
