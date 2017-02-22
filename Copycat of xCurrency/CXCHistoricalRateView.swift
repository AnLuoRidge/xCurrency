//
//  CXCHistoricalRateView.swift
//  Copycat of xCurrency
//
//  Created by AnLuoRidge on 2/21/17.
//  Copyright © 2017 里脊. All rights reserved.
//

import UIKit

class CXCHistoricalRateView: UIView {
var prices = [CGFloat]()
    func getCurrencyData() {
        
        
        let session = URLSession.init(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: URL.init(string: "https://query.yahooapis.com/v1/public/yql?q=%20select%20*%20from%20yahoo.finance.historicaldata%20where%20symbol%20=%20%22HKD=X%22%20and%20startDate%20=%20%222014-06-06%22%20and%20endDate%20=%20%222015-01-01%22&format=json&diagnostics=true&env=store://datatables.org/alltableswithkeys&callback=")!) { (data, response, error) in
            do {
                if data != nil {
                    //if JSONSerialization.isValidJSONObject(data) {
                    let dict = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: Any]
                    
 let query = dict["query"] as! [String:Any];
                    let results = query["results"] as! [String:Any];
                    let quote = results["quote"] as! [[String:Any]];
                    for json in quote {
                        let openPrice = CGFloat(Float(json["Open"] as! String)!)
                        self.prices.append(openPrice)
                    }
                }
                self.setNeedsDisplay()
            } catch {
                
            }
        }
        task.resume()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        getCurrencyData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        prices = [7.75299978256226, 7.75646018981934, 7.75765991210938, 7.76098012924194, 7.75952005386353, 7.76070976257324, 7.75616979598999, 7.75536012649536, 7.75379991531372, 7.75576019287109, 7.75543022155762, 7.7531099319458, 7.75226020812988, 7.75150012969971, 7.75123977661133, 7.75132989883423, 7.75271987915039, 7.75068998336792, 7.7506799697876, 7.75094985961914, 7.75340986251831, 7.7542200088501, 7.75517988204956, 7.75436019897461, 7.75223016738892, 7.75334978103638, 7.75415992736816, 7.75529003143311, 7.75668001174927, 7.75567007064819, 7.754469871521, 7.75450992584229, 7.75409984588623, 7.75390005111694, 7.75441980361938, 7.75408983230591, 7.75383996963501, 7.75382995605469, 7.75229978561401, 7.75257015228271, 7.75146007537842, 7.7514500617981, 7.75342988967896, 7.75441980361938, 7.75519990921021, 7.75430011749268, 7.75679016113281, 7.75699996948242, 7.75740003585815, 7.75677013397217, 7.7559700012207, 7.75521993637085, 7.75735998153687, 7.7568998336792, 7.75725984573364, 7.75677013397217, 7.75616979598999, 7.75739002227783, 7.75620985031128, 7.75554990768433, 7.75565004348755, 7.75443983078003, 7.75407981872559, 7.75860977172852, 7.76204013824463, 7.76308012008667, 7.76424980163574, 7.76540994644165, 7.76211977005005, 7.75362014770508, 7.75132989883423, 7.75129985809326, 7.75099992752075, 7.75076007843018, 7.7508602142334, 7.75010013580322, 7.75059986114502, 7.75064992904663, 7.75016021728516, 7.74982976913452, 7.74994993209839, 7.74987983703613, 7.74984979629517, 7.74998998641968, 7.74982976913452, 7.74979019165039, 7.74988985061646, 7.74974012374878, 7.74978017807007, 7.74969005584717, 7.74965000152588, 7.75028991699219, 7.74978017807007, 7.7499098777771, 7.74972009658813, 7.75031995773315, 7.75017976760864, 7.75012016296387, 7.75007009506226, 7.75040006637573, 7.7506799697876, 7.75088977813721, 7.75083017349243, 7.75150012969971, 7.75036001205444, 7.74989986419678, 7.75010013580322, 7.74959993362427, 7.74974012374878, 7.74961996078491, 7.74958992004395, 7.74951982498169, 7.74958992004395, 7.74965000152588, 7.74986982345581, 7.75019979476929, 7.75115013122559, 7.75124979019165, 7.75065994262695, 7.75040006637573, 7.75041007995605, 7.74960994720459, 7.74962997436523, 7.74910020828247, 7.74961996078491, 7.74981021881104, 7.74969005584717, 7.74983978271484, 7.74995994567871, 7.74997997283936, 7.74980020523071, 7.75088977813721, 7.75002002716064, 7.75115013122559, 7.75132989883423, 7.7510199546814, 7.75118017196655, 7.75071001052856, 7.75108003616333, 7.74997997283936, 7.75062990188599, 7.75087976455688, 7.75080013275146, 7.75108003616333, 7.75119018554688, 7.75158977508545, 7.75117015838623, 7.7512001991272, 7.75206995010376, 7.75228977203369]
        if prices.count > 0 {
            var currencis:[CGFloat] = prices//[300.0, 320.0, 230.0, 350.0, 310, 420, 410, 200, 210, 190, 170, 200, 230, 211, 300]
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
            linePath.lineWidth = 2.0
            linePath.lineCapStyle = .square
            linePath.move(to: points.first!)
            
            for point in points {
                linePath.addLine(to: point)
            }
            
            // set line as mask layer
            let lineMaskLayer = CAShapeLayer()
            lineMaskLayer.frame = self.bounds
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
            let xBlue = UIColor.init(red: 42.0/255.0, green: 95.0/255.0, blue: 211.0/255.0, alpha: 1.0).cgColor
            let xGreen = UIColor.init(red: 14.0/255.0, green: 240.0/255.0, blue: 163.0/255.0, alpha: 1.0).cgColor
            gradientBackgroundLayer.colors = [xBlue, xGreen]
            gradientBackgroundLayer.startPoint = CGPoint.init(x: 0, y: 0.5)
            gradientBackgroundLayer.endPoint = CGPoint.init(x: 1.0, y: 0.5)
            gradientBackgroundLayer.mask = lineMaskLayer
            
            self.layer.addSublayer(gradientBackgroundLayer)
        }
    }
    

}
