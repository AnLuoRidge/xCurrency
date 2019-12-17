//
//  MainViewController.swift
//  Copycat of xCurrency
//
//  Created by AnLuoRidge on 2/9/17.
//  Copyright © 2017 里脊. All rights reserved.
//

import UIKit

class CXCMainViewController: UIViewController, CXCKeyboardDelegate {
    
    var keyboardView: CXCKeyboardView? // how to init at init?
    var tableViewVC = CXCMainTableViewController()
    
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
    
    lazy var leftNaviBtn: UIBarButtonItem = {
        let btn = UIBarButtonItem.init(image: UIImage.init(named: "btn_setting"), style: .plain, target: self, action: nil)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.edgesForExtendedLayout = []
        self.title = NSLocalizedString("xCurrency", comment: "")
        self.navigationItem.leftBarButtonItem = leftNaviBtn
        self.view.backgroundColor = .white
        keyboardView = CXCKeyboardView.init(delegate: self)
        self.view.addSubview(keyboardView!)
        self.addChild(tableViewVC)
        self.view.addSubview(tableViewVC.view)
        
        if !CXCNetworking.firstLoaded {
            CXCNetworking.getAllCurrentCurrenciesData {
                DispatchQueue.main.sync {
                    self.tableViewVC.tableView.reloadData()
                }
            }
        }
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableViewVC.tableView.reloadData()
    }
    
    func proceedTextFromKeyboard(sender: UIButton) {
        if let respondingTF = respondingTextField {
            let focusedCell = getFocusedCell(fromFocusedTextField: respondingTF)
            // If user turns to another text field
            if previousRespondingTextField != respondingTF {
                previousRespondingTextField = respondingTF
                updateRates(focusedCell: focusedCell)
            }
            
            let key = sender.title(for: .normal)!
            let val: Float?
            
            switch key {
            case "0"..."9":
                val = Float(respondingTF.text! + key)!
            case ".":
                val = Float(respondingTF.text!)
            case "del":
                if respondingTF.text != nil {
                    let endIndex = respondingTF.text!.index(before: respondingTF.text!.endIndex)
                    val = Float(respondingTF.text![..<endIndex])!
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
                        } else {
                            let endIndex = previousText.index(before: previousText.endIndex)
                            cell.numTextField.text = String(previousText[..<endIndex])
                        }
                    } else {
                        var result = String(value * cell.rate)
                        if result.count > 6 {
                            let endIndex = result.index(result.startIndex, offsetBy: 6)
                            result = String(result[...endIndex])
                        }
                        cell.numTextField.text = result
                    }
                }
                // TODO: clear if-else hell
            } else {
                for cell in tableViewVC.cells {
                    cell.numTextField.text = nil
                    if cell == focusedCell {
                        cell.numTextField.placeholder = "100.0"
                    } else {
                        cell.numTextField.placeholder = String(100 * cell.rate)}
                }
            }
        }
    }
    
    func updateRates(focusedCell: CXCMainTableViewCell) {
        focusedCell.rate = 1.0
        
        for otherCell in tableViewVC.cells {
            // skip focused cell
            if otherCell != focusedCell {
                let currency = focusedCell.currencyLabel.text! + "/" + otherCell.currencyLabel.text!
                let reversedCurrency = otherCell.currencyLabel.text! + "/" + focusedCell.currencyLabel.text!
                
                if let rate = currentCurrencyDict[currency] {
                    otherCell.rate = rate
                } else if let rate = currentCurrencyDict[reversedCurrency] {
                    otherCell.rate = 1 / rate
                } else {
                    if otherCell.currencyLabel.text! == "USD"  {
                        otherCell.rate = 1.0
                    } else {
                        let currenyOne = "USD/" + focusedCell.currencyLabel.text!
                        let currencyTwo = "USD/" + otherCell.currencyLabel.text!
                        if focusedCell.currencyLabel.text! != "USD" {
                            if currentCurrencyDict[currenyOne] != nil && currentCurrencyDict[currencyTwo] != nil {
                            otherCell.rate = 1 / currentCurrencyDict[currenyOne]! * currentCurrencyDict[currencyTwo]!
                            } else {
                                otherCell.rate = 1.0
                            }
                        } else {
                            otherCell.rate = currentCurrencyDict[currencyTwo]!
                        }
                    }
                    // (1/AB) x BC
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
