//
//  WelcomeView.swift
//  MySpendApp
//
//  Created by Adi Amoyal on 28/05/2025.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Spacer()
                imageSection
                titleSection
                Spacer()
                Spacer()
                getStartedButton
            }
            .padding(16)
        }
    }
    
    private var imageSection: some View {
        Image(systemName: "creditcard.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .foregroundStyle(.accent)
    }
    
    private var titleSection: some View {
        VStack(spacing: 8) {
            Text("Welcome to MySpend")
                .font(.title)
                .fontWeight(.heavy)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Text("Track your spending, stay on budget, and gain insights into your expenses")
                .multilineTextAlignment(.center)
                .font(.title3)
                .fontWeight(.light)
        }
    }
    
    private var getStartedButton: some View {
        NavigationLink {
            OnboardingCompletedView()
        } label: {
            Text("Get Started")
                .callToActionButton()
        }
    }
}

#Preview {
    WelcomeView()
}
