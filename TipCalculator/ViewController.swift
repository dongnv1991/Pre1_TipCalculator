//
//  ViewController.swift
//  TipCalculator
//
//  Created by Dong Nguyen on 9/15/16.
//  Copyright © 2016 Dong Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblTip: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var textFieldBilling: UITextField!
    @IBOutlet weak var segmented: UISegmentedControl!
    var tips = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(ViewController.saveSegment), name: UIApplicationWillResignActiveNotification, object: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        let userDetalt = NSUserDefaults.standardUserDefaults()
        
        if (userDetalt.doubleForKey("tip1") != 0) {
            let tip1 = userDetalt.doubleForKey("tip1")
            let tip2 = userDetalt.doubleForKey("tip2")
            let tip3 = userDetalt.doubleForKey("tip3")
            tips = [tip1, tip2, tip3]
            
            segmented.removeAllSegments()
            segmented.insertSegmentWithTitle(String.init(format: "%.0f%%", tip1), atIndex: 0, animated: false)
            segmented.insertSegmentWithTitle(String.init(format: "%.0f%%", tip2), atIndex: 1, animated: false)
            segmented.insertSegmentWithTitle(String.init(format: "%.0f%%", tip3), atIndex: 2, animated: false)
        }
        
        let lastSelectedSegment = userDetalt.integerForKey("lastSegment")
        segmented.selectedSegmentIndex = lastSelectedSegment
        calculate()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didChangeValue(sender: AnyObject) {
        calculate()
    }
    
    @IBAction func onTapView(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func calculate() -> Void {
        let bill = Double(textFieldBilling.text!) ?? 0
        let tip = bill * (tips[self.segmented.selectedSegmentIndex] as! Double)/100
        lblTip.text = String.init(format: "$%.2f", tip)
        lblTotal.text = String.init(format: "$%.2f", bill+tip)
    }
    func saveSegment() -> Void {
        let userDetalt = NSUserDefaults.standardUserDefaults()
        userDetalt.setInteger(segmented.selectedSegmentIndex, forKey: "lastSegment")
        userDetalt.synchronize()
    }
}

