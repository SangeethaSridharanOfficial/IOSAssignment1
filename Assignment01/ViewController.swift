//
//  ViewController.swift
//  Assignment01
//
//  Created by user202299 on 9/24/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var historyView: UITextView!
    @IBOutlet weak var calcView: UILabel!
    var calcObj = Calculator();
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        historyView.isHidden = true;
    }

    @IBAction func historyToggleBtn(_ sender: Any) {
        historyView.isHidden = !historyView.isHidden;
        if historyView.isHidden {
            calcObj.history.removeAll();
            historyView.text = "";
            (sender as! UIButton).setTitle("Advance - With History", for: .normal)
        }else{
            (sender as! UIButton).setTitle("Standard - No History", for: .normal)
            
        }
    }
    
    func showAlert() -> Void {
        let alert = UIAlertController(title: "Please select proper value", message: "Digit/Operator", preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true);
        
    }
    
    @IBAction func digitBtn(_ sender: Any) {
        let digit = (sender as! UIButton).titleLabel?.text;
        let text = calcObj.addDigit(digit: digit!);
        if text != ""{
            calcView.text = text;
        }else{
            showAlert();
        }
    }
    
    @IBAction func clearBtn(_ sender: Any) {
        calcView.text = "";
    }
    
    @IBAction func operatorsBtn(_ sender: Any) {
        let op = (sender as! UIButton).titleLabel?.text;
        let res = calcObj.addOperator(op: op!);
        if res != ""{
            calcView.text = "\(res)";
            if op == "=" {
                if !historyView.isHidden {
                    calcObj.history.append(res);
                    historyView.text = calcObj.history.joined(separator: "\n")
                }
            }
        }else{
            showAlert();
        }
        
    }
}

