//
//  MonthlyViewController.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 29/06/21.
//

import UIKit

class MonthlyViewController: UIViewController {
    let viewHome = MonthlyView(frame: .zero)
    
    override func loadView() {
        self.view = viewHome
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.removeActivity()
    }
}
