//
//  ViewController.swift
//  Torch
//
//  Created by admin on 23.02.2018.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Pressed(_ sender: UIButton) {
        let device = AVCaptureDevice.default(for: .video)
        if (device?.hasTorch)!{
            do{
                try device?.lockForConfiguration()
                device?.torchMode=device?.torchMode == AVCaptureDevice.TorchMode.on ? .off : .on
                device?.unlockForConfiguration()
            }catch{
                print(error)
            }
        }
    }
}

