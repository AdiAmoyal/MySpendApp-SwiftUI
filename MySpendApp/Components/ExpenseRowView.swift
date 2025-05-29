//
//  ExpenseRowView.swift
//  MySpendApp
//
//  Created by Adi Amoyal on 29/05/2025.
//

import SwiftUI

struct ExpenseRowView: View {
    
    var amount: String = "$127.5"
    var category: String = "Food"
    var description: String = "Buy lunch"
    var time: String = "2 May 2025"
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                Text(description)
                    .font(.headline)
                    .bold()
                
                Text(category)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .trailing, spacing: 12) {
                Text(amount)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                
                Text(time)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .fontWeight(.light)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(12)
        .padding(.horizontal, 4)
        .padding(.vertical, 6)
        .background(Color(uiColor: .systemBackground))
    }
}

#Preview {
    ExpenseRowView()
}
