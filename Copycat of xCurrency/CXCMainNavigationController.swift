//
//  CXCMainNavigationController.swift
//  Copycat of xCurrency
//
//  Created by AnLuoRidge on 2/19/17.
//  Copyright © 2017 里脊. All rights reserved.
//

import UIKit

class CXCMainNavigationController: UINavigationController {
    
//    lazy var leftBtn: UIBarButtonItem = {
//    let btn = UIBarButtonItem.init(image: UIImage.init(named: "btn_setting"), style: .plain, target: self, action: nil)
//        return btn
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.leftBarButtonItem = leftBtn
        self.pushViewController(CXCMainViewController(), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
