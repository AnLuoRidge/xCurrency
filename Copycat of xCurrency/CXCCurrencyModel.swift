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
let xppi = screenWidth / 375
let yppi = screenHeight / 667

//extension Float {
//    static let widthUnit = Float(screenWidth / 375)
//    static let heightUnit = Float(screenHeight / 667)
//    var xppi:Float {
//        return self * .widthUnit
//    }
//    var yppi:Float {
//        return self * .heightUnit
//    }
//}

//extension CGFloat {
//    static let widthUnit = screenWidth / 375
//    static let heightUnit = screenHeight / 667
//    var xppi:CGFloat {
//        return self * .widthUnit
//    }
//    var yppi:CGFloat {
//        return self * .heightUnit
//    }
//}

extension Double {
    static let widthUnit = CGFloat(screenWidth / 375)
    static let heightUnit = CGFloat(screenHeight / 667)
    var xppi:CGFloat {
        return CGFloat(self) * Double.widthUnit
    }
    var yppi:CGFloat {
        return CGFloat(self) * Double.heightUnit
    }
}

extension Int {
    static let widthUnit = CGFloat(screenWidth / 375)
    static let heightUnit = CGFloat(screenHeight / 667)
    var xppi:CGFloat {
        return CGFloat(self) * Int.widthUnit
    }
    var yppi:CGFloat {
        return CGFloat(self) * Int.heightUnit
    }
}

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
