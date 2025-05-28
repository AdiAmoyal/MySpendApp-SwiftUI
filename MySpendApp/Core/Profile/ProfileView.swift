//
//  ProfileView.swift
//  MySpendApp
//
//  Created by Adi Amoyal on 28/05/2025.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(AppState.self) private var appState
    
    var body: some View {
        NavigationStack {
            List {
                Button {
                    onSignOutPressed()
                } label: {
                    Text("Sign out")
                }
            }
        }
    }
    
    func onSignOutPressed() {
        appState.updateViewState(showTabBarView: false)
    }
}

#Preview {
    ProfileView()
        .environment(AppState())
}
