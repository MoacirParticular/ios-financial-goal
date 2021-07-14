//
//  ProfileView.swift
//  financialGoal
//
//  Created by Jonattan Moises Sousa on 14/07/21.
//

import UIKit

struct ScreenProfileAtributes {
    static let button: String = "SAIR DO APLICATIVO"
    static let version: String = "versao 1.0.0"
}

struct UserData {
    let nick: String
    let user: String
}

struct ValuesConstraintsProfile{
    static let height: CGFloat = 52
    static let identLeft: CGFloat = 16
    static let identRight: CGFloat = -16
    static let identButtonBottom: CGFloat = -28
    static let identLbVersionBottom: CGFloat = -16
    static let identLbUsernameTop: CGFloat = 5
    static let identLbNicknameTop: CGFloat = 25
}

class ProfileView: UIView {
    
    // MARK: - Action Button
    var onLogoff: (() -> Void)?
    
    // MARK: - Attributes of Screen
    lazy var lbNickname = { LabelComponent(.fontLabelTitleRegular) }()
    lazy var lbUsername = { LabelComponent(.fontLabelCollection, String.empty,
                                           .customColorPageControl) }()
    lazy var btLogout = { ButtonComponent(title: ScreenProfileAtributes.button,
                                          background: .blackCustomGoal,
                                          colorTitle: .customColorTextButton,
                                          font: .fontButtonsBlack,
                                          radius: ValuesConstraintsButton.radiusValue)
    }()
    lazy var lbVersion = { LabelComponent(.fontLabelCollection,
                                          ScreenProfileAtributes.version,
                                          .customColorPageControl)
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError(StringConstants.requiredError)
    }
    // MARK: - Method set values of data user
    
    private func setValues(_ data: UserData) {
        lbNickname.text = data.nick
        lbUsername.text = data.user
    }
    
    // MARK: - Procedures rendering screen
    func createView(_ userData: UserData) {
        self.backgroundColor = .backgroundCustomGoal
        setValues(userData)
        alignNickname()
        alignUsername()
        alignVersion()
        alignButton()
    }
    
    private func alignNickname() {
        addSubview(lbNickname)
        NSLayoutConstraint.activate([
            lbNickname.centerXAnchor.constraint(equalTo:self.centerXAnchor),
            lbNickname.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
                                            constant: ValuesConstraintsProfile.identLbNicknameTop)
        ])
    }
    
    private func alignUsername() {
        addSubview(lbUsername)
        NSLayoutConstraint.activate([
            lbUsername.centerXAnchor.constraint(equalTo:self.centerXAnchor),
            lbUsername.topAnchor.constraint(equalTo: lbNickname.bottomAnchor,
                                            constant: ValuesConstraintsProfile.identLbUsernameTop)
        ])
    }
    
    private func alignButton() {
        addSubview(btLogout)
        setActionButton()
        NSLayoutConstraint.activate([
            btLogout.heightAnchor.constraint(equalToConstant: ValuesConstraintsButton.height),
            btLogout.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                              constant: ValuesConstraintsProfile.identLeft),
            btLogout.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                               constant: ValuesConstraintsProfile.identRight),
            btLogout.bottomAnchor.constraint(equalTo: lbVersion.topAnchor,
                                             constant: ValuesConstraintsProfile.identButtonBottom)
        ])
    }
    
    private func alignVersion() {
        addSubview(lbVersion)
        NSLayoutConstraint.activate([
            lbVersion.centerXAnchor.constraint(equalTo:self.centerXAnchor),
            lbVersion.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                              constant: ValuesConstraintsProfile.identLbVersionBottom)
        ])
    }
    
    // MARK: - Action Button
    private func setActionButton() {
        btLogout.addTarget(self, action: #selector(setActionValue), for: .touchUpInside)
    }
    
    @objc private func setActionValue(sender: UIButton!) {
        self.onLogoff?()
        print("View Foi")
    }
}
