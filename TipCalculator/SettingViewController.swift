//
//  SettingViewController.swift
//  TipCalculator
//
//  Created by Dong Nguyen on 9/16/16.
//  Copyright © 2016 Dong Nguyen. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var value1: UITextField!

    @IBOutlet weak var value2: UITextField!
    
    @IBOutlet weak var value3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchBtnSave(sender: AnyObject) {
        let tip1 = Double(value1.text!)
        let tip2 = Double(value2.text!)
        let tip3 = Double(value3.text!)
        if (tip1 > 0 && tip2 > 0 && tip3 > 0) {
            
            let userDefalt = NSUserDefaults.standardUserDefaults()
            userDefalt.setDouble(tip1!, forKey: "tip1")
            userDefalt.setDouble(tip2!, forKey: "tip2")
            userDefalt.setDouble(tip3!, forKey: "tip3")
            userDefalt.synchronize()
            self.view.endEditing(true)
            self.navigationController?.popViewControllerAnimated(true)
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
