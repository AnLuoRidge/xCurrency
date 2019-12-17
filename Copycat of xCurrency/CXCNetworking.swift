//
//  CXCNetwork.swift
//  Copycat of xCurrency
//
//  Created by AnLuoRidge on 2/25/17.
//  Copyright © 2017 里脊. All rights reserved.
//

import UIKit

class CXCNetworking: NSObject {
    
    static var firstLoaded = false
    static let filePath = URL(fileURLWithPath: NSHomeDirectory() + "/Documents/Latest Currency Data.json")
    
    class func getAllCurrentCurrenciesData(completion:@escaping ()->Void) {
        let session = URLSession.init(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: URL.init(string: "https://finance.yahoo.com/webservice/v1/symbols/allcurrencies/quote?format=json")!) { (data, response, error) in
            
            do {
                if data != nil {
                    
                    try! data?.write(to: filePath)
                    let dict1 = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: Any]
                    
                    let list = dict1["list"]! as! [String:Any];
                    //let json1 = json["resources"] as! [[String:Any]];
                    for dict in list["resources"] as! [[String:Any]] {
                        let resource = dict["resource"]! as! [String:Any];
                        let fields = resource["fields"] as! [String:String];
                        if let price = fields["price"] {
                            if let name = fields["name"] {
                                currentCurrencyDict.updateValue(Float(price)!, forKey: name)
                            }
                        }
                        
                        
                    }
                    currentCurrencyDict.updateValue(Float(1.0), forKey: "USD/USD")
                    completion()
                }
            } catch {
                useLocalData()
            }
            
        }
        task.resume()
    }
    // class == static
    class func getDataFrom(currency: String, time:String, completion: @escaping ([(Date, CGFloat)]) -> Void) {
        let country = currency + "=x"
        let session = URLSession.init(configuration: URLSessionConfiguration.default)
        let requestURL = URL.init(string: "https://chartapi.finance.yahoo.com/instrument/1.0/\(country)/chartdata;type=quote;range=\(time.lowercased())/json")!
        let task = session.dataTask(with: requestURL) { (data, response, error) in
            do {
                if data != nil {
                    var prices = [(Date, CGFloat)]()
                    
                    let str = String.init(data: data!, encoding: String.Encoding.utf8)!
                    let subStr = String(str[str.index(str.startIndex, offsetBy: 29)..<str.index(str.endIndex, offsetBy: -2)])
                    
                    let subData = subStr.data(using: String.Encoding.utf8);
                    let entity = try? JSONSerialization.jsonObject(with: subData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: Any];
                    let series = entity!["series"] as! [[String:Any]]
                    for element in series {
                        let date: Date
                        // timestamp
                        if time == "7d" {
                            date = Date.init(timeIntervalSince1970: element["Timestamp"]! as! TimeInterval)
                        }
                            // date
                        else {
                            let formatter = DateFormatter()
                            formatter.dateFormat = "yyyyMMdd"
                            date = formatter.date(from: String(describing: element["Date"]!))!
                        }
                        prices.append((date,element["open"]! as! CGFloat))
                    }
                    completion(prices)
                }
            }
        }
        // TODO: open
        task.resume()
    }
    
    class func useLocalData() {
        
        let manager = FileManager.default
        let data = manager.contents(atPath: filePath.absoluteString)
        if data != nil {
            do {
                let dict1 = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: Any]
                
                let list = dict1["list"]! as! [String:Any];
                //let json1 = json["resources"] as! [[String:Any]];
                for dict in list["resources"] as! [[String:Any]] {
                    let resource = dict["resource"]! as! [String:Any];
                    let fields = resource["fields"] as! [String:String];
                    if let price = fields["price"] {
                        if let name = fields["name"] {
                            currentCurrencyDict.updateValue(Float(price)!, forKey: name)
                        }
                    }
                }
            } catch {
                
            }
        }
        currentCurrencyDict.updateValue(Float(1.0), forKey: "USD/USD")
    }
    
}
