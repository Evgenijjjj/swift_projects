//
//  ViewController.swift
//  Calculator
//
//  Created by admin on 28.02.2018.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
var x: Double = 0
var y: Double = 0
var enterFlag = 1
var yFlag = 1
var operationActiv = 0
var dotFlag = 0
var power = 1
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func digitals(_ sender: UIButton) {
        if enterFlag == 1{
            x = 0
            enterFlag = 0
            power = 1
        }
        if dotFlag == 0{
        x = (x * 10) + Double(sender.tag)
        self.result.text = " " + String(Int64(x))
        }else{
            x = Double(x) + Double(sender.tag)/(pow(10, Double(power)))
            power += 1
            result.text = " " + String(x)
        }
    }
    @IBAction func operations(_ sender: UIButton) {
        //dotFlag = 0
        
        print("operation \(sender.tag)")
        if enterFlag != 1 && yFlag == 1{
        switch operationActiv
        {
        case 1001:
            x = y + x
            switch String(x){
            case let q where q.hasSuffix(".0"):
                result.text = " " + String(Int64(x))
            default:
                result.text = " " + String(x)
            }
        case 1002:
            x = y - x
            switch String(x){
            case let q where q.hasSuffix(".0"):
                result.text = " " + String(Int64(x))
            default:
                result.text = " " + String(x)
            }
        case 1003:
            x = y * x
            switch String(x){
            case let q where q.hasSuffix(".0"):
                result.text = " " + String(Int64(x))
            default:
                result.text = " " + String(x)
            }
        case 1004:
            x = y / x
            switch String(x){
            case let q where q.hasSuffix(".0"):
                result.text = " " + String(Int64(x))
            default:
                result.text = " " + String(x)
            }
        default: self.result.text = " " + String((x))
            }
        }
        operationActiv = sender.tag
        y = x
        //x = 0
        dotFlag = 0
        self.result.text = " " + String((x))
        yFlag=1
        enterFlag=1
    }
    @IBAction func decimal(_ sender: UIButton) {
        print("dot")
        if dotFlag == 0{
            dotFlag = 1
            self.result.text = " " + self.result.text! + "."
        }
        
    }
    @IBAction func clear(_ sender: UIButton) {
        print("clear")
        x=0
        y=0
        self.result.text = " " + String((x))
         enterFlag = 1
         yFlag = 1
         operationActiv = 0
         dotFlag = 0
         power = 1
    }
    @IBAction func inverse(_ sender: UIButton) {
        x = -x
        result.text = " " + String(x)
    }
    
    @IBOutlet weak var result: UILabel!
    
}

