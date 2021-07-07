//
//  IndexConstants.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 06/07/21.
//

import UIKit

public struct IndexData {
    static let dataCorrectionIndex:[String] = ["CDB", "LCI"]
    static let dataPreAndPostFixed:[String] = ["PRE", "POS"]
    static let initialValueCorretion:String = "CDB"
    static let initialValuePreAndPostFixed:String = "PRE"
    static let titlenavigation:String = "correção por índice"
}

public struct IndexConstants {
    static let numberOfComponentsValue:Int = 1
    static let alertTitle:String = "Selecione uma opção"
    static let alertKey:String = "contentViewController"
    static let alertButton:String = "Selecionar"
    static let areaPickerView:CGSize = CGSize(width: 250, height: 200)
    static let framePickerView:CGRect = CGRect(x: 0, y: 0, width: 250, height: 150)
    static let bottomScrolView:CGFloat = 90
    
    static let tfRightAnchorOneAndTwo:CGFloat = -123
    
    static let textLbCorrectionIndex:String = "Indices para correção"
    static let lbCorrectionTopAnchor:CGFloat = 32
    static let lbPreAndPostFixedTopAnchor:CGFloat = 140
    static let lbLeftAnchor:CGFloat = 16
    static let lbRightAnchor:CGFloat = -16
    
    //MARK: TextFieldCorrection Index
    static let tfCorrectionTopAnchor:CGFloat = 64
    static let tfLeftAnchor:CGFloat = 16
    static let tfHeightAnchor:CGFloat = 60
    static let tfRightAnchor:CGFloat = -16
    
    //MARK: TextField Value Invest
    static let tfValueInvestTopAnchor:CGFloat = 280
    
    //MARK: Button Index
    static let titleButton:String = "mudar"
    static let btCorrectionIndex:CGFloat = 64
    static let btLeftAnchor:CGFloat = 16
    static let btRightAnchor:CGFloat = -16
    static let btHeightAnchor:CGFloat = 60
    static let btPreAndPosTopAnchor:CGFloat = 172
    
    //MARK: Label 2 Pre e Pós
    static let titleLbPreAndPosFix:String = "É pré fixado ou pós fixado?"
    static let lbPreAndPosTopAnchor:CGFloat = 140
    
    //MARK: Constraints TextField Pre e Pós Fixado:
    static let tfPreAndPostTopAnchor:CGFloat = 172
    static let tfPreAndPostRightAnchor:CGFloat = -123
    
    //MARK: Constants TextField Value Invest
    static let tfTitleValueInvest:String = "Valor que você vai investir"
    static let lbValueInvestTopAnchor:CGFloat = 248
    
    //MARK: Constants  Due data:
    static let tfDueDateTopAnchor:CGFloat = 388
    static let lbDueDateTitle:String = "Prazo ou vencimento"
    static let lbDueDataTopAnchor:CGFloat = 356
    
    //MARK:  Constants Porcent Yearly:
    static let tfPorcentYearlyTopAnchor:CGFloat = 496
    static let lbPorcentYearlyTopAnchor:CGFloat = 464
    static let lbTitlePorcentYearly:String = "Porcentagem ao ano"
    
    //MARK: Constants TF and Label Result:
    static let tfResult:CGFloat = 604
    static let lbTitleResult:String = "Valor obtido no final"
    static let lbResultTopAnchor:CGFloat = 572
    
    //MARK: Constants Button Calcular:
    static let titleButtonCalc:String = "CALCULAR"
    static let btCalcTopAnchor:CGFloat = 696
    
}
