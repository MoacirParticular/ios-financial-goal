//
//  requestLoginTests.swift
//  financialGoalTests
//
//  Created by Renilson Moreira Ferreira on 25/06/21.
//

import XCTest
@testable import financialGoal

class RequestSignInTest: XCTestCase {
    
    var request = requestLogin()
    var textReturn: String = String.empty
    var boolResult: Bool = true
    
    override class func setUp() {
    }
    
    override class func tearDown() {
    }
    
    func testDeveRetornarSenhaInválida() {
        
        let exp = expectation(description: "Checa se senha de cadastro falhar")
        self.request.login("fulano@gmail.com", "12345") { (apiReturn) in
            switch(apiReturn) {
            case .success(let dataSuccess):
                guard let message = dataSuccess.message else { return }
                self.textReturn = message
                if message.contains("senha inválida") {
                    self.boolResult = false
                }
                exp.fulfill()
                return
            case .failure(_ ):
                exp.fulfill()
                return
            }
        }
        
        waitForExpectations(timeout: 5) { (error) in
            if let error = error {
                XCTFail("---\(error)")
            }
            print("--: ", self.textReturn)
            XCTAssertFalse(self.boolResult, "Uma senha válida foi digitada")
        }
    }
}
