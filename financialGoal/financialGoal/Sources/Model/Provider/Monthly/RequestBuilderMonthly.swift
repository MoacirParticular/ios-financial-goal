//
//  RequestBuilderMonthly.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 01/07/21.
//

import Foundation
protocol RequestBuilderMonthlyProtocol {
    func monthy(dataCalc: StructApplicationCalc) -> URLRequest
}

class RequestBuilderMonthly: RequestBuilderMonthlyProtocol {
    func monthy(dataCalc: StructApplicationCalc) -> URLRequest {
        let url: URL = {
            guard let urlReceived = ApiUrlRequest(operation: .monthly).getData() else { return URL(string: String.empty)! }
            return urlReceived
        }()
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [ "x-api-key": ApiKey.value ]
        let body = [
            "initial": dataCalc.initial,
            "monthly": dataCalc.monthly,
            "profitability": dataCalc.profitability,
            "period": dataCalc.period
        ]
        do {
            let bodyData = try JSONSerialization.data(withJSONObject: body, options: [])
            request.httpBody = bodyData
            request.httpMethod = ApiData.method
        } catch {
        }
        return request
    }
}
