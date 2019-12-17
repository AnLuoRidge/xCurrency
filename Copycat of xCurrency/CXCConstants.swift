//
//  CXCConstants.swift
//  Copycat of xCurrency
//
//  Created by AnLuoRidge on 2/27/17.
//  Copyright © 2017 里脊. All rights reserved.
//

import UIKit

enum Currency: String  {
    case AUD = "AUD"
//    case BTC = "BTC"
    case CAD = "CAD"
    case CNH = "CNH"
    case CNY = "CNY"
    case DKK = "DKK"
    case EUR = "EUR"
    case FJD = "FJD"
    case GBP = "GBP"
    case HKD = "HKD"
    case INR = "INR"
    case JPY = "JPY"
    case KES = "KES"
    case KPW = "KPW"
    case LYD = "LYD"
    case MOP = "MOP"
    case MWK = "MWK"
    case OMR = "OMR"
    case PAB = "PAB"
    case QAR = "QAR"
    case SGD = "SGD"
    case TWD = "TWD"
    case USD = "USD"
    case VND = "VND"
    case XAU = "XAU"
    case XAG = "XAG"
    case YER = "YER"
    case ZMW = "ZMW"
}

/*
 # Currency display name translations
 AED=United Arab Emirates Dirham
 AFN=Afghan Afghani
 ALL=Albanian Lek
 AMD=Armenian Dram
 ARS=Argentine Peso
 AUD=Australian Dollar
 AZN=Azerbaijani Manat
 BAM=Bosnia-Herzegovina Convertible Mark
 BDT=Bangladeshi Taka
 BGN=Bulgarian Lev
 BHD=Bahraini Dinar
 BOB=Bolivian Boliviano
 BRL=Brazilian Real
 BYR=Belarusian Ruble
 CAD=Canadian Dollar
 CHF=Swiss Franc
 CLP=Chilean Peso
 CNY=Chinese Yuan
 COP=Colombian Peso
 CZK=Czech Republic Koruna
 DJF=Djiboutian Franc
 DKK=Danish Krone
 DZD=Algerian Dinar
 EGP=Egyptian Pound
 ETB=Ethiopian Birr
 EUR=Euro
 GBP=British Pound Sterling
 GEL=Georgian Lari
 GNF=Guinean Franc
 HKD=Hong Kong Dollar
 HRK=Croatian Kuna
 HUF=Hungarian Forint
 IDR=Indonesian Rupiah
 ILS=Israeli New Sheqel
 INR=Indian Rupee
 IQD=Iraqi Dinar
 IRR=Iranian Rial
 ISK=Icelandic Króna
 JOD=Jordanian Dinar
 JPY=Japanese Yen
 KES=Kenyan Shilling
 KGS=Kyrgystani Som
 KRW=South Korean Won
 KWD=Kuwaiti Dinar
 KZT=Kazakhstani Tenge
 LBP=Lebanese Pound
 LKR=Sri Lankan Rupee
 MAD=Moroccan Dirham
 MDL=Moldovan Leu
 MGA=Malagasy Ariary
 MKD=Macedonian Denar
 MNT=Mongolian Tugrik
 MXN=Mexican Peso
 MYR=Malaysian Ringgit
 MZN=Mozambican Metical
 NOK=Norwegian Krone
 NZD=New Zealand Dollar
 PAB=Panamanian Balboa
 PEN=Peruvian Nuevo Sol
 PHP=Philippine Peso
 PKR=Pakistani Rupee
 PLN=Polish Zloty
 QAR=Qatari Rial
 RON=Romanian Leu
 RSD=Serbian Dinar
 RUB=Russian Ruble
 SAR=Saudi Riyal
 SEK=Swedish Krona
 SGD=Singapore Dollar
 SYP=Syrian Pound
 THB=Thai Baht
 TJS=Tajikistani Somoni
 TMT=Turkmenistani Manat
 TND=Tunisian Dinar
 TRY=Turkish Lira
 TWD=New Taiwan Dollar
 TZS=Tanzanian Shilling
 UAH=Ukrainian Hryvnia
 USD=US Dollar
 UYU=Uruguayan Peso
 UZS=Uzbekistan Som
 VEF=Venezuelan Bolívar
 VND=Vietnamese Dong
 XAF=CFA Franc BEAC
 XDR=Special Drawing Rights
 XOF=CFA Franc BCEAO
 YER=Yemeni Rial
 ZAR=South African Rand
 */

let fullNameDict = ["AUD":"Australian Dollar",
//                    "BTC":"Bitcoin",
                    "CAD":"Canadian Dollar",
                    "CNH":"RMB Offshore",
                    "CNY":"Chinese Yuan",
                    "DKK":"Danish Krone",
                    "EUR":"Euro",
                    "FJD":"Fiji Dollar",
                    "GBP":"British Pound",
                    "HKD":"Hong Kong Dollar",
                    "INR":"Indian Rupee",
                    "JPY":"Japanese Yen",
                    "KES":"Kenyan Shilling",
                    "LYD":"Libyan Dinar",
                    "MOP":"Macau Pataca",
                    "MWK":"Malawi Kwacha",
                    "KPW":"North Korean Won",
                    "OMR":"Omani Rial",
                    "PAB":"Panama Balboa",
                    "QAR":"Qatar Rial 暂无数据",
                    "SGD":"Singapore Dollar",
                    "TWD":"Taiwan Dollar",
                    "USD":"United States Dollar",
                    "VND":"Vietnam Dong",
                    "XAU":"Gold 暂无数据",
                    "XAG":"Silver 暂无数据",
                    "YER":"Yemen Riyal",
                    "ZMW":"Zambian Kwacha"]

