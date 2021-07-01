//
//  RequestRecoveryYearly.swift
//  financialGoal
//
//  Created by Renilson Moreira Ferreira on 01/07/21.
//

import Foundation

typealias returnCompletionYearly = (Result<ReturnDecode, Error>) -> Void

protocol RequestYearlyProtocol {
    func yearly(_ periodInMonths: String, _ monthlyRate: String, _ singleApplicationToday: String, completionHandler: @escaping returnCompletion)
}

final class RequestYearly: RequestYearlyProtocol {
    
    func yearly(_ periodInMonths: String, _ monthlyRate: String, _ singleApplicationToday: String, completionHandler: @escaping returnCompletion) {
        
        let bodyTask = RequestBuilderYearly().yearly(periodInMonths, monthlyRate, singleApplicationToday)
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
