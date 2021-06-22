//
//  Request.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 21/06/21.
//

import Foundation

typealias returnCompletion = (Result<ReturnDecode, Error>) -> Void

protocol UserRequestProtocol {
    func signIn(_ name: String, _ nickname: String, _ password: String, completionHandler: @escaping returnCompletion)
}

final class Request: UserRequestProtocol {
    
    func signIn(_ name: String, _ nickname: String, _ password: String, completionHandler: @escaping returnCompletion) {
        let bodyTask = RequestBuilder().signIn("jmoisess@everis.com", "Jonattan", "1dddakslkdj")
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


