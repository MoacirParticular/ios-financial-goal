//
//  RequestBuilderRecoveyPass.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 22/06/21.
//

import Foundation

protocol RequestBuilderRecoveryPassProtocol {
    func recoveryPass(_ username: String) -> URLRequest
}

class RequestBuilderRecoveryPass: RequestBuilderRecoveryPassProtocol {
    
    func recoveryPass(_ username: String) -> URLRequest {
        let url: URL = {
            guard let url = ApiUrlRequest(operation: .forgot).getData() else { return URL(string: String.empty)! }
            return url
        }()
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [ "x-api-key": ApiKey.value ]
        let body = [
            "username" : username,
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
