//
//  RequestIndexCalc.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 05/07/21.
//

import Foundation

typealias returnIndexCalc = (Result<IndexCalcCodable, Error>) -> Void

protocol RequestIndexCalcProtocol {
    func calc(_ indexCalc: IndexCalcSubmit, completionHandler: @escaping returnIndexCalc)
}

final class RequestIndexCalc: RequestIndexCalcProtocol {
    func calc(_ indexCalc: IndexCalcSubmit, completionHandler: @escaping returnIndexCalc) {
        let bodyTask = RequestBuilderIndexCalc().calc(indexCalc)
        let session = URLSession.shared
        let task = session.dataTask(with: bodyTask) { (data, response, error) in
            if let error = error {
                completionHandler(.failure(error))
            } else if let data = data {
                do {
                    let dataCalc = try JSONDecoder().decode(IndexCalcCodable.self, from: data)
                    completionHandler(.success(dataCalc))
                } catch let error as NSError {
                    completionHandler(.failure(error))
                }
            }
        }
        task.resume()
    }
}
