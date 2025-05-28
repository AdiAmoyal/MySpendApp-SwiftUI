//
//  View + EXT.swift
//  MySpendApp
//
//  Created by Adi Amoyal on 28/05/2025.
//
import SwiftUI

extension View {
    
    func callToActionButton() -> some View {
        self
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(.accent)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
}
