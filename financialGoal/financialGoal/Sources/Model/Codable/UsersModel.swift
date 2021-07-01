//
//  UsersModel.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 21/06/21.
//

import Foundation

struct ReturnDecode: Codable {
    let message: String?
    let res: Bool?
    let totalInvestment: String?
    let totalEarning: String?
    let accruedEarnings: String?
    let dadosUser: DadosUser?
    let user: User?
}

struct User: Codable {
    let username: String?
    let nickname: String?
}

struct DadosUser: Codable {
    let initial: Int?
    let monthly: Int?
    let profitability: Double?
    let period: Int?
    let interestIsMonthly: Bool?
}
