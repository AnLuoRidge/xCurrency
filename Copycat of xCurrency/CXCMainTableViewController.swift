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
    var textFieldIndex = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView = UITableView.init(frame: self.view.bounds, style: .grouped)
self.tableView.isScrollEnabled = false
        
        self.tableView.remembersLastFocusedIndexPath = true
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        self.tableView.register(CXCMainTableViewCell.self, forCellReuseIdentifier: CXCMainTableViewController.cellReuseIdentifier)
        
        //self.tableView.set

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func viewWillAppear(_ animated: Bool) {
//        fourVisibleCurrencis.removeAll()
        for cell in cells.enumerated() {
            cell.element.backgroundScrollView.setContentOffset(CGPoint(x: screenWidth, y:0), animated: false)
            // if switched
            if cell.element.currencyLabel.text != fourVisibleCurrencis[cell.offset].rawValue {
                fourVisibleCurrencis[cell.offset] = Currency(rawValue: cell.element.currencyLabel.text!)!
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesBegan(touches, with: event)
//        if let point = touches.first?.location(in: self.tableView) {
//            let cell = tableView.cellForRow(at: tableView.indexPathForRow(at: point)!)
//            print(cell.)
//        }
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CXCMainTableViewCell = tableView.dequeueReusableCell(withIdentifier: CXCMainTableViewController.cellReuseIdentifier, for: indexPath) as! CXCMainTableViewCell
        //cell.numTextField.delegate = self.presentingViewController as! UITextFieldDelegate?
        cell.numTextField.tag = textFieldIndex
        textFieldIndex += 1
        cells.append(cell)
        textFields.append(cell.numTextField)
        cell.delegate = self
        // DEBUG
        let entity = CXCCurrencyModel(currency: fourVisibleCurrencis[indexPath.row])
        if let rate = currentCurrencyDict[entity.currency] {
            cell.rate = rate
        } else {
        cell.rate = 1.0
        }
        
        // DEBUG
        cell.configureCell(entity: entity)
//self.presentingViewController
        // Configure the cell...
    //cell.contentView.backgroundColor = .blue

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
//        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // block swipe delete
        return false
    }

}

extension CXCMainTableViewController: MainTableViewCellDelegate {
    
    func rightSwipeAction(cell: CXCMainTableViewCell) {
        self.navigationController?.pushViewController(CXCCurrencySelectionTableViewController(fromCell:cell), animated: true)
    }
    
    func leftSwipeAction(currency: String) {
        //        var focusedCell:CXCMainTableViewCell
        let correspondingCurrency:String!
        if currency != self.cells.first?.currencyLabel.text! {
            correspondingCurrency = currency
            //            focusedCell = tableView.cellForRow(at: indexPath) as! CXCMainTableViewCell
        } else {
            correspondingCurrency = "USD"
        }
        
        self.navigationController?.pushViewController(CXCRatesDetailViewController.init(currencyOne: (self.cells.first?.currencyLabel.text)!, currencyTwo: correspondingCurrency), animated: true)
    }
    
}
