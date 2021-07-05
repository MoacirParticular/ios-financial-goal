//
//  requestForgotPassword.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 21/06/21.
//

import Foundation

typealias returnCompletionRecoveryPass = (Result<ReturnDecode, Error>) -> Void

protocol RequestRecoveryPassProtocol {
    func recoveryPass(_ username: String, completionHandler: @escaping returnCompletion)
}

final class RequestRecoveryPass: RequestRecoveryPassProtocol {
    
    func recoveryPass(_ username: String, completionHandler: @escaping returnCompletion) {
        let bodyTask = RequestBuilderRecoveryPass().recoveryPass(username)
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
