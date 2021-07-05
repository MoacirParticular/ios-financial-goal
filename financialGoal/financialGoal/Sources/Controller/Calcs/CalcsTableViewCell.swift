//
//  CalcsTableViewCell.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 29/06/21.
//

import UIKit

class CalcsTableViewCell: UITableViewCell {
   
    lazy var backView: UIView = {
        let view = UIView(frame: ValueCalcsConstants.valueFrameBackView)
        return view
    }()
    
    lazy var iconImage: UIImageView = {
        let iconImage = UIImageView(frame: ValueCalcsConstants.valueFrameIconImage)
        iconImage.contentMode = .scaleAspectFill
        return iconImage
    }()
    
    lazy var calcLabel: UILabel = {
        let label = UILabel(frame: ValueCalcsConstants.valueFrameLabel)
        label.textColor = .colorLabelCalcsType
        label.font = .fontCalcType
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setSelected(data: CalcsModel){
        addSubview(backView)
        
        self.iconImage.image = data.imageIconsGallery
        self.calcLabel.text = data.calcTypesName
        backView.addSubview(iconImage)
        backView.addSubview(calcLabel)
    }
    
}




