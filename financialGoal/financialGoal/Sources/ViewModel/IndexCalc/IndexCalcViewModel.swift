//
//  IndexCalcViewModel.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 05/07/21.
//

import Foundation

typealias returnIndexCalcViewModel = (IndexCalcCodable?, Error?) -> Void

public class IndexCalcViewModel: NSObject {
    
    final func requestCalc(_ structRequest: IndexCalcSubmit, completionHandler: @escaping(returnIndexCalcViewModel)) {
        RequestIndexCalc().calc(structRequest) { (resultRetuned) in
            var dataReturn: IndexCalcCodable?
            var errorReturn: Error?
            switch(resultRetuned) {
            case .success(let dataBack):
                dataReturn = dataBack
                break
            case .failure(let error):
                errorReturn = error
                break
            }
            completionHandler(dataReturn, errorReturn)
        }
    }
}
