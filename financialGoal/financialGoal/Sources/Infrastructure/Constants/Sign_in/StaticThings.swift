//
//  StaticText.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 15/06/21.
//

import UIKit

struct ScreenAttributes {
    static let screenTitle: String = "Abra sua conta"
}
struct ValuesSignIn_Mail {
    static let subtitile = "Abra sua conta em 2 minutos. É gratis!"
    static let description = "Insira seu e-mail para começar."
    static let placeholder = "e-mail"
    static let buttonTitle = "CONTINUAR"
}

struct ValuesSignIn_Name {
    static let subtitile = "Quase lá"
    static let description = "Defina como devemos chamar você."
    static let placeholder = "primeiro nome ou apelido"
    static let buttonTitle = "CONTINUAR"
}

struct ValuesSignIn_Passwd {
    static let subtitile = "Último passo"
    static let description = "Crie uma senha segura para acessar sua conta."
    static let placeholder = "senha"
    static let buttonTitle = "CRIAR CONTA"
    static let observation = "por favor, crie uma senha com pelo menos 8 dígitos"
}

struct StaticConfigLabel {
//    static let subtitleSize: CGFloat = 23
    static let subtitleNumberOfLines: Int = 0
    static let descriptionSize: CGFloat = 15
}

struct ValuesConstraintsTextField {
    static let identTop: CGFloat = 19
    static let identLeft: CGFloat = 16
    static let identRight: CGFloat = -16
    static let height: CGFloat = 60
    static let textIdent: CGFloat = 15
}

struct ValuesConstraintsLabel {
    static let identTop: CGFloat = 20
    static let identLeft: CGFloat = 24
    static let identRight: CGFloat = -24
}

struct ValuesConstraintsButton {
    static let height: CGFloat = 52
    static let identLeft: CGFloat = ValuesConstraintsTextField.identLeft
    static let identRight: CGFloat = ValuesConstraintsTextField.identRight
    static let identBotton: CGFloat = -20
    static let radiusValue: CGFloat = 6
    static let titleSize: CGFloat = 16
}
struct ShadowTextField {
    static let shadowWidth: CGFloat = -6
    static let shadowHeight: CGFloat = 4
    static let shadowRadius: CGFloat = 2.0
    static let shadowOpacity: Float = 0.1
    
}
