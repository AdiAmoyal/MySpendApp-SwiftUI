//
//  OnboardingCompletedView.swift
//  MySpendApp
//
//  Created by Adi Amoyal on 28/05/2025.
//

import SwiftUI

struct OnboardingCompletedView: View {
    
    @Environment(AppState.self) private var root
    
    var currency: Currency
    
    @State private var isCompletiongProfileSetup: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("You're All Set!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.accent)
            
            Text("You can now start tracking your expenses with MySpend.")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
        }
        .frame(maxHeight: .infinity)
        .safeAreaInset(edge: .bottom, content: {
            ctaButton
        })
        .padding(24)
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private var ctaButton: some View {
        Button {
            onFinishButtonPressed()
        } label: {
            ZStack {
                if isCompletiongProfileSetup {
                    ProgressView()
                        .tint(.white)
                } else {
                    Text("Finish")
                        .callToActionButton()
                }
            }
        }
        .disabled(isCompletiongProfileSetup)
    }
    
    func onFinishButtonPressed() {
        isCompletiongProfileSetup = true
        Task {
            // other logic to complete onboarding
            try await Task.sleep(for: .seconds(3))
            isCompletiongProfileSetup = false
            
            root.updateViewState(showTabBarView: true)
        }
    }
}

#Preview {
    OnboardingCompletedView(currency: .usd)
        .environment(AppState())
}
