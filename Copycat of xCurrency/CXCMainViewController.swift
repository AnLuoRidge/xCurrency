//
//  MainViewController.swift
//  Copycat of xCurrency
//
//  Created by AnLuoRidge on 2/9/17.
//  Copyright © 2017 里脊. All rights reserved.
//

import UIKit

class CXCMainViewController: UIViewController, CXCKeyboardDelegate {
    
    var keyboardView: CXCKeyboardView?// how to init at init?
    var tableViewVC = CXCMainTableViewController()
    //    var respondingCell: CXCMainTableViewCell {
    //        let cell:CXCMainTableViewCell
    //
    //        if let index = tableViewVC.tableView.indexPathForSelectedRow {
    //            cell = tableViewVC.tableView.cellForRow(at: index) as! CXCMainTableViewCell
    //        } else {
    //            cell = tableViewVC.tableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as! CXCMainTableViewCell
    //        }
    //
    //        return cell
    //    }
    
    func getFocusedCell(fromFocusedTextField tf: UITextField) -> CXCMainTableViewCell {
        let indexPath = IndexPath.init(row: tf.tag - 1000, section: 0)
        return tableViewVC.tableView.cellForRow(at: indexPath) as! CXCMainTableViewCell
    }
    
    var respondingTextField: UITextField? {
        for tf in tableViewVC.textFields {
            if tf.isFirstResponder {
                return tf
            }
        }
        return nil
    }
    
    var previousRespondingTextField = UITextField()
    //var respondingTextField: UITextField?
    //    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    //        for tf in tableViewVC.textFields {
    //            tf.te
    //        }
    //        return true
    //    }
    //
    //    func textFieldDidEndEditing(_ textField: UITextField) {
    //
    //    }
    
    
    
    //var keyboardView = CXCKeyboardView.init(delegate: self as! CXCKeyboardDelegate)
    //var keyboardView: CXCKeyboardView
    
    //    required init?(coder aDecoder: NSCoder) {// override is implied
    //        //self.keyboardView = CXCKeyboardView.init(delegate: self)
    //        super.init(coder: aDecoder)
    //    }
    lazy var leftNaviBtn: UIBarButtonItem = {
        let btn = UIBarButtonItem.init(image: UIImage.init(named: "btn_setting"), style: .plain, target: self, action: nil)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        self.title = NSLocalizedString("极简汇率", comment: "comment")
        self.navigationItem.leftBarButtonItem = leftNaviBtn
        self.view.backgroundColor = .white
        keyboardView = CXCKeyboardView.init(delegate: self)
        self.view.addSubview(keyboardView!)
        self.addChildViewController(tableViewVC)
        self.view.addSubview(tableViewVC.view)
        //        self.observeValue(forKeyPath: "tableViewVC.tableView.indexPathForSelectedRow", of: <#T##Any?#>, change: <#T##[NSKeyValueChangeKey : Any]?#>, context: <#T##UnsafeMutableRawPointer?#>)
        setupConstraints()
        
        let session = URLSession.init(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: URL.init(string: "https://finance.yahoo.com/webservice/v1/symbols/allcurrencies/quote?format=json")!) { (data, response, error) in
            
            do {
                if data != nil {
                    //if JSONSerialization.isValidJSONObject(data) {
                    let dict1 = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: Any]
                    
                    let list = dict1["list"]! as! [String:Any];
                    //let json1 = json["resources"] as! [[String:Any]];
                    for dict in list["resources"] as! [[String:Any]] {
                        let resource = dict["resource"]! as! [String:Any];
                        let fields = resource["fields"] as! [String:String];
                        if let price = fields["price"] {
                            if let name = fields["name"] {
                                currentCurrencyDict.updateValue(Float(price)!, forKey: name)
                            }
                        }
                        
                        
                    }
                    //}
                }
            } catch {
                
            }
            
        }
        // TODO: open
        //task.resume()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func proceedTextFromKeyboard(sender: UIButton) {
        if let respondingTF = respondingTextField {
            let focusedCell = getFocusedCell(fromFocusedTextField: respondingTF)
            // If user turns to another text field
            if previousRespondingTextField != respondingTF {
                previousRespondingTextField = respondingTF
                updateRates(focusedCell: focusedCell)
            }
            /*
             add
             add, anyway
             Only can have one dot!
             del
             删完为空就填 placeholder
             删成 2. 就要自动补 0？
             
             */
            //
            
            let key = sender.title(for: .normal)!
            let val:Float?
            
            switch key {
            case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
                val = Float(respondingTF.text! + key)!
            case ".":
                val = Float(respondingTF.text!)
            case "del":
                if respondingTF.text!.characters.count > 1 {
                    let endIndex = respondingTF.text!.index(before: respondingTF.text!.endIndex)
                    val = Float(respondingTF.text!.substring(to: endIndex))!
                } else {
                    val = nil
                }
                
            default:
                val = nil
            }
            
            if let value = val {
                for cell in tableViewVC.cells {
                    if cell == focusedCell {
                        let previousText = cell.numTextField.text!
                        if key != "del" {
                            if !(respondingTF.text!.contains(".") && key == "."){
                                cell.numTextField.text = previousText + key
                            }
                        }
                        else {
                            let endIndex = previousText.index(before: previousText.endIndex)
                            cell.numTextField.text = previousText.substring(to: endIndex)
                        }
                    }
                    else {
                        cell.numTextField.text = String(value * cell.rate)
                    }
                }
                // if clear
            }
            else {
                for cell in tableViewVC.cells {
                    cell.numTextField.text = nil
                    if cell == focusedCell {
                        cell.numTextField.placeholder = "100.0"
                    }
                    else {
                        cell.numTextField.placeholder = String(100 * cell.rate)}
                }
            }
            
        }
        
