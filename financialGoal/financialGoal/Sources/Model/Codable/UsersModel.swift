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
    let user: User?
}

struct User: Codable {
    let username: String?
    let nickname: String?
}
