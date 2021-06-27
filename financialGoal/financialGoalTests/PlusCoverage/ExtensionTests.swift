//
//  ExtensionTests.swift
//  financialGoalTests
//
//  Created by Jonattan Moises Sousa on 25/06/21.
//

import XCTest
@testable import financialGoal

class ExtensionTests: XCTestCase {

    override class func setUp() {
        super.setUp()
        //
    }
    
    override class func tearDown() {
        //
        super.tearDown()
    }
    
    func testDeveRetornarSenhaValida() {
        let validatePassword = "passTest".isValidPassword
        XCTAssertTrue(validatePassword, "Tamanho de senha inválido")
    }
    
    func testDeveRetornarEmailInvalido() {
        let validaEmail = "orleans@gmail".isValidEmail
        XCTAssertFalse(validaEmail, "E-mail válido")
    }

}
