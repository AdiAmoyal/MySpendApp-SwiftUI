//
//  OnboardingSetupView.swift
//  MySpendApp
//
//  Created by Adi Amoyal on 28/05/2025.
//

import SwiftUI

struct OnboardingSetupView: View {
    
    @State private var selectedCurrency: Currency?
    
    var body: some View {
        VStack(spacing: 24) {
            title
            currencyList

            Spacer()
            
            if let selectedCurrency {
                ctaButton
            }

        }
        .padding(24)
        .animation(.bouncy, value: selectedCurrency)
    }
    
    private var title: some View {
        Text("Choose Your Currency")
            .font(.headline)
    }
    
    private var currencyList: some View {
        HStack(spacing: 16) {
            ForEach(Currency.allCases, id: \.self) { currency in
                Text(currency.symbol)
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding(18)
                    .background(
                        Circle()
                            .fill(.accent)
                    )
                    .overlay(content: {
                        Circle()
                            .stroke(lineWidth: selectedCurrency == currency ? 5 : 0)
                            .fill(Color.black.opacity(0.5))
                    })
                    .onTapGesture {
                        selectedCurrency = currency
                    }
            }
        }
    }
    
    private var ctaButton: some View {
        NavigationLink {
            OnboardingCompletedView()
        } label: {
            Text("Continue")
                .callToActionButton()
        }
        .transition(.move(edge: .bottom))
    }
    
    enum Currency: String, CaseIterable {
        case usd = "USD"
        case eur = "EUR"
        case ils = "ILS"
        case gbp = "GBP"
        
        var symbol: String {
            switch self {
            case .usd: return "$"
            case .eur: return "€"
            case .ils: return "₪"
            case .gbp: return "£"
            }
        }
    }
}

#Preview {
    OnboardingSetupView()
}
