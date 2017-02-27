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
    // DEBUG
    let testCurrencis = [Currency.CNY, Currency.USD, Currency.EUR, Currency.HKD]
    
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

        // DEBUG
        let entity = CXCCurrencyModel.init(currency: testCurrencis[indexPath.row])
        cell.rate = Float(textFieldIndex - 999)
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

    static let rowHeight = (screenHeight - 58.yppi - 280.yppi) / 4
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CXCMainTableViewController.rowHeight
    }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        selectedCell = tableView.cellForRow(at: indexPath) as! CXCMainTableViewCell
        let action = UITableViewRowAction.init(style: UITableViewRowActionStyle.default, title: NSLocalizedString("choose currency", comment: "")) { (action, indexPath) in
            self.navigationController?.pushViewController(CXCCurrencySelectionTableViewController(), animated: true)
        }
        action.backgroundColor = .green
        
        let rateHistory = UITableViewRowAction.init(style: UITableViewRowActionStyle.default, title: NSLocalizedString("rateHistory", comment: "")) { (action, indexPath) in
            
            var selectedCell:CXCMainTableViewCell
            if indexPath.row != 0 {
                selectedCell = tableView.cellForRow(at: indexPath) as! CXCMainTableViewCell
            } else {
                selectedCell = self.cells[1]
            }
            
self.navigationController?.pushViewController(CXCRatesDetailViewController.init(currencyOne: (self.cells.first?.currencyLabel.text)!, currencyTwo: selectedCell.currencyLabel.text!), animated: true)
        }
        rateHistory.backgroundColor = .blue
        
        return [action, rateHistory]
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
