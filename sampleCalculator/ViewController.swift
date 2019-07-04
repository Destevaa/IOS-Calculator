//
//  ViewController.swift
//  sampleCalculator
//
//  Created by Mary Celina Louise S. Esteva on 02/07/2019.
//  Copyright © 2019 Desteva. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var numberOnScreen:Double=0;
    var previousNumber:Double=0;
    var numberToBeNegated:Double=0;
    var strToConcatenate = ""
    var performingMath = false
    var operation = 0;
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var btnAC: UIButton!
    @IBOutlet weak var btnPlusMinus: UIButton!
    @IBOutlet weak var btnPercentage: UIButton!
    @IBOutlet weak var btnDivide: UIButton!
    @IBOutlet weak var btnSeven: UIButton!
    @IBOutlet weak var btnEight: UIButton!
    @IBOutlet weak var btnNine: UIButton!
    @IBOutlet weak var btnMultiply: UIButton!
    @IBOutlet weak var btnFour: UIButton!
    @IBOutlet weak var btnFive: UIButton!
    @IBOutlet weak var btnSix: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var btnTwo: UIButton!
    @IBOutlet weak var btnThree: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnZero: UIButton!
    @IBOutlet weak var btnPoint: UIButton!
    @IBOutlet weak var btnEqual: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.applyRoundButton(btnAC)
        self.applyRoundButton(btnPlusMinus)
        self.applyRoundButton(btnPercentage)
        self.applyRoundButton(btnDivide)
        self.applyRoundButton(btnSeven)
        self.applyRoundButton(btnEight)
        self.applyRoundButton(btnNine)
        self.applyRoundButton(btnMultiply)
        self.applyRoundButton(btnFour)
        self.applyRoundButton(btnFive)
        self.applyRoundButton(btnSix)
        self.applyRoundButton(btnMinus)
        self.applyRoundButton(btnOne)
        self.applyRoundButton(btnTwo)
        self.applyRoundButton(btnThree)
        self.applyRoundButton(btnPlus)
        self.applyRoundButton(btnPoint)
        self.applyRoundButton(btnEqual)
        self.roundZero(btnZero)
        
        
        
        
        
        
        
    }
    
    
    func applyRoundButton(_ object:AnyObject){
        object.layer.cornerRadius = object.frame.size.width / 2
        object.layer?.masksToBounds = true
        
    }
    
    func roundZero(_ object:AnyObject){
        object.layer.cornerRadius = object.frame.height / 2
        object.layer?.masksToBounds = true
        
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if performingMath == true{
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }
        else{
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        
        //12 yung clear 19 yung equal
        if label.text != "" && sender.tag != 12 && sender.tag != 19 && sender.tag != 13 && sender.tag != 14 && sender.tag != 11{
            
            if label.text != "÷" && label.text != "×" && label.text != "-" && label.text != "+"{
                
                previousNumber = Double(label.text!)!
            }
            
            if sender.tag == 15{ //divide
                label.text = "÷"
            }
            else if sender.tag == 16{ //multiply
                label.text = "×"
            }
            else if sender.tag == 17{ //minus
                label.text = "-"
            }
            else if sender.tag == 18{ //plus
                label.text = "+"
            }
            operation = sender.tag
            performingMath = true;
            
        }
            // 19 is equal
        else if sender.tag == 19{
            if operation == 15
            {
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 16
            {
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 17
            {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 18
            {
                label.text = String(previousNumber + numberOnScreen)
            }
        }
            
        else if sender.tag == 12{
            label.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
        
        else if sender.tag == 13{
        
            if label.text != "" && label.text != "0"{
                numberToBeNegated = Double(label.text!)!
                label.text = String(numberToBeNegated * -1)
                }
            else if label.text == "0"{
                label.text = "0"
                }
        
                }
            
       else if sender.tag == 14{
            if label.text != "" && label.text != "0"{
                numberToBeNegated = Double(label.text!)!
                label.text = String(numberToBeNegated / 100)
                }
            else if label.text == "0"{
                label.text = "0"
                }
            }
        
        else if sender.tag == 11{
            if label.text != ""{
                let dotChecker = label.text
                if (dotChecker?.contains("."))!{
                    
                }else
                {
                    strToConcatenate = label.text! + "."
                    label.text = strToConcatenate
                }
            }
        }
        
    }
    
    
    
    
    
    
    
    
    
    
}