let symbolDict = ["AUD":"$",
//                  "BTC":"฿",
                  "CAD":"$",
                  "CNH":"￥",
                  "CNY":"￥",
                  "DKK":"Kr",
                  "EUR":"€",
                  "FJD":"$",
                  "GBP":"£",
                  "HKD":"$",
                  "INR":"Rs",
                  "JPY":"￥",
                  "KES":"Ksh",
                  "LYD":"LD",
                  "MOP":"MOP$",
                  "MWK":"MK",
                  "KPW":"W",
                  "OMR":"OR",// to replace by a strange symbol
    "PAB":"B/.",
    "QAR":"AR",// to replace by a strange symbol
    "SGD":"$",
    "TWD":"$",
    "USD": "$",
    "VND":"VD",// to replace by a strange symbol
    "XAG":"Ounce",
    "XAU":"Ounce",
    "YER":"YR",// replace
    "ZMW":"ZK"
]

var currentCurrencyDict:[String:Float] = ["CNY/HKD":1.4,
                                          "CNY/EUR":1/10,
                                          "CNY/USD":1/6,
                                          "CNY/AUD":1/4,
                                          "CNY/JPY":14,
                                          "USD/CNY":6.8665,
                                          "USD/AUD":1.2968,
                                          "USD/USD":1.0,
                                          "USD/EUR":0.8,
                                          "USD/HKD":7.5,
                                          "USD/JPY":113.393]

var commonCurrencies = [CXCCurrencyModel.init(currency: .CNY),
                        CXCCurrencyModel.init(currency: .USD),
                        CXCCurrencyModel.init(currency: .JPY),
                        CXCCurrencyModel.init(currency: .AUD),
]
let preciousCurrencies = [CXCCurrencyModel(currencyEntity: .XAU), CXCCurrencyModel(currencyEntity: .XAG)]
let aCurrencies = [CXCCurrencyModel(currencyEntity: .AUD)]
let bCurrencies = [CXCCurrencyModel(currencyEntity: .GBP)]
let cCurrencies = [CXCCurrencyModel(currencyEntity: .CNY)]
let dCurrencies = [CXCCurrencyModel(currencyEntity: .DKK)]
let eCurrencies = [CXCCurrencyModel(currencyEntity: .EUR)]
let fCurrencies = [CXCCurrencyModel(currencyEntity: .FJD)]
let gCurrencies = [CXCCurrencyModel(currencyEntity: .XAU)]
let hCurrencies = [CXCCurrencyModel(currencyEntity: .HKD)]
let iCurrencies = [CXCCurrencyModel(currencyEntity: .INR)]
let jCurrencies = [CXCCurrencyModel(currencyEntity: .JPY)]
let kCurrencies = [CXCCurrencyModel(currencyEntity: .KES)]
let lCurrencies = [CXCCurrencyModel(currencyEntity: .LYD)]
let mCurrencies = [CXCCurrencyModel(currencyEntity: .MOP), CXCCurrencyModel(currencyEntity: .MWK)]
let nCurrencies = [CXCCurrencyModel(currencyEntity: .KPW)]
let oCurrencies = [CXCCurrencyModel(currencyEntity: .OMR)]
let pCurrencies = [CXCCurrencyModel(currencyEntity: .PAB)]
let qCurrencies = [CXCCurrencyModel(currencyEntity: .QAR)]
let rCurrencies = [CXCCurrencyModel(currencyEntity: .CNH)]
let sCurrencies = [CXCCurrencyModel(currencyEntity: .XAG)]
let tCurrencies = [CXCCurrencyModel(currencyEntity: .TWD)]
let uCurrencies = [CXCCurrencyModel(currencyEntity: .USD)]
let vCurrencies = [CXCCurrencyModel(currencyEntity: .VND)]
let yCurrencies = [CXCCurrencyModel(currencyEntity: .YER)]
let zCurrencies = [CXCCurrencyModel(currencyEntity: .ZMW)]
let allCurrencies = [commonCurrencies,
                     preciousCurrencies,
                     aCurrencies,
                     bCurrencies,
                     cCurrencies,
                     dCurrencies,
                     eCurrencies,
                     fCurrencies,
                     gCurrencies,
                     hCurrencies,
                     iCurrencies,
                     jCurrencies,
                     kCurrencies,
                     lCurrencies,
                     mCurrencies,
                     nCurrencies,
                     oCurrencies,
                     pCurrencies,
                     qCurrencies,
                     rCurrencies,
                     sCurrencies,
                     tCurrencies,
                     uCurrencies,
                     vCurrencies,
                     yCurrencies,
                     zCurrencies]


var fourVisibleCurrencis = [Currency.CNY, Currency.USD, Currency.EUR, Currency.HKD]
let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height
let xppi = screenWidth / 375.0
let yppi = screenHeight / 667.0
let keyboardHeight: CGFloat = CGFloat(280.0.yppi)
let dateButtonSelectedColor = UIColor(hex: "#29B774")
let dateButtonNormalColor = UIColor(hex: "#99A4BF")
let mainCellRowHeight = (screenHeight - 58.yppi - 280.yppi) / 4

class CXCConstants: NSObject {
    
}
