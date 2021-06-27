//
//  RequestSignInTests.swift
//  financialGoalTests
//
//  Created by Jonattan Moises Sousa on 25/06/21.
//

import XCTest
@testable import financialGoal

struct VerifiersSingIn {
    static let time: Double = 7
    static let InvalidPass: String = "senha inválida"
    static let CreateWithSuccess: String = "sucesso"
}
class RequestSignInTests: XCTestCase {
    
    var request = RequestSignIn()
    var binaryResult: Bool = true
    
    override class func setUp() {
        super.setUp()
        //
    }
    
    override class func tearDown() {
        //
        super.tearDown()
    }
    
    func testMustBeInvalidPassword() {
        let exp = expectation(description: "Checa se senha de cadastro falhar")
        self.request.signIn("ios@ios.com", "Fulano", "12345") { (apiReturn) in
            switch(apiReturn) {
            case .success(let dataSuccess):
                guard let message = dataSuccess.message else { return }
                //                    print("Mensagem retornada: ",message)
                self.binaryResult = !message.contains(VerifiersSingIn.InvalidPass)
                exp.fulfill()
                return
            case .failure(_ ):
                exp.fulfill()
                return
            }
        }
        
        waitForExpectations(timeout: VerifiersSingIn.time) { (error) in
            if let error = error {
                XCTFail("--- ERROR testMustBeInvalidPassword: \(error)")
            }
            XCTAssertFalse(self.binaryResult, "Uma senha válida foi digitada")
        }
    }
    
    func testMustBeCreateUserWithSuccess() {
        let expReturn = expectation(description: "Verifica se cadastrado com sucesso")
        self.request.signIn("ios33@ios.com", "Fulano", "1234509883") { (apiReturn) in
            switch(apiReturn) {
            case .success(let data):
                if let message = data.message {
                    self.binaryResult = !message.contains(VerifiersSingIn.CreateWithSuccess)
                    //                    print("Mensagem retornada: ",message)
                }
                expReturn.fulfill()
                return
            case .failure(_ ):
                expReturn.fulfill()
                return
            }
        }
        
        waitForExpectations(timeout: VerifiersSingIn.time) { (error) in
            if let error = error {
                XCTFail("--- ERROR testMustBeCreateWithSuccess: \(error)")
            }
            XCTAssertFalse(self.binaryResult, "Usuário já existe na base de dados")
        }
    }
}
