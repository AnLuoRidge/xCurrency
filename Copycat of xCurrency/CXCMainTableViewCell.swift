//
//  CXCMainTableViewCell.swift
//  Copycat of xCurrency
//
//  Created by AnLuoRidge on 2/10/17.
//  Copyright © 2017 里脊. All rights reserved.
//

import UIKit

class CXCMainTableViewCell: UITableViewCell {
    
    //    override func awakeFromNib() {
    //        super.awakeFromNib()
    //        // Initialization code
    //    }
    var flagImageView = UIImageView()
    var currencyLabel = UILabel()
    var fomulaTextField = UITextField()
    lazy var numTextField: UITextField =  {
        //get {
        let tf = UITextField()
        tf.textAlignment = .right
        return tf
    }()
    var fullNameLabel: UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0)
        return label

    }
    var rate: Float = 1.0
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(flagImageView)
        self.contentView.addSubview(currencyLabel)
        self.contentView.addSubview(fullNameLabel)
        self.contentView.addSubview(numTextField)
        
        
        setupConstraints()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(entity: CXCCurrencyModel) {
        flagImageView.image = entity.flagImage
        //        currencyLabel = UILabel()
        currencyLabel.text = entity.currency
        fullNameLabel.text = entity.fullName
    }
    
    func setupConstraints() {
        flagImageView.frame = CGRect.init(x: 20, y: 30, width: 30, height: 30)
        currencyLabel.frame = CGRect.init(x: 60, y: 30, width: 50, height: 15)
        fullNameLabel.frame = CGRect.init(x: 300, y: 10, width: 30, height: 20)
        numTextField.frame = CGRect.init(x: 250, y: 30, width: 90, height: 30)
    }
    
    //    init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    //        <#code#>
    //    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
