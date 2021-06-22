//
//  ApiRequest.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 21/06/21.
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
}
enum Environment: String, CodingKey{
    case develop = "dev/"
    case production = "prod/"
}

class ApiUrlRequest {
    private let urlRequest: String
    
    init(environment: Environment = .develop , operation: Operation) {
        self.urlRequest = ApiData.url+environment.rawValue+operation.rawValue
    }
    
    func getData() -> URL? {
        return URL(string: urlRequest)
    }
}
