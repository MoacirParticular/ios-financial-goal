//
//  CustomCell.swift
//  financialGoal
//
//  Created by Renilson Moreira Ferreira on 29/06/21.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    //MARK: Criação dos elementos
    var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .black)
        label.textColor = .customColorResultLabel
        
        return label
    }()
    
    var icon: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
 
    //MARK: Constrains
    private func setTitle() {
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 96),
            title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 1),
            title.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -1),
        ])
    }
    
    private func setIcon() {
        addSubview(icon)
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            //icon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 1),
            icon.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -6),
        ])
    }
    
    
    func setupView(title: String, icon: UIImage) {
        setTitle()
        setIcon()
        
        self.icon.image = icon
        self.title.text = title
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .colorOrangeCollection
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

