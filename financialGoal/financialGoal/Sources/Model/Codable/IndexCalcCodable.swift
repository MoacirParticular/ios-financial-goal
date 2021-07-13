//
//  IndexCalcCodable.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 05/07/21.
//

import Foundation

struct IndexCalcCodable: Codable {
    let message: String?
    let res: Bool?
    let data: DataResponse?
}

struct DataResponse: Codable {
    let cdbIndex: Double?
    let initial: Double?
    let updatedInvestedAmount: String?
    let grossProfit: String?
    let netAmountOfInvestment: String?
}
