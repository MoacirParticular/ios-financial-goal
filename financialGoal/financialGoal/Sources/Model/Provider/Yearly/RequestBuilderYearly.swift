//
//  RequestBuilderYearly.swift
//  financialGoal
//
//  Created by Renilson Moreira Ferreira on 01/07/21.
//

import Foundation

protocol RequestBuilderYearlyProtocol {
    func yearly(_ periodInMonths: String, _ monthlyRate: String, _ singleApplicationToday: String) -> URLRequest
}

class RequestBuilderYearly: RequestBuilderYearlyProtocol {
    
    func yearly(_ periodInMonths: String, _ monthlyRate: String, _ singleApplicationToday: String) -> URLRequest {
        let url: URL = {
            guard let url = ApiUrlRequest(operation: .dadosUserCals).getData() else { return URL(string: String.empty)! }
            return url
        }()
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [ "x-api-key": ApiKey.value ]
        let body = [
            
             "profitability": monthlyRate,
             "period": periodInMonths,
             "initial": singleApplicationToday,
        ]
        do {
            let bodyData = try JSONSerialization.data(withJSONObject: body, options: [])
            request.httpBody = bodyData
            request.httpMethod = ApiData.method
        } catch  {
        }
        return request
    }
}
