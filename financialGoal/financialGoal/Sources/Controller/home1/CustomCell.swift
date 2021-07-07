//
//  CustomCell.swift
//  financialGoal
//
//  Created by Renilson Moreira Ferreira on 29/06/21.
//

import UIKit

class CustomCell: UICollectionViewCell {
        
    //MARK: Icones da celula
    var icon: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = FrameConstants.frameAutoresizing
        return img
    }()
    
    private func setIcon() {
        addSubview(icon)
        icon.translatesAutoresizingMaskIntoConstraints = FrameConstants.frameAutoresizing
        
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: self.topAnchor, constant: HomeConstants.topAnchorIcon),
            icon.rightAnchor.constraint(equalTo: self.rightAnchor, constant: HomeConstants.rightAnchorIcon),
        ])
    }
    
    //MARK: Titulo da celula
    var title: UILabel = { // LabelComponent(.fontLabelCollection, String.empty, .customColorResultLabel, .center)}()
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = FrameConstants.frameAutoresizing
        label.textAlignment = .center
        label.font = .fontLabelCollection
        label.textColor = .customColorResultLabel
        return label
    }()
 
    private func setTitle() {
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = FrameConstants.frameAutoresizing
        
        NSLayoutConstraint.activate([
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: HomeConstants.botomAnchorTitle),
            title.leftAnchor.constraint(equalTo: leftAnchor, constant: HomeConstants.leftAnchorTitle),
            title.rightAnchor.constraint(equalTo: rightAnchor, constant: HomeConstants.rightAnchorTitle),
        ])
    }
     
    //MARK: Seta os elementos
    func setupView(title: String, icon: UIImage) {
        setTitle()
        setIcon()
    
        self.icon.image = icon
        self.title.text = title
    }
}

