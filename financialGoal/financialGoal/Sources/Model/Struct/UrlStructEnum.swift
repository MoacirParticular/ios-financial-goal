//
//  UrlStructEnum.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 22/06/21.
//

import Foundation

struct ApiData {
    public static let url: String = "https://zdktzx1nbi.execute-api.sa-east-1.amazonaws.com/"
    public static let method: String = "POST"
}

enum Operation: String, CodingKey {
    case login = "login/"
    case signIn = "usuarios/"
    case forgot = "recovery-password/"
    case monthlyYearlyCalcs = "calcularjuroscomposto/"
    case indexCalcs = "calcularjurosindexado/"
}

enum Environment: String, CodingKey {
    case develop = "dev/"
    case production = "prod/"
}
