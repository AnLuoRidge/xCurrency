//
//  CXCMainTableViewCell.swift
//  Copycat of xCurrency
//
//  Created by AnLuoRidge on 2/10/17.
//  Copyright © 2017 里脊. All rights reserved.
//

import UIKit

protocol MainTableViewCellDelegate: NSObjectProtocol {
    func leftSwipeAction(currency: String)
    func rightSwipeAction(cell:CXCMainTableViewCell)
}

class CXCMainTableViewCell: UITableViewCell {
    
    let cellWidth = screenWidth
    weak var delegate:MainTableViewCellDelegate?
    
    lazy var backgroundScrollView:UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    lazy var rightView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#8891A7")
        return view
    }()
    
    lazy var ratesDetailsImageView:UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "汇率详情"))
//        view.backgroundColor = .clear
        return view
    }()
    
    lazy var ratesDetailsLabel:UILabel = {
        let lbl = UILabel()
//        lbl.backgroundColor = .clear
        lbl.text = NSLocalizedString("Rates Details", comment: "")
        lbl.font = UIFont.systemFont(ofSize: 16.0)
        lbl.textColor = .white
        return lbl
    }()
    
    lazy var switchCurrencyImageView:UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "汇率转换"))
//        view.backgroundColor = .clear
        return view
    }()
    
    lazy var switchCurrencyLabel:UILabel = {
        let lbl = UILabel()
//        lbl.backgroundColor = .clear
        lbl.text = NSLocalizedString("Switch Currency", comment: "")
        lbl.font = UIFont.systemFont(ofSize: 16.0)
        lbl.textColor = .white
        return lbl
    }()
    
    lazy var middleView:UIView = {
        let view = UIView()
//        view.backgroundColor = .clear
        return view
    }()
    
    lazy var leftView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#8891A7")
        return view
    }()
    
    var flagImageView = UIImageView()
    var currencyLabel = UILabel()
    
    lazy var numTextField: UITextField =  {
        let tf = UITextField()
        tf.textAlignment = .right
        tf.font = UIFont.systemFont(ofSize: 18.0)
        tf.inputView = UIView()
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
        let selectedBackgroundView = UIView()
        selectedBackgroundView.backgroundColor = UIColor(hex: "#F2F4F7")
        self.selectedBackgroundView = selectedBackgroundView
        numTextField.delegate = self
        UITextField.appearance().tintColor = UIColor(hex: "#2CC17B")
        backgroundScrollView.delegate = self
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(entity: CXCCurrencyModel) {
        flagImageView.image = entity.flagImage
        currencyLabel.text = entity.currency
        fullNameLabel.text = entity.fullName + " " + entity.symbol
    }
    
    func addSubviews() {
        self.contentView.addSubview(backgroundScrollView)
        backgroundScrollView.addSubview(leftView)
        backgroundScrollView.addSubview(middleView)
        backgroundScrollView.addSubview(rightView)
        leftView.addSubview(switchCurrencyLabel)
        leftView.addSubview(switchCurrencyImageView)
        rightView.addSubview(ratesDetailsLabel)
        rightView.addSubview(ratesDetailsImageView)
        middleView.addSubview(flagImageView)
        middleView.addSubview(currencyLabel)
        middleView.addSubview(numTextField)
        middleView.addSubview(fullNameLabel)
    }
    
    func setupConstraints() {
        
        backgroundScrollView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(backgroundScrollView.superview!)
        }
        backgroundScrollView.contentSize = CGSize(width: cellWidth * 3, height: 0)
        backgroundScrollView.contentOffset = CGPoint(x: cellWidth, y: 0)
        
        leftView.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.width.height.centerY.equalTo(self.contentView)
        }
        
        switchCurrencyLabel.snp.makeConstraints { make in
            make.right.equalTo(switchCurrencyLabel.superview!).offset(-26.xppi)
            make.centerY.equalTo(self.contentView)
        }
        
        switchCurrencyImageView.snp.makeConstraints { make in
            make.right.equalTo(switchCurrencyLabel.snp.left).offset(-16.xppi)
            make.centerY.equalTo(self.contentView)
        }
        
        middleView.snp.makeConstraints { make in
            make.left.equalTo(cellWidth)
            make.width.height.centerY.equalTo(self.contentView)
        }
        
        rightView.snp.makeConstraints { make in
            make.left.equalTo(cellWidth * 2)
            make.width.height.centerY.equalTo(self.contentView)
        }
        
        ratesDetailsLabel.snp.makeConstraints { make in
            make.left.equalTo(ratesDetailsLabel.superview!).offset(27.xppi)
            make.centerY.equalTo(self.contentView)
        }
        
        ratesDetailsImageView.snp.makeConstraints { make in
            make.left.equalTo(ratesDetailsLabel.snp.right).offset(16.xppi)
            make.centerY.equalTo(self.contentView)
        }
        
        flagImageView.snp.makeConstraints { make in
            make.centerY.equalTo(flagImageView.superview!)
            make.left.equalTo(flagImageView.superview!).offset(18.xppi)
            make.width.height.equalTo(42.xppi)
        }
        
        currencyLabel.snp.makeConstraints { make in
            make.centerY.equalTo(currencyLabel.superview!)
            make.left.equalTo(flagImageView.snp.right).offset(10.xppi)
            make.width.equalTo(100.xppi)
            make.height.equalTo(20.yppi)
        }
        
        numTextField.snp.makeConstraints { make in
            make.centerY.equalTo(numTextField.superview!).offset(-5.yppi)
            make.right.equalTo(numTextField.superview!).offset(-29.0.xppi)
            make.width.equalTo(100.xppi)
            make.height.equalTo(28.yppi)
        }
        
        fullNameLabel.snp.makeConstraints { make in
            make.top.equalTo(numTextField.snp.bottom)
            make.right.equalTo(fullNameLabel.superview!).offset(-18.xppi)
            make.width.equalTo(150.xppi)
            make.height.equalTo(17.yppi)
        }
    }
    
}

extension CXCMainTableViewCell: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // right swipe over
        if scrollView.contentOffset.x <= cellWidth - 80.xppi {
            scrollView.setContentOffset(CGPoint.zero, animated: false)
        }
        // left swipe over
        if scrollView.contentOffset.x >= cellWidth + 80.xppi {
            scrollView.setContentOffset(CGPoint(x:cellWidth * 2, y: 0), animated: false)
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if targetContentOffset.pointee.x == 0 {
            
            delegate?.rightSwipeAction(cell: self)
        }
        if targetContentOffset.pointee.x == cellWidth * 2 {
            delegate?.leftSwipeAction(currency: self.currencyLabel.text!)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if scrollView.contentOffset.x > cellWidth - 80.xppi && scrollView.contentOffset.x < cellWidth {
            scrollView.setContentOffset(CGPoint.init(x: cellWidth, y: 0), animated: false)
        }
        
        if scrollView.contentOffset.x < cellWidth + 80.xppi && scrollView.contentOffset.x > cellWidth {
            scrollView.setContentOffset(CGPoint.init(x: cellWidth, y: 0), animated: false)
        }
        
    }
    
}

extension CXCMainTableViewCell:UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.setSelected(true, animated: true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.setSelected(false, animated: true)
    }
}
