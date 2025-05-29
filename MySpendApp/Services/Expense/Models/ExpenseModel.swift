//
//  ExpenseModel.swift
//  MySpendApp
//
//  Created by Adi Amoyal on 29/05/2025.
//

import Foundation

struct ExpenseModel: Identifiable, Hashable {
    
    let id: String
    let amount: Double
    let description: String
    let category: Category
    let dateCreated: Date
    
    init(
        id: String = UUID().uuidString,
        amount: Double,
        description: String,
        category: Category,
        dateCreated: Date
    ) {
        self.id = id
        self.amount = amount
        self.description = description
        self.category = category
        self.dateCreated = dateCreated
    }
}

enum Category: String, CaseIterable {
    case food, shopping, subscription, entertainment, other
}

extension ExpenseModel {
    static let mock1 = ExpenseModel(
        amount: 45.99,
        description: "Grocery shopping",
        category: .food,
        dateCreated: Date()
    )
    
    static let mock2 = ExpenseModel(
        amount: 12.50,
        description: "Netflix subscription",
        category: .subscription,
        dateCreated: Date().addingTimeInterval(-86400 * 2)
    )
    
    static let mock3 = ExpenseModel(
        amount: 89.00,
        description: "New shoes",
        category: .shopping,
        dateCreated: Date().addingTimeInterval(-86400 * 5)
    )
    
    static let mock4 = ExpenseModel(
        amount: 27.75,
        description: "Movie tickets",
        category: .entertainment,
        dateCreated: Date().addingTimeInterval(-86400)
    )
    
    static let mock5 = ExpenseModel(
        amount: 8.20,
        description: "Coffee",
        category: .other,
        dateCreated: Date().addingTimeInterval(-3600)
    )
    
    static let mockList: [ExpenseModel] = [
        .mock1, .mock2, .mock3, .mock4, .mock5
    ]
}
