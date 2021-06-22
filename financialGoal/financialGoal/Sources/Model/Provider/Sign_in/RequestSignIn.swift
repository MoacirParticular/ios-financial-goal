//
//  RequestSignIn.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 21/06/21.
//

import Foundation

typealias returnCompletion = (Result<ReturnDecode, Error>) -> Void

protocol RequestSignInProtocol {
    func signIn(_ name: String, _ nickname: String, _ password: String, completionHandler: @escaping returnCompletion)
}

final class RequestSignIn: RequestSignInProtocol {
    
    func signIn(_ username: String, _ nickname: String, _ password: String, completionHandler: @escaping returnCompletion) {
        let bodyTask = RequestBuilderSignIn().signIn(username, nickname, password)
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


