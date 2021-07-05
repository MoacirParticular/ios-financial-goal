//
//  TaxesConstants.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 30/06/21.
//

import UIKit

struct TaxesConstants {
    
    //MARK: Constraints Labels
    static let heightTFMonthly:CGFloat = 60
    static let topAnchorMonthly:CGFloat = 52
    static let topAnchorYearly:CGFloat = 52
    static let LbLeftAnchor:CGFloat = 16
    static let LbRightAnchor:CGFloat = 129
    static let lbAlignment: NSTextAlignment = .right
    
    //MARK: Constraints TextFields
    static let topAnchorMonthlyTF:CGFloat = 14
    static let leftAnchorTF:CGFloat = 144
    static let topAnchorYearlyTF:CGFloat = 32
    static let rightAnchorTF:CGFloat = -15
    
    //MARK: Strings Labels
    static let lbYearlyText:String = "Taxa anual:"
    static let lbMonthlyText:String = "Taxa mensal:"
}

    //MARK: Cálculos
struct ValueCalcTaxes {
    static let divHundred: Double = 100
    static let opOne: Double = 1
    static let opPow: Double = 0.08333333333333
    static let formatDec:String = "%0.2f"
    static let formatPorcent:String = "%"
    static let zeroValueDefault:Double = 0
}
