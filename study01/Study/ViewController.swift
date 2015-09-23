//
//  ViewController.swift
//  Study
//
//  Created by Sungho Yong on 9/22/15.
//  Copyright © 2015 chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var num:Int!
//    int num = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var centerBtn: UIButton!

    @IBAction func centerBtnClick(sender: UIButton) {
        
        sender.titleLabel!.text = String(num)
        
    }
}

