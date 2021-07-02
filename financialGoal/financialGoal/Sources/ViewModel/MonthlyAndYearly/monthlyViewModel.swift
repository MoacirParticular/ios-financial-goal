//
//  MonthlyViewModel.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 01/07/21.
//

import Foundation

typealias returnMonthlyViewModel = (ReturnMonthlyCalc?, Error?) -> Void

final class MonthlyViewModel {

    func request(_ dataCalc: StructApplicationCalc, completionHandler: @escaping returnMonthlyViewModel) {
        
        RequestMonthlyCalc().calc(dataCalc) { (result) in
            
            var errorReceived: Error?
            var dataRet: ReturnMonthlyCalc?
            switch (result) {
            case .failure(let error):
                errorReceived = error
                break
            case .success(let dataReturned):
                completionHandler(dataReturned, errorReceived)
                break
            }
            completionHandler(dataRet, errorReceived)
        }
        
    }
    
}
