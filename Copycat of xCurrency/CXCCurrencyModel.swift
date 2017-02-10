//
//  CXCCurrencyModel.swift
//  Copycat of xCurrency
//
//  Created by AnLuoRidge on 2/10/17.
//  Copyright © 2017 里脊. All rights reserved.
//

import UIKit

enum Currency: String  {
    case CNY = "CNY"
    case USD = "USD"
}

let fullNameDict = ["CNY":"China"]

class CXCCurrencyModel: NSObject {

    var flagImage: UIImage
    var fullName: String
    var currency: String
    
    init(currency: Currency) {
        self.currency = currency.rawValue
        self.fullName = fullNameDict[self.currency]!
        self.flagImage = UIImage.init(named: self.currency)!
    }

}
