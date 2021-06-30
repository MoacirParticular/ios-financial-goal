//
//  Activity.swift
//  financialGoal
//
//  Created by Renilson Moreira Ferreira on 23/06/21.
//

import UIKit

var aView: UIView?

extension UIViewController {
    
    func showActivity() {
        aView = UIView(frame: self.view.bounds)
        aView?.backgroundColor = .customColorActivity
        
        let ai = UIActivityIndicatorView(style: .large)
        ai.center = aView?.center ?? UIView().center
        ai.startAnimating()
        aView?.addSubview(ai)
        self.view?.addSubview(aView ?? UIView())
        
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (t) in
            if aView != nil {
                self.showDefaultAlert(.Warning, .TryAgainLatter)
                self.removeActivity()
            }
        }
    }
    
    func removeActivity(){
        aView?.removeFromSuperview()
        aView = nil
    }
}
