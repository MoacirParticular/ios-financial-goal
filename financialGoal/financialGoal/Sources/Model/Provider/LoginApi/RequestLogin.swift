//
//  requestLogin.swift
//  financialGoal
//
//  Created by Renilson Moreira Ferreira on 21/06/21.
//

import Foundation

typealias returnCompletion = (Result<ReturnDecode, Error>) -> Void

protocol RequestLoginProtocol {
    func login(_ username: String, _ password: String, completionHandler: @escaping returnCompletion)
}

final class requestLogin: RequestLoginProtocol {
    
    func login(_ username: String, _ password: String, completionHandler: @escaping returnCompletion) {
        let bodyTask = RequestBuilderLogin().login(username, password)
        let session = URLSession.shared
        let task = session.dataTask(with: bodyTask) { (data, response, error) in
            if let error = error {
                completionHandler(.failure(error))
            } else if let data = data {
                do {
                    let dataResponse = try JSONDecoder().decode(ReturnDecode.self, from: data)
                    completionHandler(.success(dataResponse))
                } catch let error as NSError {
                    completionHandler(.failure(error))
                }
            }
        } 
        task.resume()
    }
}
