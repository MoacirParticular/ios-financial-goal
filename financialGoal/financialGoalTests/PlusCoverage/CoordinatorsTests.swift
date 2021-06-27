//
//  CoordinatorsTests.swift
//  financialGoalTests
//
//  Created by Jonattan Moises Sousa on 25/06/21.
//

import XCTest
@testable import financialGoal

class CoordinatorsTest: XCTestCase {

    override class func setUp() {
        super.setUp()
        //
    }
    
    override class func tearDown() {
        //
        super.tearDown()
    }

    func testSignInMailCoordinator() {
        let navigation: UINavigationController = UINavigationController()
        let coordinator: Coordinator = SignInCoordinator(navigationController: navigation)
        coordinator.start()
    }
    
    func testSignInUserCoordinator() {
        let navigation: UINavigationController = UINavigationController()
        let coordinator: Coordinator = SignInNameCoordinator(navigationController: navigation)
        coordinator.start()
    }
    
    func testSignInPasswdCoordinator() {
        let navigation: UINavigationController = UINavigationController()
        let coordinator: Coordinator = SignInPasswdCoordinator(navigationController: navigation)
        coordinator.start()
    }
    
    func testLoginCoordinator() {
        let navigation: UINavigationController = UINavigationController()
        let coordinator: Coordinator = LoginCoordinator(navigationController: navigation)
        coordinator.start()
    }
    
    func testHomeCoordinator() {
        let navigation: UINavigationController = UINavigationController()
        let coordinator: Coordinator = HomeCoordinator(navigationController: navigation)
        coordinator.start()
    }
}

