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
    var numTextField = UITextField()
    var fullNameLabel = UILabel()
    var rate: Float = 1.0

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func configureCell(entity: CXCCurrencyModel) {
        flagImageView.image = entity.flagImage
//        currencyLabel = UILabel()
        currencyLabel.text = entity.currency
        fullNameLabel.text = entity.fullName
        
    }
    
//    init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        <#code#>
//    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
