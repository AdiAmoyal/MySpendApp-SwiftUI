//
//  CreateExpenseView.swift
//  MySpendApp
//
//  Created by Adi Amoyal on 29/05/2025.
//

import SwiftUI

struct CreateExpenseView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var amount: String = ""
    @State private var description: String = ""
    @State private var selectedCategory: Category = .food
    @State private var selectedDate: Date = .now
    @State private var isSaving: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                amountSection
                detailsSection
                saveButton
            }
            .navigationTitle("New Expense")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    backButton
                }
            }
        }
    }
    
    private var backButton: some View {
        Button {
            onBackButtonPressed()
        } label: {
            Image(systemName: "xmark")
                .font(.title2)
                .fontWeight(.semibold)
        }
        .foregroundStyle(.black)
    }
    
    private func onBackButtonPressed() {
        dismiss()
    }
    
    private var amountSection: some View {
        Section {
            TextField("0.00", text: $amount)
                .keyboardType(.decimalPad)
        } header: {
            Text("Amount")
        }
    }
    
    private var detailsSection: some View {
        Section {
            TextField("What did you spend on?", text: $description)
            
            Picker("Category", selection: $selectedCategory) {
                ForEach(Category.allCases, id: \.self) { category in
                    Text(category.rawValue.capitalized)
                }
            }
            
            DatePicker("Date", selection: $selectedDate, displayedComponents: [.date])
        }
    }
    
    private func validation() -> Bool {
        guard amount.isEmpty || description.isEmpty else { return false }
        return true
    }
    
    private var saveButton: some View {
        Section {
            Button {
                onSavePressed()
            } label: {
                ZStack {
                    if isSaving {
                        ProgressView()
                            .tint(.white)
                    } else {
                        Text("Save")
                    }
                }
                .callToActionButton()
            }
            .removeListRowFormmating()
            .opacity(validation() ? 0.5 : 1)
            .disabled(isSaving || validation())
            .padding(.top, 24)
        }
    }
    
    private func onSavePressed() {
        isSaving = true
        
        Task {
            try? await Task.sleep(for: .seconds(2))
            dismiss()
            isSaving = false
        }
    }
}

#Preview {
    CreateExpenseView()
}
