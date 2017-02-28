//
//  CXCCurrencyDetailView.swift
//  Copycat of xCurrency
//
//  Created by AnLuoRidge on 2/25/17.
//  Copyright © 2017 里脊. All rights reserved.
//

import UIKit

class CXCRatesDetailView: UIView {
    
    var dateButtons = [UIButton]()
    var rateLineView: CXCHistoricalRateLineView?
    
    // TODO: move to VC
    var ratesOne:[CGFloat]?
    var ratesTwo:[CGFloat]?
    var currencyOne:CXCCurrencyModel
    var currencyTwo:CXCCurrencyModel
    
    lazy var flagOneButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10)
        return btn
    }()
    
    lazy var flagTwoButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10)
        return btn
    }()
    
    lazy var exchageButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "转换"), for: .normal)
        btn.addTarget(self, action: #selector(exchangeCurrencies), for: .touchUpInside)
        return btn
    }()
    
    lazy var sevenDaysButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle(NSLocalizedString("7D", comment: ""), for: .normal)
        btn.setTitleColor(dateButtonNormalColor, for: .normal)
        btn.setTitleColor(dateButtonSelectedColor, for: .selected)
        btn.isSelected = true
        btn.addTarget(self, action: #selector(dateButtonsSelected(sender:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var oneMonthButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle(NSLocalizedString("1M", comment: ""), for: .normal)
        btn.setTitleColor(dateButtonNormalColor, for: .normal)
        btn.setTitleColor(dateButtonSelectedColor, for: UIControlState.selected)
        btn.addTarget(self, action: #selector(dateButtonsSelected(sender:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var threeMonthButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle(NSLocalizedString("3M", comment: ""), for: .normal)
        btn.setTitleColor(dateButtonNormalColor, for: .normal)
        btn.setTitleColor(dateButtonSelectedColor, for: .selected)
        btn.addTarget(self, action: #selector(dateButtonsSelected(sender:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var oneYearButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle(NSLocalizedString("1Y", comment: ""), for: .normal)
        btn.setTitleColor(dateButtonNormalColor, for: .normal)
        btn.setTitleColor(dateButtonSelectedColor, for: .selected)
        btn.addTarget(self, action: #selector(dateButtonsSelected(sender:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var threeYearButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle(NSLocalizedString("3Y", comment: ""), for: .normal)
        btn.setTitleColor(dateButtonNormalColor, for: .normal)
        btn.setTitleColor(dateButtonSelectedColor, for: .selected)
        btn.addTarget(self, action: #selector(dateButtonsSelected(sender:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var lowestLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = dateButtonNormalColor
        lbl.font = UIFont.systemFont(ofSize: 12.0)
        return lbl
    }()
    
    lazy var currentLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = dateButtonNormalColor
        lbl.font = UIFont.systemFont(ofSize: 12.0)
        return lbl
    }()
    
    lazy var highestLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = dateButtonNormalColor
        lbl.font = UIFont.systemFont(ofSize: 12.0)
        lbl.textAlignment = .right
        return lbl
    }()
    
    lazy var bottomBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#F2F4F7")
        return view
    }()
    
    lazy var bottomLabel: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 18.xppi, y: 580.yppi, width: screenWidth, height: 19.yppi))
        let space = "                 "
        lbl.text = "08" + space + "12" + space + "20" + space + "26" + space + "30"
        lbl.textColor = dateButtonNormalColor
        lbl.font = UIFont.systemFont(ofSize: 16.0)
        return lbl
    }()
    
    func dateButtonsSelected(sender btn:UIButton) {
        btn.isSelected = true
        for button in dateButtons {
            if button != btn {
                button.isSelected = false
            }
        }
        drawRateLines(time: btn.titleLabel!.text!)
    }
    
    func drawRateLines(time:String) {
        // GET -> display
        // TODO: put into closure / protocol, btn execute
        // TODO: modify time
        ratesOne = nil
        ratesTwo = nil
        
        if currencyOne.currency == "USD"  {
            
            CXCNetworking.getDataFrom(currency: currencyTwo.currency, time: time) { data in
                
                var points = [CGFloat]()
                
                for rate in data {
                    let point = rate.1//1 / self.ratesOne![rate.offset] * rate.element.1
                    points.append(point)
                }
                
                DispatchQueue.main.sync {
                    self.refreshRateLineViewAndBottomLabels(points: points)
                }
            }
        }
            
        else if currencyTwo.currency == "USD" {
            
            CXCNetworking.getDataFrom(currency: currencyOne.currency, time: time) { data in
                
                var points = [CGFloat]()
                
                for rate in data {
                    //                    self.ratesTwo!.append(rate.1)
                    let point = 1 / rate.1 //* self.ratesOne![rate.offset]
                    points.append(point)
                }
                
                DispatchQueue.main.sync {
                    self.refreshRateLineViewAndBottomLabels(points: points)
                }
            }
        }
            // Neither of currencies == "USD"
        else {
            var bothFinished = true
            
            CXCNetworking.getDataFrom(currency: currencyOne.currency, time: time) { data in
                
                bothFinished = !bothFinished
                if bothFinished {
                    
                    // 1 / one * two
                    
                    var points = [CGFloat]()
                    
                    for rate in data.enumerated() {
                        let point = 1 / rate.element.1 * self.ratesTwo![rate.offset]
                        points.append(point)
                    }
                    
                    DispatchQueue.main.sync {
                        self.refreshRateLineViewAndBottomLabels(points: points)
                    }
                    
                }
            }
            
            CXCNetworking.getDataFrom(currency: currencyTwo.currency, time: time) { data in
                
                bothFinished = !bothFinished
                if bothFinished {
                    
                    // 1 / one * two
                    
                    var points = [CGFloat]()
                    
                    for rate in data.enumerated() {
                        let point = 1 / self.ratesOne![rate.offset] * rate.element.1
                        points.append(point)
                    }
                    
                    DispatchQueue.main.sync {
                        self.refreshRateLineViewAndBottomLabels(points: points)
                    }
                }
            }
        }
    }
    
    init(currencyOne one:CXCCurrencyModel, currencyTwo two:CXCCurrencyModel) {
        currencyOne = one
        currencyTwo = two
        super.init(frame: CGRect.zero)
        self.backgroundColor = .clear
        
        setupFlags()
        
        addSubviews()
        setupConstraints()
        drawRateLines(time: "7d")
        dateButtons = [sevenDaysButton, oneMonthButton, threeMonthButton, oneYearButton, threeYearButton]
        /*
         // TODO: round flag
         let path = UIBezierPath()
         path.addArc(withCenter: flagOneButton.imageView!.center, radius: 15.0, startAngle: 0, endAngle: CGFloat(2.0 * M_PI), clockwise: true)
         UIColor.black.set()
         path.fill()
         let maskLayer = CAShapeLayer()
         maskLayer.path = path.cgPath
         flagOneButton.imageView?.layer.mask = maskLayer
         */
        // TODO: del
        
        let dummy = UIView()// frame: CGRect(x: 0, y: 307.yppi, width: screenWidth, height: 250.yppi)
        dummy.backgroundColor = .brown
        self.addSubview(dummy)
        dummy.snp.makeConstraints { make in
            make.top.equalTo(self.oneYearButton.snp.bottom).offset(20)
            make.left.right.equalTo(self)
            make.bottom.equalTo(bottomBackgroundView.snp.top)
        }
        
        lowestLabel.text = "1990"
        currentLabel.text = "2000"
        highestLabel.text = "2017"
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        self.addSubview(flagOneButton)
        self.addSubview(flagTwoButton)
        self.addSubview(exchageButton)
        self.addSubview(sevenDaysButton)
        self.addSubview(oneMonthButton)
        self.addSubview(threeMonthButton)
        self.addSubview(oneYearButton)
        self.addSubview(threeYearButton)
        self.addSubview(bottomBackgroundView)
        self.addSubview(bottomLabel)
        self.addSubview(lowestLabel)
        self.addSubview(currentLabel)
        self.addSubview(highestLabel)
    }
    
    func setupConstraints() {
        
        let btnOffset = 57.0
        let btnWidth = 30
        let btnHeight = 10
        
        exchageButton.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(147.yppi)
            make.width.equalTo(50.xppi)
        }
        
        flagOneButton.snp.makeConstraints { make in
            make.right.equalTo(exchageButton.snp.left).offset(-50)
            make.width.equalTo(90)
            make.centerY.equalTo(exchageButton)
        }
        
        flagTwoButton.snp.makeConstraints { make in
            make.left.equalTo(exchageButton.snp.right).offset(50)
            make.width.equalTo(90)
            make.centerY.equalTo(exchageButton)
        }
        
        sevenDaysButton.snp.makeConstraints { make in
            make.left.equalTo(self).offset(19.0)
            make.top.equalTo(263.yppi)
            make.width.equalTo(btnWidth)
            make.height.equalTo(btnHeight)
        }
        
        oneMonthButton.snp.makeConstraints { make in
            make.left.equalTo(sevenDaysButton.snp.right).offset(btnOffset)
            make.top.bottom.width.equalTo(sevenDaysButton)
        }
        
        threeMonthButton.snp.makeConstraints { make in
            make.left.equalTo(oneMonthButton.snp.right).offset(btnOffset)
            make.top.bottom.width.equalTo(sevenDaysButton)
        }
        
        oneYearButton.snp.makeConstraints { make in
            make.left.equalTo(threeMonthButton.snp.right).offset(btnOffset)
            make.top.bottom.width.equalTo(sevenDaysButton)
        }
        
        threeYearButton.snp.makeConstraints { make in
            make.left.equalTo(oneYearButton.snp.right).offset(btnOffset)
            make.top.bottom.width.equalTo(sevenDaysButton)
        }
        
        lowestLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self).offset(-33.yppi)
            make.left.equalTo(self).offset(18.0.xppi)
            make.width.lessThanOrEqualTo(100.xppi)
        }
        
        currentLabel.snp.makeConstraints { make in
            make.bottom.equalTo(lowestLabel)
            make.centerX.equalTo(self)
            make.width.lessThanOrEqualTo(100.xppi)
        }
        
        highestLabel.snp.makeConstraints { make in
            make.bottom.equalTo(lowestLabel)
            make.right.equalTo(self).offset(-18.0.xppi)
            make.width.lessThanOrEqualTo(100.xppi)
        }
        
        bottomBackgroundView.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.bottom)
            make.height.equalTo(96.yppi)
            make.left.right.equalTo(self)
        }
    }
    
    func refreshRateLineViewAndBottomLabels(points:[CGFloat]) {
        self.rateLineView?.removeFromSuperview()
        self.rateLineView = CXCHistoricalRateLineView.init(rates: points)
        self.addSubview(self.rateLineView!)
        
        self.rateLineView?.snp.makeConstraints { make in
            make.top.equalTo(self.oneYearButton.snp.bottom).offset(20)
            make.left.right.equalTo(self)
            make.bottom.equalTo(bottomBackgroundView.snp.top)
        }
        
        lowestLabel.text = NSLocalizedString("Lowest", comment: "") + String(Float(points.min()!))
        highestLabel.text = NSLocalizedString("Highest", comment: "") + String(Float(points.max()!))
        let current = 1.0 / currentCurrencyDict[self.currencyOne.currency]! * currentCurrencyDict[self.currencyTwo.currency]!
        currentLabel.text = NSLocalizedString("Current", comment: "") + String(current)
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let pathLine = UIBezierPath()
        UIColor(hex: "#D3D8E6").setStroke()
        pathLine.lineWidth = 1.0
        pathLine.move(to: CGPoint(x: 14.xppi, y: 238.yppi))
        pathLine.addLine(to: CGPoint(x: (375-14).xppi, y: 238.yppi))
        pathLine.lineCapStyle = .square
        pathLine.stroke()
    }
    
    func exchangeCurrencies() {
        swap(&currencyOne, &currencyTwo)
        setupFlags()
        
        
    }
    
    func setupFlags() {
        flagOneButton.setTitle(currencyOne.currency, for: .normal)
        flagOneButton.setImage(currencyOne.flagImage, for: .normal)
        flagTwoButton.setTitle(currencyTwo.currency, for: .normal)
        flagTwoButton.setImage(currencyTwo.flagImage, for: .normal)
    }
    
}
