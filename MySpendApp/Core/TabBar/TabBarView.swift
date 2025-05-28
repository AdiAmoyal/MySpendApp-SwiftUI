//
//  TabBarView.swift
//  MySpendApp
//
//  Created by Adi Amoyal on 28/05/2025.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ExpensesView()
                .tabItem {
                    Label("Expenses", systemImage: "list.bullet.rectangle")
                }
            
            SummaryView()
                .tabItem {
                    Label("Summary", systemImage: "chart.pie")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    TabBarView()
}
