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
    static var commonCurrencies = [CXCCurrencyModel.init(currency: .CNY),
                CXCCurrencyModel.init(currency: .USD),
                CXCCurrencyModel.init(currency: .JPY),
                CXCCurrencyModel.init(currency: .AUD),
                ]
    static let preciousCurrencies = [CXCCurrencyModel(currencyEntity: .XAU), CXCCurrencyModel(currencyEntity: .XAG)]
    static let aCurrencies = [CXCCurrencyModel(currencyEntity: .AUD)]
    static let bCurrencies = [CXCCurrencyModel(currencyEntity: .BTC)]
    static let cCurrencies = [CXCCurrencyModel(currencyEntity: .CNY)]
    static let dCurrencies = [CXCCurrencyModel(currencyEntity: .DKK)]
    static let eCurrencies = [CXCCurrencyModel(currencyEntity: .EUR)]
    static let fCurrencies = [CXCCurrencyModel(currencyEntity: .FJD)]
    static let gCurrencies = [CXCCurrencyModel(currencyEntity: .XAU)]
    static let hCurrencies = [CXCCurrencyModel(currencyEntity: .HKD)]
    static let iCurrencies = [CXCCurrencyModel(currencyEntity: .INR)]
    static let jCurrencies = [CXCCurrencyModel(currencyEntity: .JPY)]
    static let kCurrencies = [CXCCurrencyModel(currencyEntity: .KES)]
    static let lCurrencies = [CXCCurrencyModel(currencyEntity: .LYD)]
    static let mCurrencies = [CXCCurrencyModel(currencyEntity: .MOP), CXCCurrencyModel(currencyEntity: .MWK)]
    static let nCurrencies = [CXCCurrencyModel(currencyEntity: .KPW)]
    static let oCurrencies = [CXCCurrencyModel(currencyEntity: .OMR)]
    static let pCurrencies = [CXCCurrencyModel(currencyEntity: .PAB)]
    static let qCurrencies = [CXCCurrencyModel(currencyEntity: .QAR)]
    static let rCurrencies = [CXCCurrencyModel(currencyEntity: .CNH)]
    static let sCurrencies = [CXCCurrencyModel(currencyEntity: .XAG)]
    static let tCurrencies = [CXCCurrencyModel(currencyEntity: .TWD)]
    static let uCurrencies = [CXCCurrencyModel(currencyEntity: .USD)]
    static let vCurrencies = [CXCCurrencyModel(currencyEntity: .VND)]
    static let yCurrencies = [CXCCurrencyModel(currencyEntity: .YER)]
    static let zCurrencies = [CXCCurrencyModel(currencyEntity: .ZMW)]
    static let currencies = [commonCurrencies,
                             preciousCurrencies,
                             aCurrencies,
                             bCurrencies,
                             cCurrencies,
                             dCurrencies,
                             eCurrencies,
                             fCurrencies,
                             gCurrencies,
                             hCurrencies,
                             iCurrencies,
                             jCurrencies,
                             kCurrencies,
                             lCurrencies,
                             mCurrencies,
                             nCurrencies,
                             oCurrencies,
                             pCurrencies,
                             qCurrencies,
                             rCurrencies,
                             sCurrencies,
                             tCurrencies,
                             uCurrencies,
                             vCurrencies,
                             yCurrencies,
                             zCurrencies]


    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Switch Currency", comment: "")
        let blurView = UIVisualEffectView.init(frame: self.tableView.bounds)
        blurView.effect = UIBlurEffect.init(style: .extraLight)//(style: .dark)
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
        return ["#", "$", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "Y", "Z"]
    }
    
//    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
//        return index
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return CXCCurrencySelectionTableViewController.currencies.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CXCCurrencySelectionTableViewController.currencies[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: CXCCurrencySelectionTableViewController.reuseIdentifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .value1, reuseIdentifier: CXCCurrencySelectionTableViewController.reuseIdentifier)
        }
        cell?.backgroundColor = .clear
        cell?.contentView.backgroundColor = .clear
        let entity = CXCCurrencySelectionTableViewController.currencies[indexPath.section][indexPath.row]
        cell!.textLabel?.text = entity.fullName + " - " + entity.currency
//        cell?.textLabel?.textColor = .white// xC
        
        cell?.detailTextLabel?.text = "???"
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "nil"
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel.init()

        switch section {
        case 0:
            label.text = NSLocalizedString("    Common Currency", comment: "")
        case 1:
            label.text = NSLocalizedString("    Precious Currency", comment: "")
        case 2:
            label.text = NSLocalizedString("    A", comment: "")
        case 3:
            label.text = NSLocalizedString("    B", comment: "")
        case 4:
            label.text = NSLocalizedString("    C", comment: "")
        case 5:
            label.text = NSLocalizedString("    D", comment: "")
        case 6:
            label.text = NSLocalizedString("    E", comment: "")
        case 7:
            label.text = NSLocalizedString("    F", comment: "")
        case 8:
            label.text = NSLocalizedString("    G", comment: "")
        case 9:
            label.text = NSLocalizedString("    H", comment: "")
        case 10:
            label.text = NSLocalizedString("    I", comment: "")
        case 11:
            label.text = NSLocalizedString("    J", comment: "")
        case 12:
            label.text = NSLocalizedString("    K", comment: "")
        case 13:
            label.text = NSLocalizedString("    L", comment: "")
        case 14:
            label.text = NSLocalizedString("    M", comment: "")
        case 15:
            label.text = NSLocalizedString("    N", comment: "")
        case 16:
            label.text = NSLocalizedString("    O", comment: "")
        case 17:
            label.text = NSLocalizedString("    P", comment: "")
        case 18:
            label.text = NSLocalizedString("    Q", comment: "")
        case 19:
            label.text = NSLocalizedString("    R", comment: "")
        case 20:
            label.text = NSLocalizedString("    S", comment: "")
        case 21:
            label.text = NSLocalizedString("    T", comment: "")
        case 22:
            label.text = NSLocalizedString("    U", comment: "")
        case 23:
            label.text = NSLocalizedString("    V", comment: "")
        case 24:
            label.text = NSLocalizedString("    Y", comment: "")
        case 25:
            label.text = NSLocalizedString("    Z", comment: "")
        default:
break
        }
        label.backgroundColor = UIColor(hex: "#E6EAF2")
        label.textColor = UIColor(hex: "#8891A7")
        
        return label
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var parentVC:CXCMainViewController
        for vc in self.navigationController!.viewControllers {
            if vc is CXCMainViewController {
                parentVC = vc as! CXCMainViewController
                parentVC.tableViewVC.selectedCell?.configureCell(entity:CXCCurrencySelectionTableViewController.currencies[indexPath.section][indexPath.row])
            }
        }
        //let parentVC = self.navigationController?.presentingViewController//self.presentingViewController as! CXCMainViewController
        // parentVC.tableViewVC.testCurrencis ...
//        let cell = tableView.cellForRow(at: indexPath)
        
        let _ = self.navigationController?.popViewController(animated: true)
        
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
