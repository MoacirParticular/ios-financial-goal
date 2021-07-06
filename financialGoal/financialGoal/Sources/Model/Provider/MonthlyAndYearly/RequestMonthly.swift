//
//  RequestMonthly.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 01/07/21.
//

import Foundation

typealias returnMonthlyCompletion = (Result<ReturnMonthlyCalc, Error>) -> Void

protocol RequestMonthlyCalcProtocol {
    func calc(_ dataCalc: StructApplicationCalc, completionHandler: @escaping returnMonthlyCompletion)
}

final class RequestMonthlyCalc: RequestMonthlyCalcProtocol {
    func calc(_ dataCalc: StructApplicationCalc, completionHandler: @escaping returnMonthlyCompletion) {
        let bodyTask = RequestBuilderMonthly().monthly(dataCalc: dataCalc)
        let session = URLSession.shared
        let task = session.dataTask(with: bodyTask) { (data, response, error) in
            if let error = error {
                completionHandler(.failure(error))
            } else if let data = data {
                do {
                    let dataCalc = try JSONDecoder().decode(ReturnMonthlyCalc.self, from: data)
                    completionHandler(.success(dataCalc))
                } catch let error as NSError {
                    completionHandler(.failure(error))
                }
            }
        }
        task.resume()
    }
}
