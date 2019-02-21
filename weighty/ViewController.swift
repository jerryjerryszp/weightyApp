//
//  ViewController.swift
//  weighty
//
//  Created by Jerry Shi on 5/9/17.
//  Copyright © 2017 easeapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var weightReading: Int = 0
    var weightSetZero: Bool = false
    var resetValue: Int = 0
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var setZero: UIButton!
    @IBAction func setZeroButton(_ sender: Any) {
        weightSetZero = true
        resetValue = weightReading
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if #available(iOS 9.0, *) {

                if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
                    if touch.force >= touch.maximumPossibleForce {
                        forceLabel.text = "DANGER!!! TOO HEAVY!!!"
                    } else {
                        let force = touch.force/touch.maximumPossibleForce
                        let grams = force * 385
                        let rounded = Int(grams)
                        weightReading = rounded
                        if weightSetZero == false {
                            forceLabel.text = "\(rounded) grams"
                        }else{
                            forceLabel.text = "\(rounded - resetValue) grams"
                        }
                    }
                }
            }
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        forceLabel.text = "0 gram"
        weightSetZero = false
    }
    
    

}

