//
//  CXCCurrencyModel.swift
//  Copycat of xCurrency
//
//  Created by AnLuoRidge on 2/10/17.
//  Copyright © 2017 里脊. All rights reserved.
//

import UIKit

class CXCCurrencyModel: NSObject {

    let flagImage: UIImage
    let fullName: String
    let currency: String
    let symbol: String
    let type:Currency
    
    init(currency: Currency) {
        self.currency = currency.rawValue
        type = currency
        fullName = fullNameDict[self.currency]!
        flagImage = UIImage.init(named: self.currency)!
        symbol = symbolDict[self.currency]!
    }
    
    convenience init(currencyEntity: Currency) {
        self.init(currency: currencyEntity)
    }

}
