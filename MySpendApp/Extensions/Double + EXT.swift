//
//  Double + EXT.swift
//  MySpendApp
//
//  Created by Adi Amoyal on 29/05/2025.
//
import SwiftUI

extension Double {
    
    func convertDoubleToStringWithCurrency(currency: Currency) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = currency.symbol
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        return formatter.string(from: NSNumber(value: self)) ?? "\(currency.symbol)\(String(format: "%.2f", self))"
    }
    
}
