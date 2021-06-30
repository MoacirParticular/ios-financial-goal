//
//  MonthlyViewController.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 29/06/21.
//

import UIKit

class MonthlyViewController: UIViewController, viewCalcProtocol {
    var viewCalc: ApplicationCalcView = ApplicationCalcView(frame: .zero)
    let scrollView: UIScrollView = UIScrollView(frame: .zero)
    
    override func loadView() {
        self.setUp()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitleConfig(title: "Aplicação mensal")
    }

    func setUp() {
        self.viewCalc.configElements(infoScreen: InfoCalcScreen.monthly)
        self.setupView(infoScreen: InfoCalcScreen.monthly, viewBase: scrollView)
        self.view = scrollView
    }
}
