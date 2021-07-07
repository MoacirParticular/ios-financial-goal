//
//  RequestBuilderIndexCalc.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 05/07/21.
//

import Foundation

protocol RequestBuilderIndexCalcProtocol {
    func calc(_ indexCalc: IndexCalcSubmit) -> URLRequest
}

class RequestBuilderIndexCalc: RequestBuilderIndexCalcProtocol {
    func calc(_ indexCalc: IndexCalcSubmit) -> URLRequest {
        let url: URL = {
            guard let url = ApiUrlRequest(operation: .indexCalcs).getData() else { return URL(string: String.empty)! }
            return url
        }()
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [ StringConstants.headFieldKey : ApiKey.value ]
        let body = [
            CalcFieldsSubmit.initial : "\(indexCalc.initial)",
            CalcFieldsSubmit.cdiPercent : "\(indexCalc.cdiPercent)",
            CalcFieldsSubmit.profitabilityDefinition : "\(indexCalc.profitabilityDefinition)",
            CalcFieldsSubmit.period : "\(indexCalc.period)",
            CalcFieldsSubmit.type : "\(indexCalc.type)"
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
