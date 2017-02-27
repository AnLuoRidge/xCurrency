//
//  CXCConstants.swift
//  Copycat of xCurrency
//
//  Created by AnLuoRidge on 2/27/17.
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

let fullNameDict = ["CNY":"China", "USD": "United", "AUD":"Australia", "JPY": "Japan", "XAU":"Gold", "XAG":"Silver"]
let symbolDict = ["CNY":"￥", "USD": "$", "AUD":"$", "JPY":"￥"]

var currentCurrencyDict:[String:Float] = ["CNY/USD":1/6, "CNY/AUD":1/4, "CNY/JPY":14, "USD/CNY":6.8665, "USD/AUD":1.2968, "USD/JPY":113.393]



class CXCConstants: NSObject {

}
