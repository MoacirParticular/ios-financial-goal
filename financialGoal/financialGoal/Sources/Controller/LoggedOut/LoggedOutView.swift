//
//  LoggedOutView.swift
//  financialGoal
//
//  Created by Renilson Moreira Ferreira on 15/06/21.
//

import UIKit

class LoggedOutView: UIView {
    
    //MARK: PageControl
    let imagePage: [UIImage] = [.imageDescomplicou, .imagePlanejamento, .imageFicaDica, .imageNaPalmaDaMao]
    
    public let scrollView = UIScrollView()
    
    public let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 4
        pageControl.pageIndicatorTintColor = .customColorPageControl
        pageControl.currentPageIndicatorTintColor = .greenCustomGoal
        
        return pageControl
    }()
    
     // Adiciona a pageControl e scroll na view
    func addToViewControllerPageControl(view: UIView){
        view.backgroundColor = .backgroundCustomGoal
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
        view.addSubview(scrollView)
        view.addSubview(pageControl)
    }
    
    // rola o slide de acordo com o click no page control
    @objc private func pageControlDidChange(_ sender: UIPageControl){
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * scrollView.frame.size.width, y: 0), animated: true)
    }
    
    //MARK: ScrollView
    public func configureScrollView(view: UIView){
        scrollView.contentSize = CGSize(width: view.frame.size.width*4, height: scrollView.frame.size.height)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        
        for i in 0..<4{
            let page = UIImageView(frame: CGRect(x: CGFloat(i) * view.frame.size.width, y: 0, width: view.frame.size.width, height: scrollView.frame.size.height))
            page.image = imagePage[i]
            scrollView.addSubview(page)
        }
    }

    
    // Define o tamanho do scroll(imagem) e do pageControl
    func setFramePageScroll(view: UIView){
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        
        pageControl.frame = CGRect(x: 0, y: scrollView.frame.size.height-18, width: view.frame.size.width, height: 70)
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: screenHeight / 5 * 3.3)
        
        if scrollView.subviews.count == 2 {
            configureScrollView(view: view)
        }
    }
    
    //MARK: BUTTONS
    let buttonCreateAccount: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = .zero
        button.layer.cornerRadius = ButtonConstants.cornerRadiusButtom
        button.backgroundColor = .greenCustomGoal
        button.titleLabel?.font = .fontButtonsBlack
        button.setTitle(StringConstants.titleButtonCreateAccount, for: .normal)
        button.tintColor = .customColorTextButton
        return button
    }()
    
    let buttonLogin: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = .zero
        button.layer.cornerRadius = ButtonConstants.cornerRadiusButtom
        button.backgroundColor = .blackCustomGoal
        button.titleLabel?.font = .fontButtonsBlack
        button.setTitle(StringConstants.titleButtonLogin, for: .normal)
        button.tintColor = .customColorTextButton
        return button
    }()
    
    //MARK: Constraints Buttons
    
    func setButtonCreateAccount(){
       buttonCreateAccount.addTarget(self, action: #selector(createAccountActionButton), for: .touchUpInside)
      
       addSubview(buttonCreateAccount)
       NSLayoutConstraint.activate([
        buttonCreateAccount.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: ButtonConstants.bottomAnchorButtonCreateAccount),
        buttonCreateAccount.leftAnchor.constraint(equalTo: self.leftAnchor, constant: ButtonConstants.leftAnchorButtons),
        buttonCreateAccount.rightAnchor.constraint(equalTo: self.rightAnchor, constant: ButtonConstants.rightAnchorButtons),
        buttonCreateAccount.heightAnchor.constraint(equalToConstant: ButtonConstants.heightAnchorButtons)
       ])
   }
    
    func setButtonLogin() {
       buttonLogin.addTarget(self, action: #selector(loginActionButton), for: .touchUpInside)
        
       addSubview(buttonLogin)
       NSLayoutConstraint.activate([
        buttonLogin.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: ButtonConstants.bottomAnchorButtonLogin),
        buttonLogin.leftAnchor.constraint(equalTo: self.leftAnchor, constant: ButtonConstants.leftAnchorButtons),
        buttonLogin.rightAnchor.constraint(equalTo: self.rightAnchor, constant: ButtonConstants.rightAnchorButtons),
        buttonLogin.heightAnchor.constraint(equalToConstant: ButtonConstants.heightAnchorButtons)
       ])
   }
   
    //MARK: Actions Buttons
    @objc
    func createAccountActionButton(sender: UIButton!) {
        print("Button create account acionado")
    }
    
    @objc
    func loginActionButton(sender: UIButton!) {
        print("Button login acionado")

    }
    
    //MARK: Cria e seta os buttons
    override init(frame: CGRect) {
        super.init(frame: frame)
        createViewButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createViewButton(){
        setButtonCreateAccount()
        setButtonLogin()
    }
    
}

