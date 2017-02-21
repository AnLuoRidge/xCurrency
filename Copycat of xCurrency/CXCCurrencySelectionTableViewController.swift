//
//  CXCCurrencySelectionTableViewController.swift
//  Copycat of xCurrency
//
//  Created by AnLuoRidge on 2/19/17.
//  Copyright © 2017 里脊. All rights reserved.
//

import UIKit

class CXCCurrencySelectionTableViewController: UITableViewController {
    static let reuseIdentifier = "reuseIdentifier"
    let data = [CXCCurrencyModel.init(currency: .CNY),
                CXCCurrencyModel.init(currency: .USD),
                CXCCurrencyModel.init(currency: .JPY),
                CXCCurrencyModel.init(currency: .AUD),
                ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Choose Currency", comment: "")
        let blurView = UIVisualEffectView.init(frame: self.tableView.bounds)
        blurView.effect = UIBlurEffect.init(style: .dark)
        self.tableView.backgroundView = blurView
        
        self.tableView.sectionIndexMinimumDisplayRowCount = 1
        self.tableView.sectionIndexColor = .white
        self.tableView.sectionIndexBackgroundColor = .gray
        self.tableView.sectionIndexTrackingBackgroundColor = .black

        
        //
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ["C", "z", "xxx"]
    }
    
//    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
//        <#code#>
//    }
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
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: CXCCurrencySelectionTableViewController.reuseIdentifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .value1, reuseIdentifier: CXCCurrencySelectionTableViewController.reuseIdentifier)
        }
        cell?.backgroundColor = .clear
        cell?.contentView.backgroundColor = .clear
        let entity = data[indexPath.row]
        cell!.textLabel?.text = entity.fullName + " - " + entity.currency
        cell?.textLabel?.textColor = .white
        cell?.detailTextLabel?.text = "???"
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "nil"
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let label = UILabel.init()
        label.backgroundColor = .black
        label.textColor = .white
        label.text = "    Common Currency"
        
        return label
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let parentVC = self.presentingViewController as! CXCMainViewController
        // parentVC.tableViewVC.testCurrencis ...
//        let cell = tableView.cellForRow(at: indexPath)
        data[indexPath.row]
        self.navigationController?.popViewController(animated: true)
        
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
