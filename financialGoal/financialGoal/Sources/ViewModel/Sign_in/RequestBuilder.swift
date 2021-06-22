//
//  RequestBuilder.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 21/06/21.
//

import Foundation

class RequestBuilder {
    
    func signIn(_ username: String, _ nickname: String, _ password: String) -> URLRequest{
        let url: URL = {
            guard let url = ApiUrlRequest(operation: .signIn).getData() else { return URL(string: String.empty)!}
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
