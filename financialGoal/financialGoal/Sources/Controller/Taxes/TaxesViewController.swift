//
//  TaxesViewController.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 30/06/21.
//

import UIKit

class TaxesViewController: UIViewController {
    
    //MARK: Proprieties:
    var taxesView = TaxesView(frame: FrameConstants.frameZero)
    
    //MARK: Lifecycle:
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .backgroundCustomGoal
        navigationTitleConfig(title: StringConstantsTaxes.titleTaxes )

    }
    
    override func loadView() {
        self.view = taxesView
    }

}

