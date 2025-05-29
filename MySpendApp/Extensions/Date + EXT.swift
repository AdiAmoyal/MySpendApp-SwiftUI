//
//  Date + EXT.swift
//  MySpendApp
//
//  Created by Adi Amoyal on 29/05/2025.
//
import SwiftUI

extension Date {
    func toFormattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM yyyy" // למשל: 2 May 2025
        return formatter.string(from: self)
    }
}
