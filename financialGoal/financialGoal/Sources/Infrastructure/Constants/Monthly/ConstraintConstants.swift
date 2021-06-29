//
//  ConstraintsConstants.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 29/06/21.
//

import UIKit

struct MonthlyConstraints {
    static let identLeft: CGFloat = 16
    static let identRight: CGFloat = -16
}
struct MonthlyLabelConstraints {
    static let firstIdentTop: CGFloat = 136
    static let identTop: CGFloat = 16
}

struct MonthlyTextFieldsConstraints {
    static let identTop: CGFloat = 8
    static let height:CGFloat = ConstantsTextField.height
}

struct MonthlyButtonConstraints {
    static let identTop: CGFloat = 2 // 32
    static let height: CGFloat = ValuesConstraintsButton.height
}

enum TypeScreenCalc {
    case Monthly
    case Yearly
}

struct InfoCalcScreen {
    static let monthly: CalcScreenData = CalcScreenData(.Monthly, "Período em meses", "Taxa de juros mensal", "Valor da aplicação inicial", "Valor da aplicação mesal", "Valor obtido no final", "CALCULAR")
    static let yearly: CalcScreenData = CalcScreenData(.Yearly, "Período em meses", "Taxa de juros mensal", "Valor da aplicação única hoje", String.empty, "Valor obtido no final", "CALCULAR")
}
