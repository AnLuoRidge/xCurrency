//
//  KeyboardView.swift
//  Copycat of xCurrency
//
//  Created by AnLuoRidge on 2/9/17.
//  Copyright © 2017 里脊. All rights reserved.
//

import UIKit
import SnapKit

@objc protocol CXCKeyboardDelegate: NSObjectProtocol {
    func proceedTextFromKeyboard(sender: UIButton)// text: String
}

class CXCKeyboardView: UIView {
    
    weak var delegate: CXCKeyboardDelegate?
    
    lazy var oneBtn: UIButton = {
        let btn = UIButton.init(type: .system)
        btn.setTitle("1", for: .normal)
        btn.setTitleColor(.clear, for: .normal)
        btn.setBackgroundImage(UIImage.init(named: "number_key_1"), for: .normal)
        let view = UIView.init(frame: CGRect.init(x: 30, y: 30, width: 15, height: 24))
        view.backgroundColor = .red
        btn.addSubview(view)
        return btn
    }()
    
    lazy var twoBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("2", for: .normal)
        btn.setTitleColor(.clear, for: .normal)
        btn.setImage(UIImage.init(named: "number_key_2"), for: .normal)
        return btn
    }()
    
    lazy var threeBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("3", for: .normal)
        btn.setTitleColor(.clear, for: .normal)
        btn.setImage(UIImage.init(named: "number_key_3"), for: .normal)
        return btn
    }()
    
    lazy var fourBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("4", for: .normal)
        btn.setTitleColor(.clear, for: .normal)
        btn.setImage(UIImage.init(named: "number_key_4"), for: .normal)
        return btn
    }()

    lazy var fiveBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("5", for: .normal)
        btn.setTitleColor(.clear, for: .normal)
        btn.setImage(UIImage.init(named: "number_key_5"), for: .normal)
        return btn
    }()
    
    lazy var sixBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("6", for: .normal)
        btn.setTitleColor(.clear, for: .normal)
        btn.setImage(UIImage.init(named: "number_key_6"), for: .normal)
        return btn
    }()
    
    lazy var sevenBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("7", for: .normal)
        btn.setTitleColor(.clear, for: .normal)
        btn.setImage(UIImage.init(named: "number_key_7"), for: .normal)
        return btn
    }()
    
    lazy var eightBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("8", for: .normal)
        btn.setTitleColor(.clear, for: .normal)
        btn.setImage(UIImage.init(named: "number_key_8"), for: .normal)
        return btn
    }()
    
    lazy var nineBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("9", for: .normal)
        btn.setTitleColor(.clear, for: .normal)
        btn.setImage(UIImage.init(named: "number_key_9"), for: .normal)
        return btn
    }()
    
    lazy var zeroBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("0", for: .normal)
        btn.setTitleColor(.clear, for: .normal)
        btn.setImage(UIImage.init(named: "number_key_0"), for: .normal)
        return btn
    }()
    
    lazy var dotBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle(".", for: .normal)
        btn.setTitleColor(.clear, for: .normal)
        btn.setImage(UIImage.init(named: "number_key_14"), for: .normal)
        return btn
    }()
    
    lazy var plusBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("+", for: .normal)
        btn.setTitleColor(.clear, for: .normal)
        btn.setImage(UIImage.init(named: "number_key_11"), for: .normal)
        return btn
    }()
    
    lazy var minusBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("-", for: .normal)
        btn.setTitleColor(.clear, for: .normal)
        btn.setImage(UIImage.init(named: "number_key_12"), for: .normal)
        return btn
    }()
    
    lazy var multiplyBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("*", for: .normal)
        btn.setTitleColor(.clear, for: .normal)
        btn.setImage(UIImage.init(named: "number_key_13"), for: .normal)
        return btn
    }()
    
    lazy var divideBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("/", for: .normal)
        btn.setTitleColor(.clear, for: .normal)
        btn.setImage(UIImage.init(named: "number_key_16"), for: .normal)
        return btn
    }()
    
    lazy var delBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitle("del", for: .normal)
        btn.setTitleColor(.clear, for: .normal)
        btn.setImage(UIImage.init(named: "number_key_15"), for: .normal)
        return btn
    }()
    
    var btns = [UIButton]()
    
    init(delegate:CXCKeyboardDelegate) {
        self.delegate = delegate
        super.init(frame: CGRect.zero)
        self.backgroundColor = .gray
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() {
        btns = [zeroBtn, oneBtn, twoBtn, threeBtn, fourBtn, fiveBtn, sixBtn, sevenBtn, eightBtn, nineBtn, dotBtn, delBtn]
        for btn in btns {
        btn.addTarget(delegate, action: #selector(delegate?.proceedTextFromKeyboard(sender:)), for: .touchUpInside)
            addSubview(btn)
        }
        addSubview(plusBtn)
        addSubview(minusBtn)
        addSubview(multiplyBtn)
        addSubview(divideBtn)
    }
    
    func setupConstraints() {
        let btnWidth =  screenWidth / 4// self.bounds.width
        let btnHeight = 280 / 4 * yppi// self.bounds.height
        
        // 7
        sevenBtn.snp.makeConstraints { (make) in
            make.left.top.equalTo(self)
            make.height.equalTo(btnHeight)
            make.width.equalTo(btnWidth)
        }
        // 8
        eightBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.left.equalTo(sevenBtn.snp.right)
            make.height.equalTo(btnHeight)
            make.width.equalTo(btnWidth)
        }
        // 9
        nineBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.left.equalTo(eightBtn.snp.right)
            make.height.equalTo(btnHeight)
            make.width.equalTo(btnWidth)
        }
        // +
        plusBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.left.equalTo(nineBtn.snp.right)
            make.height.equalTo(btnHeight)
            make.width.equalTo(btnWidth)
        }
        // 4
        fourBtn.snp.makeConstraints { (make) in
            make.top.equalTo(sevenBtn.snp.bottom)
            make.left.right.equalTo(sevenBtn)
            make.height.equalTo(btnHeight)
        }
        // 1
        oneBtn.snp.makeConstraints { make in
            make.left.right.equalTo(sevenBtn)
            make.top.equalTo(fourBtn.snp.bottom)
            make.height.equalTo(btnHeight)
        }
        // .
        dotBtn.snp.makeConstraints { make in
            make.left.right.equalTo(sevenBtn)
            make.top.equalTo(oneBtn.snp.bottom)
            make.height.equalTo(btnHeight)
        }
        // 5
        fiveBtn.snp.makeConstraints { make in
            make.left.right.equalTo(eightBtn)
            make.top.equalTo(eightBtn.snp.bottom)
            make.height.equalTo(btnHeight)
        }
        // 2
        twoBtn.snp.makeConstraints { make in
            make.left.right.equalTo(eightBtn)
            make.top.equalTo(fiveBtn.snp.bottom)
            make.height.equalTo(btnHeight)
        }
        // 0
        zeroBtn.snp.makeConstraints { make in
            make.left.right.equalTo(eightBtn)
            make.top.equalTo(twoBtn.snp.bottom)
            make.height.equalTo(btnHeight)
        }
        // 6
        sixBtn.snp.makeConstraints { make in
            make.left.right.equalTo(nineBtn)
            make.top.equalTo(nineBtn.snp.bottom)
            make.height.equalTo(btnHeight)
        }
        // 3
        threeBtn.snp.makeConstraints { make in
            make.left.right.equalTo(nineBtn)
            make.top.equalTo(sixBtn.snp.bottom)
            make.height.equalTo(btnHeight)
        }
        // del
        delBtn.snp.makeConstraints { make in
            make.left.right.equalTo(nineBtn)
            make.top.equalTo(threeBtn.snp.bottom)
            make.height.equalTo(btnHeight)
        }
        // -
        minusBtn.snp.makeConstraints { make in
            make.left.right.equalTo(plusBtn)
            make.top.equalTo(plusBtn.snp.bottom)
            make.height.equalTo(btnHeight)
        }
        // *
        multiplyBtn.snp.makeConstraints { make in
            make.left.right.equalTo(plusBtn)
            make.top.equalTo(minusBtn.snp.bottom)
            make.height.equalTo(btnHeight)
        }
        // /
        divideBtn.snp.makeConstraints { make in
            make.left.right.equalTo(plusBtn)
            make.top.equalTo(multiplyBtn.snp.bottom)
            make.height.equalTo(btnHeight)
        }
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
