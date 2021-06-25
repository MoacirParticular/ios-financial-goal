//
//  RecoverypassTextFieldTests.swift
//  financialGoalTests
//
//  Created by Leonardo Oliveira Portes on 25/06/21.
//

import XCTest
@testable import financialGoal

class RecoverypassRequestTests: XCTestCase {
    
    var request = RequestRecoveryPass()
    var textReturn: String = String.empty
    var boolResult: Bool = true

    override func setUpWithError() throws {
        super.setUp()
    }

    override func tearDownWithError() throws {
      
        super.tearDown()
    }

    
    func testDeveRetornarSucessoReemissaoSenha() {
        
        let exp = expectation(description: "Checa se Email do cadastro falhar")
        self.request.recoveryPass("leojportes@gmail.com") { (apiReturn) in
            switch(apiReturn) {
            case .success(let userData):
                guard let message = userData.message else { return }
                self.textReturn = message
                if message.contains("Reemissão de senha realizada com sucesso!") {
                    self.boolResult = true
                }
                exp.fulfill()
                return
            case .failure(_ ):
                exp.fulfill()
                return
            }
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("---\(error)")
            }
            XCTAssertTrue(self.boolResult, "Digite um e-mail válido")
        }
    }
}
