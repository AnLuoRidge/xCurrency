//
//  CXCHistoricalRateView.swift
//  Copycat of xCurrency
//
//  Created by AnLuoRidge on 2/21/17.
//  Copyright © 2017 里脊. All rights reserved.
//

import UIKit

class CXCHistoricalRateView: UIView {

    
    
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
//        let pathLine = UIBezierPath()
//        UIColor.blue.setStroke() //设置线条的颜色
//        pathLine.lineWidth = 5
//        pathLine.move(to: CGPoint(x: 100, y: 100))
//        pathLine.addLine(to: CGPoint(x: 300, y: 100))
//        pathLine.lineCapStyle = .round //线条结束点的形状
//        pathLine.stroke() // 画线条
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [UIColor.init(red: 42.0/255.0, green: 95.0/255.0, blue: 211.0/255.0, alpha: 1.0).cgColor, UIColor.init(red: 14.0/255.0, green: 240.0/255.0, blue: 163.0/255.0, alpha: 1.0).cgColor]
//        gradientLayer.locations = [0.4]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint.init(x: 1.0, y: 0.5)
        
        let lineMaskLayer = CAShapeLayer()
        lineMaskLayer.frame = self.bounds
        
        let linePath = UIBezierPath()
        linePath.lineWidth = 2
        
        let currencis:[CGFloat] = [300.0, 320.0, 230.0, 350.0]
        let interval = CGFloat(screenWidth / CGFloat(currencis.count - 1))
        var points = [CGPoint]()
        for i in 0..<currencis.count {
            points.append(CGPoint(x: interval * CGFloat(i), y: currencis[i]))
        }
        
        linePath.move(to: points.first!)

        for point in points {
            linePath.addLine(to: point)
        }

        linePath.lineCapStyle = .square
        
//        linePath.stroke()
        
        lineMaskLayer.path = linePath.cgPath
        lineMaskLayer.strokeColor = UIColor.white.cgColor
        lineMaskLayer.fillColor = UIColor.clear.cgColor
//        lineMaskLayer.lineCap = kCALineCapRound
        
        gradientLayer.mask = lineMaskLayer
        // path will be closed autolly
        
//        _trackLayer.opacity = 0.25; //背景同学你就甘心做背景吧，不要太明显了，透明度小一点
//        _trackLayer.lineCap = kCALineCapRound;//指定线的边缘是圆的
//        _trackLayer.lineWidth = PROGRESS_LINE_WIDTH;//线的宽度
//        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(40, 40) radius:(PROGREESS_WIDTH-PROGRESS_LINE_WIDTH)/2 startAngle:degreesToRadians(-210) endAngle:degreesToRadians(30) clockwise:YES];//上面说明过了用来构建圆形
//        _trackLayer.path =[path CGPath]; //把path传递給layer，然后layer会处理相应的渲染，整个逻辑和CoreGraph是一致的。

        self.layer.addSublayer(gradientLayer)
        //CALayer *gradientLayer = [CALayer layer];
        //CAGradientLayer *gradientLayer1 =  [CAGradientLayer layer];
//        gradientLayer1.frame = CGRectMake(0, 0, self.width/2, self.height);
//        [gradientLayer1 setColors:[NSArray arrayWithObjects:(id)[[UIColor redColor] CGColor],(id)[UIColorFromRGB(0xfde802) CGColor], nil]];
//        [gradientLayer1 setLocations:@[@0.5,@0.9,@1 ]];
//        [gradientLayer1 setStartPoint:CGPointMake(0.5, 1)];
//        [gradientLayer1 setEndPoint:CGPointMake(0.5, 0)];
//        [gradientLayer addSublayer:gradientLayer1];
        
        
        
        
        
        
        
        
        let size = CGSize.init(width: 120, height: 120)
        let bounds = CGRect(origin: .zero, size: size)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let (width, height) = (Int(size.width), Int(size.height))
        
        // 创建 CG ARGB 上下文
        guard let context = CGContext(data: nil, width: width,
                                      height: height, bitsPerComponent: 8,
                                      bytesPerRow: width * 4, space: colorSpace,
                                      bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue)
            else {return  }
        
        // 为 UIKit 准备 CG 上下文
        UIGraphicsPushContext(context); defer { UIGraphicsPopContext() }
        
        // 使用 UIKit 调用绘制上下文
        UIColor.blue.set(); UIRectFill(bounds)
        let oval = UIBezierPath(ovalIn: bounds)
        UIColor.red.set(); oval.fill()
        
        // 从上下文中提取图像
        guard let imageRef = context.makeImage() else {return  }
        //return UIImage(cgImage: imageRef)
    }
    

}
