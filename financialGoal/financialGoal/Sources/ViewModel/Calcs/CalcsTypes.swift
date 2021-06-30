//
//  RegisterCalcsTypes.swift
//  financialGoal
//
//  Created by Leonardo Oliveira Portes on 29/06/21.
//

import Foundation

public struct CalcsTypes {
    
    static let calcTypes = [CalcsModel(calcTypesName: StringConstantsCalcs.investMensal, imageIconsGallery: .imageInvestMensal, screenType: .Monthly),
                            CalcsModel(calcTypesName: StringConstantsCalcs.investAplicUnic, imageIconsGallery: .aplicacaoUnica, screenType: .Yearly),
                            CalcsModel(calcTypesName: StringConstantsCalcs.correcaoIndice, imageIconsGallery: .correcaoIndice, screenType: .Yearly),
                            CalcsModel(calcTypesName: StringConstantsCalcs.conversaoTaxas, imageIconsGallery: .conversaoTaxas, screenType: .Yearly)]
}
