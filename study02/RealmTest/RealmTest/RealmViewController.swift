//
//  RealmViewController.swift
//  RealmTest
//
//  Created by Sungho Yong on 9/23/15.
//  Copyright © 2015 chris. All rights reserved.
//

import UIKit
import RealmSwift

class RealmViewController : UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    let realm = try! Realm()
    
    
    override func viewDidLoad() {
        load()
    }
    
    func load(){
        let datas = realm.objects(TestData)
        var text:String = ""
        for data in datas {
            text += data.string
            text += "  ,  "
            text += String(data.integer)
            text += "\n"
        }
        textView.text = text
    }
    
    @IBAction func searchData(sender: UIButton) {
        
        let datas = realm.objects(TestData).filter("integer < 500000").filter("integer > 100000").sorted("integer")

        var text:String = ""
        for data in datas {
            text += data.string
            text += "  ,  "
            text += String(data.integer)
            text += "\n"
        }
        textView.text = text
    }
    @IBAction func updateData(sender: UIButton) {
        let datas = realm.objects(TestData).filter("integer < 500000").filter("integer > 100000")
        
        try! realm.write({ () -> Void in
            for data in datas {
                data.string = "updated data"
            }
        })
        
        load()
        
    }
    @IBAction func deleteData(sender: UIButton) {
        try! realm.write({ () -> Void in
            if let data = self.realm.objects(TestData).last{
                self.realm.delete(data)
            }
            
        })
        load()
    }
    @IBAction func addData(sender: UIButton) {
        
        let data:TestData = TestData()
        data.string = String(arc4random_uniform(100))
        data.integer = Int(arc4random_uniform(1000000))
        
        
        try! realm.write {
            self.realm.add(data)
        }
        
        load()
    }
}





class TestData : Object {
    dynamic var string = ""
    dynamic var integer = 0
}