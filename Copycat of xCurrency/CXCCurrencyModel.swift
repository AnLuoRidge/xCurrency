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
    case AUD = "AUD"
    case JPY = "JPY"
}

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

let fullNameDict = ["CNY":"China", "USD": "United", "AUD":"Australia", "JPY": "Japan"]

var currentCurrencyDict:[String:Float] = ["CNY/USD":1/6, "CNY/AUD":1/4, "CNY/JPY":14, "USD/CNY":6.8665, "USD/AUD":1.2968, "USD/JPY":113.393]

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
