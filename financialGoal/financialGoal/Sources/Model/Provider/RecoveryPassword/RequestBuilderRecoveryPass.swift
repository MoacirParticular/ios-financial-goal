//
//  RequestBuilderRecoveyPass.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 22/06/21.
//

import Foundation

protocol RequestBuilderSignInProtocol {
    func signIn(_ username: String, _ nickname: String, _ password: String) -> URLRequest
}

class RequestBuilderSignIn: RequestBuilderSignInProtocol {
    
    func signIn(_ username: String, _ nickname: String, _ password: String) -> URLRequest {
        let url: URL = {
            guard let url = ApiUrlRequest(operation: .signIn).getData() else { return URL(string: String.empty)! }
            return url
        }()
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [ "x-api-key": ApiKey.value ]
        let body = [
            "username" : username,
            "nickname" : nickname,
            "password" : password
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
