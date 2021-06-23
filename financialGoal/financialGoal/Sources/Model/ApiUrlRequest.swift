//
//  ApiRequest.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 21/06/21.
//

import Foundation

class ApiUrlRequest {
    private let urlRequest: String
    
    init(environment: Environment = .develop , operation: Operation) {
        self.urlRequest = ApiData.url+environment.rawValue+operation.rawValue
    }
    
    func getData() -> URL? {
        return URL(string: urlRequest)
    }
}
