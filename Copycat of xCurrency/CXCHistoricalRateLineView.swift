//
//  CXCHistoricalRateView.swift
//  Copycat of xCurrency
//
//  Created by AnLuoRidge on 2/21/17.
//  Copyright © 2017 里脊. All rights reserved.
//

import UIKit

class CXCHistoricalRateLineView: UIView {

var rates = [CGFloat]()
    
    init(rates:[CGFloat]) {
        super.init(frame: CGRect.zero)
        self.rates = rates
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {

        if rates.count > 0 {
            
            let realMax = rates.max()
            let realMin = rates.min()
            // reduce to 20
            let num = rates.count / 20
            var group = [CGFloat]()
            var avgs = [CGFloat]()
            for price in rates.enumerated() {
                group.append(price.element)
                // 一组满了，取均值，并且清空。
                if price.offset % num == num - 1 {
                    let avg = group.reduce(0,{$0 + $1}) / CGFloat(group.count)
                    avgs.append(avg)
                    group.removeAll()
                }
            }
              
            var currencis:[CGFloat] = avgs//[300.0, 320.0, 230.0, 350.0, 310, 420, 410, 200, 210, 190, 170, 200, 230, 211, 300]
            
            // 归一化
            let min = currencis.min()!
            let cha = currencis.max()! - min
            currencis = currencis.map({ val -> CGFloat in
                return (val - min) / cha
            })
            
            self.backgroundColor = .clear
            // generate points array
            let offset = screenWidth / CGFloat(currencis.count - 1)
            var points = [CGPoint]()
            for currency in currencis.enumerated() {
                points.append(CGPoint(x: offset * CGFloat(currency.offset), y: self.bounds.height * currency.element))
            }

            // draw the line
            let linePath = UIBezierPath()
//            linePath.lineWidth = 2.0
//            linePath.lineCapStyle = .square
//            linePath.lineCapStyle = .round
            linePath.move(to: points.first!)
            
            for point in points {
                linePath.addLine(to: point)
            }
            
            // set line as mask layer
            let lineMaskLayer = CAShapeLayer()
            lineMaskLayer.frame = self.bounds
            lineMaskLayer.lineCap = kCALineCapRound
            lineMaskLayer.lineJoin = kCALineJoinRound
            lineMaskLayer.lineWidth = 1.0
            lineMaskLayer.path = linePath.cgPath
            lineMaskLayer.strokeColor = UIColor.white.cgColor
            lineMaskLayer.fillColor = UIColor.clear.cgColor
            
            // add animation
            let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
            pathAnimation.duration = 1.0;
            pathAnimation.isRemovedOnCompletion = false
            pathAnimation.fromValue = 0.0
            pathAnimation.toValue = 1.0
            lineMaskLayer.add(pathAnimation, forKey: "ani")
            
            // set gradient background
            let gradientBackgroundLayer = CAGradientLayer()
            gradientBackgroundLayer.frame = self.bounds
//            let xBlue = UIColor.init(red: 42.0/255.0, green: 95.0/255.0, blue: 211.0/255.0, alpha: 1.0).cgColor
//            let xGreen = UIColor.init(red: 14.0/255.0, green: 240.0/255.0, blue: 163.0/255.0, alpha: 1.0).cgColor
            // #56EFBC #2BD987
            let lightGreen = UIColor(hex: "#56EFBC").cgColor
            let darkGreen = UIColor(hex: "#2BD987").cgColor
            gradientBackgroundLayer.colors = [lightGreen, darkGreen]
            gradientBackgroundLayer.startPoint = CGPoint.init(x: 0, y: 0.5)
            gradientBackgroundLayer.endPoint = CGPoint.init(x: 1.0, y: 0.5)
            gradientBackgroundLayer.mask = lineMaskLayer
            
            self.layer.addSublayer(gradientBackgroundLayer)
        }
    }
    

}
