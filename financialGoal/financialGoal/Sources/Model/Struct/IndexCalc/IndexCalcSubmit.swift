//
//  IndexCalcSubmit.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 05/07/21.
//

import Foundation

struct IndexCalcSubmit {
    let initial: Double
    let cdiPercent: Double
    let profitabilityDefinition: String
    let period: Int
    let type: String
}


struct CalcFieldsSubmit {
    static let initial = "initial"
    static let cdiPercent = "cdiPercent"
    static let profitabilityDefinition = "profitabilityDefinition"
    static let period = "period"
    static let type = "type"
}
