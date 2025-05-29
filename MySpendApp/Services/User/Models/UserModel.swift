//
//  UserModel.swift
//  MySpendApp
//
//  Created by Adi Amoyal on 29/05/2025.
//

import Foundation

struct UserModel {
    
    let id: String
    let currency: Currency
    let didCompleteOnboarding: Bool
    let dateCreated: Date
    
    init(
        id: String,
        currency: Currency,
        didCompleteOnboarding: Bool,
        dateCreated: Date
    ) {
        self.id = id
        self.currency = currency
        self.didCompleteOnboarding = didCompleteOnboarding
        self.dateCreated = dateCreated
    }
}

extension UserModel {
    static let mock1 = UserModel(
        id: UUID().uuidString,
        currency: .usd,
        didCompleteOnboarding: true,
        dateCreated: Date()
    )
    
    static let mock2 = UserModel(
        id: UUID().uuidString,
        currency: .ils,
        didCompleteOnboarding: false,
        dateCreated: Date().addingTimeInterval(-86400 * 30)
    )
    
    static let mockList: [UserModel] = [mock1, mock2]
}
