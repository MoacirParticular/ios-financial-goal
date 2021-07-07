//
//  RequestBuilderLogin.swift
//  financialGoal
//
//  Created by Renilson Moreira Ferreira on 22/06/21.
//

import Foundation

protocol RequestBuilderLoginProtocol {
    func login(_ username: String, _ password: String) -> URLRequest
}

class RequestBuilderLogin: RequestBuilderLoginProtocol {
    
    func login(_ username: String, _ password: String) -> URLRequest {
        let url: URL = {
            guard let url = ApiUrlRequest(operation: .login).getData() else { return URL(string: String.empty)! }
            return url
        }()
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [ StringConstants.headFieldKey : ApiKey.value ]
        let body = [
            StringConstants.headUsername : username,
            StringConstants.headPassword : password
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
