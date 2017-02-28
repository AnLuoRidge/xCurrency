//
//  CXCMainNavigationController.swift
//  Copycat of xCurrency
//
//  Created by AnLuoRidge on 2/19/17.
//  Copyright © 2017 里脊. All rights reserved.
//

import UIKit

class CXCMainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.tintColor = UIColor(hex: "#99A4BF 100%")
        self.pushViewController(CXCMainViewController(), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
