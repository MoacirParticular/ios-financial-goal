//
//  CalcsView.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 29/06/21.
//

import UIKit

class CalcsView: UIView {
    //MARK: - Propertys

    
    var newsListTableView = CalcsTableView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createView() {
        self.backgroundColor = .backgroundCustomGoal
        
        setTableView()
    }
   
    
    private func setTableView() {
        addSubview(newsListTableView)
        newsListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newsListTableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            newsListTableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            newsListTableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            newsListTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        ])
    }
}
