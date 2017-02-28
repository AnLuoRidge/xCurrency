//
//  CXCMainTableViewController.swift
//  Copycat of xCurrency
//
//  Created by AnLuoRidge on 2/10/17.
//  Copyright © 2017 里脊. All rights reserved.
//

import UIKit


class CXCMainTableViewController: UITableViewController {
    static let cellReuseIdentifier = "reuseCell"
    
    var cells = [CXCMainTableViewCell]()
    var selectedCell: CXCMainTableViewCell?
    var textFields = [UITextField]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isScrollEnabled = false
        
        self.tableView.remembersLastFocusedIndexPath = true
        // Uncomment the following line to preserve selection between presentations
        self.tableView.register(CXCMainTableViewCell.self, forCellReuseIdentifier: CXCMainTableViewController.cellReuseIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        for cell in cells.enumerated() {
            cell.element.backgroundScrollView.setContentOffset(CGPoint(x: screenWidth, y:0), animated: false)
            
            // if switched
            if cell.element.currencyLabel.text != fourVisibleCurrencis[cell.offset].rawValue {
                fourVisibleCurrencis[cell.offset] = Currency(rawValue: cell.element.currencyLabel.text!)!
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CXCMainTableViewCell = tableView.dequeueReusableCell(withIdentifier: CXCMainTableViewController.cellReuseIdentifier, for: indexPath) as! CXCMainTableViewCell
        
        if cells.count < 4 {
            cell.numTextField.tag = 1000 + indexPath.row
            cells.append(cell)
            textFields.append(cell.numTextField)
            cell.delegate = self
        }
        
        let entity = CXCCurrencyModel(currency: fourVisibleCurrencis[indexPath.row])
        cell.configureCell(entity: entity)
        
        // get rate
        let one = "USD/" + (cells.first?.currencyLabel.text)!
        let two = "USD/" + entity.currency
        if currentCurrencyDict[one] != nil && currentCurrencyDict[two] != nil {
            cell.rate = 1 / currentCurrencyDict[one]! * currentCurrencyDict[two]!
        } else {
            cell.rate = 1
        }
        
        // force enter editting mode
        if indexPath.row == 0 {
            cell.numTextField.becomeFirstResponder()
            cell.numTextField.placeholder = "100.0"
        } else {
            cell.numTextField.placeholder = String(100 * cell.rate)
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return mainCellRowHeight
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        textFields[indexPath.row].becomeFirstResponder()
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // block swipe delete
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension CXCMainTableViewController: MainTableViewCellDelegate {
    
    func rightSwipeAction(cell: CXCMainTableViewCell) {
        self.navigationController?.pushViewController(CXCCurrencySelectionTableViewController(fromCell:cell), animated: true)
    }
    
    func leftSwipeAction(currency: String) {
        let correspondingCurrency:String!
        if currency != self.cells.first?.currencyLabel.text! {
            correspondingCurrency = currency
        } else {
            correspondingCurrency = "USD"
        }
        
        self.navigationController?.pushViewController(CXCRatesDetailViewController.init(currencyOne: (self.cells.first?.currencyLabel.text)!, currencyTwo: correspondingCurrency), animated: true)
    }
    
}
