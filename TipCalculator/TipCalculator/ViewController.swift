//
//  ViewController.swift
//  TipCalculator
//
//  Created by admin on 2019-04-30.
//  Copyright © 2019 Hao-Tse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TIP: UILabel!
    @IBOutlet weak var bill: UITextField!
    @IBOutlet weak var percentage: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var Slider: UISlider!
    @IBOutlet weak var StackView: UIStackView!
    let keyboard_Height = CGFloat(100.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 20
        StackView.translatesAutoresizingMaskIntoConstraints = false
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func Change(_ sender: UITextField) {
        Calculate(button)
    }
    @objc func keyboardWillShow(notification: Notification) {
                self.view.frame.origin.y -= keyboard_Height
    }
    
    @objc func keyboardWillHide(notification: Notification) {
                self.view.frame.origin.y += keyboard_Height
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SliderChange(_ sender: UISlider) {
        
        percentage.text! = "%" + String(sender.value*100)
        Calculate(button)
    }
    
    @IBAction func Calculate(_ sender: UIButton) {
        if !bill.text!.isEmpty{
            if let billAmount = Float(bill.text!){
                TIP.text! = String(billAmount * Slider.value)
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