        //        responsingCell.numTextField.text = responsingCell.numTextField.text! + key
        // += fail, because getter needs unwrap
        
        //keyboardView?.observeValue(forKeyPath: <#T##String?#>, of: <#T##Any?#>, change: <#T##[NSKeyValueChangeKey : Any]?#>, context: <#T##UnsafeMutableRawPointer?#>)
        
        for cell in tableViewVC.cells {
            print(cell.rate)
        }
        print("------")
    }
    
    func updateRates(focusedCell:CXCMainTableViewCell) {
        // update rates
        focusedCell.rate = 1.0
        
        for cell in tableViewVC.cells {
            // skip focused cell
            if cell != focusedCell {
                let currency = focusedCell.currencyLabel.text! + "/" + cell.currencyLabel.text!
                let reversedCurrency = cell.currencyLabel.text! + "/" + focusedCell.currencyLabel.text!
                
                if let rate = currentCurrencyDict[currency] {
                    cell.rate = rate
                }
                    // reverse
                else if let rate = currentCurrencyDict[reversedCurrency] {
                    cell.rate = 1 / rate
                }
                    // calculate cross-rate
                else {
                    let currenyOne = "USD/" + focusedCell.currencyLabel.text!
                    let currencyTwo = "USD/" + cell.currencyLabel.text!
                    let rate = 1 / currentCurrencyDict[currenyOne]! * currentCurrencyDict[currencyTwo]!
                    cell.rate = Float(rate)
                    currentCurrencyDict.updateValue(cell.rate, forKey: focusedCell.currencyLabel.text! + "/" + cell.currencyLabel.text!)
                    //(1/美中) x 中日
                }
            }
        }
    }
    
    func setupConstraints() {
        keyboardView!.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self.view)
            make.height.equalTo(keyboardHeight)
        }
        
        tableViewVC.view.snp.makeConstraints { make in
            make.left.right.top.equalTo(self.view)
            make.bottom.equalTo(keyboardView!.snp.top)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

