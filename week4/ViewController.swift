//
//  ViewController.swift
//  week4
//
//  Created by ANT MAN on 10/2/2562 BE.
//  Copyright © 2562 mossnanaOrganize. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        volumnTxt.text = String(0)
        volumnStepperRef.isHidden = false
        volumnSliderRef.isHidden = true
    }

    @IBOutlet weak var volumnTxt: UILabel!
    @IBOutlet weak var volumnSliderRef: UISlider!
    @IBOutlet weak var volumnStepperRef: UIStepper!
    @IBOutlet weak var volumnSwitchRef: UISwitch!
    
    @IBAction func volumnSlider(_ sender: Any) {
        let stepSlider: Float = 5.0
        let roundValue: Float = round(volumnSliderRef.value / stepSlider) * stepSlider
        volumnTxt.text = String(roundValue)
        volumnStepperRef.value = Double(roundValue)
    }
    
    @IBAction func volumnStepper(_ sender: Any) {
        volumnSliderRef.value = Float(volumnStepperRef.value)
        volumnTxt.text = String(volumnStepperRef.value)
    }
    
    @IBAction func volumnSwitch(_ sender: Any) {
        if volumnSwitchRef.isOn {
            volumnStepperRef.isHidden = true
            volumnSliderRef.isHidden = false
        } else {
            volumnStepperRef.isHidden = false
            volumnSliderRef.isHidden = true
        }
    }
    
}

