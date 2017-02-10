//
//  KeyboardView.swift
//  Copycat of xCurrency
//
//  Created by AnLuoRidge on 2/9/17.
//  Copyright © 2017 里脊. All rights reserved.
//

import UIKit

protocol CXCKeyboardDelegate {
    func proceedTextFromKeyboard(text: String)
}

class CXCKeyboardView: UIView {
    
    let delegate:CXCKeyboardDelegate
    
    init(delegate:CXCKeyboardDelegate) {
        self.delegate = delegate
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func <#name#>(<#parameters#>) -> <#return type#> {
//        let btn = UIButton()
//        btn.addTarget(delegate, action: proceed, for: UIControlEvents.touchUpInside)
//    }
    //fomulaTextField.text = "d"
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
