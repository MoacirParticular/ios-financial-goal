//
//  MonthlyConstants.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 30/06/21.
//

import Foundation

enum TypeScreenCalc {
    case Monthly
    case Yearly
}

struct InfoCalcScreen {
    static let monthly: CalcScreenData = CalcScreenData(.Monthly, "Período em meses", "Taxa de juros mensal", "Valor da aplicação inicial", "Valor da aplicação mesal", "Valor obtido no final", "CALCULAR")
    static let yearly: CalcScreenData = CalcScreenData(.Yearly, "Período em meses", "Taxa de juros mensal", "Valor da aplicação única hoje", String.empty, "Valor obtido no final", "CALCULAR")
}

struct TitleCalcScreen {
    static let monthlyTitle: String = "Aplicação mensal"
    static let yearlyTitle: String = ""
}
