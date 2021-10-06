//
//  Calculator.swift
//  Assignment01
//
//  Created by user202299 on 10/5/21.
//

import Foundation

class Calculator{
    var calcArr = [String]();
    var history = [String]();
    
    func isAddOperator(val: String) -> Bool{
        if val == "+"{
            return true;
        }
        return false;
    }
    
    func isSubOperator(val: String) -> Bool{
        if val == "-"{
            return true;
        }
        return false;
    }
    
    func isMulOperator(val: String) -> Bool{
        if val == "*"{
            return true;
        }
        return false;
    }
    
    func isDivOperator(val: String) -> Bool{
        if val == "/"{
            return true;
        }
        return false;
    }
    
    func calculate(arr: [String]) -> String{
        var res = Int(arr[0]) ?? 0;
        var idx = 2;
        while(idx < arr.count){
            let num = Int(arr[idx]) ?? 0;
            let optIdx = idx - 1 // to take the operator
            let opt = arr[optIdx];
            if isAddOperator(val: opt) {
                res += num;
            }else if isSubOperator(val: opt){
                res -= num;
            }else if isMulOperator(val: opt){
                res *= num;
            }else if isDivOperator(val: opt){
                res /= num;
            }
            idx += 2
        }
        return String(res);
    }
    
    func addDigit(digit: String) -> String{
        let pattern = "[0-9]"
        if(calcArr.count == 0 || calcArr[calcArr.count - 1].range(of: pattern, options: .regularExpression) == nil){
            calcArr.append(digit);
        }
        else{
            return "";
        }
        return calcArr.joined(separator: "");
    }
    
    func addOperator(op: String) -> String{
        if(op == "="){
            print(calcArr.joined(separator: ""));
            if(calcArr.count != 0){
                var res = calculate(arr: calcArr);
                res = "\(calcArr.joined(separator: "")) = \(res)";
                calcArr.removeAll();
                return res;
            }else{
                return "";
            }
        }else{
            if(calcArr.count != 0){
                if(calcArr[calcArr.count - 1] != "+" && calcArr[calcArr.count - 1] != "-" && calcArr[calcArr.count - 1] != "*" && calcArr[calcArr.count - 1] != "/"){
                    calcArr.append(op);
                    return calcArr.joined(separator: "");
                    
                }else{
                    return "";
                }
            }else{
                return "";
            }
        }
    }
}
