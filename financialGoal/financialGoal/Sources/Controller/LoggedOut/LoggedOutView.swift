//
//  LoggedOutView.swift
//  financialGoal
//
//  Created by Renilson Moreira Ferreira on 15/06/21.
//

import UIKit

class LoggedOutView: UIView {
    
    //MARK: Actions Buttons
    var onLoginButton: ((_ setLogin: LoginType ) -> Void)?
    
    //MARK: PageControl
    private let imagePage: [UIImage] = [.imageDescomplicou, .imagePlanejamento, .imageFicaDica, .imageNaPalmaDaMao]
    
    let scrollView = UIScrollView()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .customColorPageControl
        pageControl.currentPageIndicatorTintColor = .greenCustomGoal
        return pageControl
    }()
    
    //MARK: Adiciona o pageControl e scroll na view
    func addToViewControllerPageControl(){
        self.backgroundColor = .backgroundCustomGoal
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
        self.addSubview(scrollView)
        self.addSubview(pageControl)
    }
    
    //MARK: Rola o slide de acordo com o click no pageControl
    @objc private func pageControlDidChange(_ sender: UIPageControl){
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * scrollView.frame.size.width, y: PageAndScrollConstants.numberZero), animated: true)
    }
    
    //MARK: Propertis ScrollView
    func configureScrollView(){
        scrollView.contentSize = CGSize(width: self.frame.size.width*PageAndScrollConstants.numberFour, height: scrollView.frame.size.height)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        
         //MARK: Seta as imagens no Scroll
        for i in PageAndScrollConstants.numberZeroFor..<self.imagePage.count{
            
            let page = UIImageView(frame: CGRect(x: CGFloat(i) * self.frame.size.width, y: PageAndScrollConstants.numberZero, width: self.frame.size.width, height: scrollView.frame.size.height))
            
            page.image = self.imagePage[i]
            
            scrollView.addSubview(page)
        }
    }
    
    //MARK: Define o tamanho do scrollView e do pageControl
    func setFramePageScroll(){
        
        //Pega a altura do device
        let screenSize = UIScreen.main.bounds
        var screenHeight = screenSize.height
        if screenHeight > PageAndScrollConstants.deviceScreenSize {
            screenHeight = screenHeight / PageAndScrollConstants.numberFive * PageAndScrollConstants.numberTrue
        }else{
            screenHeight = screenHeight / PageAndScrollConstants.numberFive * PageAndScrollConstants.numberThreePointThree
        }
    
        //Constants do scrolView e pageControl
        pageControl.frame = CGRect(x: PageAndScrollConstants.numberZero, y: scrollView.frame.size.height-PageAndScrollConstants.numberEighteen, width: self.frame.size.width, height: PageAndScrollConstants.numberSeventy)
        
        scrollView.frame = CGRect(x: PageAndScrollConstants.numberZero, y: PageAndScrollConstants.numberZero, width: self.frame.size.width, height: screenHeight)
        
        //Chama a função pra configurar o scroll
        if scrollView.subviews.count == PageAndScrollConstants.numberTwo {
            configureScrollView()
        }
    }
    
    //MARK: BUTTONS
     let buttonCreateAccount: UIButton = {ButtonComponent(title: StringConstants.titleButtonCreateAccount, background: .greenCustomGoal, colorTitle: .customColorTextButton, font: .fontButtonsBlack, radius: ButtonConstants.cornerRadiusButtom)}()
    
    let buttonLogin: UIButton = {ButtonComponent(title: StringConstants.titleButtonLogin, background: .blackCustomGoal, colorTitle: .customColorTextButton, font: .fontButtonsBlack, radius: ButtonConstants.cornerRadiusButtom)}()
    
    //MARK: Constraints Buttons
    func setButtonCreateAccount(){
        buttonCreateAccount.addTarget(self, action: #selector(createAccountActionButton), for: .touchUpInside)
        addSubview(buttonCreateAccount)
        // Seta os botões de acordo com o tamanho do device
        if UIScreen.main.bounds.height > PageAndScrollConstants.deviceScreenSize {
            ButtonConstants.bottomAnchorButtonCreateAccount = ButtonConstants.bottomAnchorButtonCreateAccountBigger
        }
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
            buttonLogin.topAnchor.constraint(equalTo: self.buttonCreateAccount.bottomAnchor, constant: ButtonConstants.distanceButtons),
            buttonLogin.leftAnchor.constraint(equalTo: self.leftAnchor, constant: ButtonConstants.leftAnchorButtons),
            buttonLogin.rightAnchor.constraint(equalTo: self.rightAnchor, constant: ButtonConstants.rightAnchorButtons),
            buttonLogin.heightAnchor.constraint(equalToConstant: ButtonConstants.heightAnchorButtons)
        ])
    }
    
    //MARK: Actions Buttons
    @objc
    func createAccountActionButton(sender: UIButton!) {
        onLoginButton?(LoginType.CreateAccount)
    }
    
    @objc
    func loginActionButton(sender: UIButton!) {
        onLoginButton?(LoginType.Login)
        
    }
    
    //MARK: Cria e seta elementos na view
    private func createViewButton(){
        setButtonCreateAccount()
        setButtonLogin()
    }
    
    private func setView(){
        createViewButton()
        pageControl.numberOfPages = self.imagePage.count
        addToViewControllerPageControl()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError(StringConstants.requiredError)
    }
}

