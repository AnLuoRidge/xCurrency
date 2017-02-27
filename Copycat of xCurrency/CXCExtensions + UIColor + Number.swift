//
//  CXCExtensions + UIColor + Number.swift
//  Copycat of xCurrency
//
//  Created by AnLuoRidge on 2/27/17.
//  Copyright © 2017 里脊. All rights reserved.
//

import UIKit

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
