//
//  CalcsTableViewCell.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 29/06/21.
//

import UIKit

class CalcsTableViewCell: UITableViewCell {
   
    lazy var backView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 72))
        view.backgroundColor = .red
        return view
    }()
    
    lazy var iconImage: UIImageView = {
        let iconImage = UIImageView(frame: CGRect(x: 10, y: 13, width: 48, height: 48))
        iconImage.contentMode = .scaleAspectFill
        return iconImage
    }()
    
    lazy var calcLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 70, y: 15, width: 250, height: 40))
        label.font = .fontLabelSubTitleRegular
        
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(backView)
        backView.addSubview(iconImage)
        backView.addSubview(calcLabel)
    }
    
}
