//
//  ProfileView.swift
//  MySpendApp
//
//  Created by Adi Amoyal on 28/05/2025.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(AppState.self) private var appState
    @State private var currentUser: UserModel = .mock1
    @State private var selectedCurrencyRaw: Currency?
    
    private var selectedCurrency: Binding<Currency> {
            Binding<Currency>(
                get: { selectedCurrencyRaw ?? .usd },
                set: { selectedCurrencyRaw = $0 }
            )
        }
    
    var body: some View {
        NavigationStack {
            List {
                preferencesSection
                actionsSection
            }
            .navigationTitle("Profile")
            .onAppear {
                selectedCurrencyRaw = currentUser.currency
            }
            .onChange(of: selectedCurrencyRaw) { oldValue, newValue in
                saveNewCurrency()
            }
        }
    }
    
    private var preferencesSection: some View {
        Section {
            Picker("Currency", selection: selectedCurrency) {
                ForEach(Currency.allCases, id: \.self) { currency in
                    Text(currency.rawValue)
                }
            }
        } header: {
            Text("Preferences")
        }
    }
    
    func saveNewCurrency() {
        // TODO: Save new selected currency
    }
    
    private var actionsSection: some View {
        Section {
            Button("Sign out") {
                onSignOutPressed()
            }
            
            Button("Delete account", role: .destructive) {
                onDeleteAccountPressed()
            }
        }
    }
    
    func onSignOutPressed() {
        appState.updateViewState(showTabBarView: false)
    }
    
    func onDeleteAccountPressed() {
        
    }

}

#Preview {
    ProfileView()
        .environment(AppState())
}
