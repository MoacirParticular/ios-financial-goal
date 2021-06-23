//
//  Activity.swift
//  financialGoal
//
//  Created by Renilson Moreira Ferreira on 23/06/21.
//

import UIKit

fileprivate var aView : UIView?

extension UIViewController {
    
    func showActivity() {
        aView = UIView(frame: self.view.bounds)
        aView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        let ai = UIActivityIndicatorView(style: .whiteLarge)
        ai.center = aView!.center
        ai.startAnimating()
        aView?.addSubview(ai)
        self.view?.addSubview(aView!)
      
    }
    
    func removeActivity(){
        aView?.removeFromSuperview()
        aView = nil
    }
}
