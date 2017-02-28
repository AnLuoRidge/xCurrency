//
//  CXCHistoricalRateViewController.swift
//  Copycat of xCurrency
//
//  Created by AnLuoRidge on 2/21/17.
//  Copyright © 2017 里脊. All rights reserved.
//

import UIKit

class CXCRatesDetailViewController: UIViewController {
    
    var currencyOne: CXCCurrencyModel
    var currencyTwo: CXCCurrencyModel
    
    init(currencyOne one:String, currencyTwo two:String) {
        //        self.init()
        currencyOne = CXCCurrencyModel.init(currency: Currency(rawValue: one)!)
        currencyTwo = CXCCurrencyModel.init(currency: Currency(rawValue: two)!)
        super.init(nibName: nil, bundle: nil)
        self.title = NSLocalizedString("Rates Details", comment: "")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        self.edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        let mainView = CXCRatesDetailView.init(currencyOne:currencyOne, currencyTwo: currencyTwo)
        mainView.frame = self.view.bounds
        self.view.addSubview(mainView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
