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
    case XAU = "XAU"
    case XAG = "XAG"
}

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height
let xppi = screenWidth / 375
let yppi = screenHeight / 667
let keyboardHeight: CGFloat = CGFloat(280.0.yppi)
let dateButtonSelectedColor = UIColor(hex: "#29B774")
let dateButtonNormalColor = UIColor(hex: "#99A4BF")

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
extension UIColor {
    convenience init(hex: String) {
        let hexWithoutSharp = hex.substring(from: hex.index(after: hex.startIndex))
        let scanner = Scanner(string: hexWithoutSharp)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
/*
 extension UIColor {
 convenience init(red: Int, green: Int, blue: Int) {
 assert(red >= 0 && red <= 255, "Invalid red component")
 assert(green >= 0 && green <= 255, "Invalid green component")
 assert(blue >= 0 && blue <= 255, "Invalid blue component")
 
 self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
 }
 
 convenience init(netHex:Int) {
 self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
 }
 }
 */
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
let symbolDict = ["CNY":"￥", "USD": "$", "AUD":"$", "JPY":"￥"]

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
    
    convenience init(currencyEntity: Currency) {
        self.init(currency: currencyEntity)
    }

}
