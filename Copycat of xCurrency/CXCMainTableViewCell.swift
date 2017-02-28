//
//  CXCMainTableViewCell.swift
//  Copycat of xCurrency
//
//  Created by AnLuoRidge on 2/10/17.
//  Copyright © 2017 里脊. All rights reserved.
//

import UIKit

class CXCMainTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    //    override func awakeFromNib() {
    //        super.awakeFromNib()
    //        // Initialization code
    //    }
    var flagImageView = UIImageView()
    var currencyLabel = UILabel()
//    var fomulaTextField = UITextField()
    lazy var numTextField: UITextField =  {
        //get {
        let tf = UITextField()
        tf.textAlignment = .right
        tf.font = UIFont.systemFont(ofSize: 18.0)
        return tf
    }()
    
    lazy var fullNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14.0)
        lbl.textAlignment = .right
        return lbl
    }()
    
    var rate: Float = 1.0
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        numTextField.delegate = self
        UITextField.appearance().tintColor = UIColor(hex: "#2CC17B")
        self.contentView.addSubview(flagImageView)
        self.contentView.addSubview(currencyLabel)
        self.contentView.addSubview(numTextField)
        self.contentView.addSubview(fullNameLabel)
        
        setupConstraints()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(entity: CXCCurrencyModel) {
        flagImageView.image = entity.flagImage
        //        currencyLabel = UILabel()
        currencyLabel.text = entity.currency
        fullNameLabel.text = entity.fullName + " " + entity.symbol
    }
    
    func setupConstraints() {
        
        flagImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(self.contentView).offset(18.xppi)
            make.width.height.equalTo(42.xppi)
        }
        
        currencyLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(flagImageView.snp.right).offset(10.xppi)
            make.width.equalTo(100.xppi)
            make.height.equalTo(20.yppi)
        }

        numTextField.snp.makeConstraints { make in
            make.centerY.equalTo(self.contentView).offset(-5.yppi)
            make.right.equalTo(self.contentView).offset(-29.0.xppi)
            make.width.equalTo(100.xppi)
            make.height.equalTo(28.yppi)
        }

        fullNameLabel.snp.makeConstraints { make in
            make.top.equalTo(numTextField.snp.bottom)
            make.right.equalTo(self.contentView).offset(-18.xppi)
            make.width.equalTo(150.xppi)
            make.height.equalTo(17.yppi)
        }
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let cell = textField.superview?.superview as! CXCMainTableViewCell
        cell.setSelected(true, animated: true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let cell = textField.superview?.superview as! CXCMainTableViewCell
        cell.setSelected(false, animated: true)
    }
    
}
