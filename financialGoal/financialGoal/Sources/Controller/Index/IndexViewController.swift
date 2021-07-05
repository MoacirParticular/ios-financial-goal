//
//  IndexViewController.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 05/07/21.
//


import UIKit

class IndexViewController: UIViewController {
    
        //MARK: Proprieties:
        var indexView = IndexView(frame: FrameConstants.frameZero)
        
        //MARK: Lifecycle:
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = .backgroundCustomGoal
            navigationTitleConfig(title: "Calculo por indice")
      
        }
        
        override func loadView() {
            self.view = indexView
        }
}
