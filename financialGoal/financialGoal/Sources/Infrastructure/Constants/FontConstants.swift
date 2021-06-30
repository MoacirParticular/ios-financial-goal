//
//  FontConstants.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 15/06/21.
//

import UIKit

public extension UIFont {
    
    static let fontDefaultGeorgia = UIFont(name: "Georgia", size: 16) ?? UIFont()
    
    //MARK: Tamanho e Fonte dos botões
    static var fontButtonsBlack: UIFont {
        return UIFont(name: "Roboto-Black", size: 16) ?? fontDefaultGeorgia
    }
    
    //MARK: Tamanho e fonte dos titulos
    static var fontLabelTitleRegular: UIFont {
        return UIFont(name: "Roboto-Regular", size: 24) ?? fontDefaultGeorgia
    }
    
    //MARK: Tamanho e fonte dos subtitulos
    static var fontLabelSubTitleRegular: UIFont {
        return UIFont(name: "Roboto-Regular", size: 15) ?? fontDefaultGeorgia
    }
    
    //MARK: Tamanho e fonte button "Esqueci minha senha"
    static var fontForgetPasswordSubTitleRegular: UIFont {
        return UIFont(name: "Roboto-Regular", size: 13) ?? fontDefaultGeorgia
    }
    
    //MARK: Tamanho e fonte TextField Tela Login"
    static var fontTextFieldLogin: UIFont {
        return UIFont(name: "Roboto-Regular", size: 18) ?? fontDefaultGeorgia
    }
    
    //MARK: Tamanho e fonte descrição
    static var fontDescriptionRegular: UIFont {
        return UIFont(name: "Roboto-Regular", size: 13) ?? fontDefaultGeorgia
    }
    
    //MARK: Tamanho da fonte NickName tela home
    static var fontNickNameHome: UIFont {
        return UIFont(name: "Roboto-Regular", size: 32) ?? fontDefaultGeorgia
    }

}

