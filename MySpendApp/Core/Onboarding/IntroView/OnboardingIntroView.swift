//
//  IntroView.swift
//  MySpendApp
//
//  Created by Adi Amoyal on 28/05/2025.
//

import SwiftUI

struct OnboardingIntroView: View {
    var body: some View {
        VStack {
            Group {
                Text("Track Your Spending\n")
                    .fontWeight(.bold)
                    .foregroundStyle(.accent)
                +
                Text("Quickly log your expenses to stay on top of your daily spending\n\n")
                +
                Text("Visualize Your Budget\n")
                    .fontWeight(.bold)
                    .foregroundStyle(.accent)
                +
                Text("Get clear summaries and charts to understand where your money goes")
            }
            .baselineOffset(6)
            .font(.title3)
            .frame(maxHeight: .infinity)
            .padding(24)
            
            NavigationLink {
                OnboardingSetupView()
            } label: {
                Text("Continue")
                    .callToActionButton()
            }
        }
        .padding(24)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    OnboardingIntroView()
}
