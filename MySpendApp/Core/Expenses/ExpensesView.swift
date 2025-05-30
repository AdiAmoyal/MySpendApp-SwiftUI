//
//  ExpensesView.swift
//  MySpendApp
//
//  Created by Adi Amoyal on 28/05/2025.
//

import SwiftUI

struct ExpensesView: View {
    
    @State private var totalExpenses: Double = 23546.68
    @State private var currency: Currency = .usd
    @State private var expenses: [ExpenseModel] = []
    @State private var isLoading: Bool = true
    
    @State private var showCreateExpenseView: Bool = false
    
    var body: some View {
        NavigationStack{
            List {
                welcomeSection
                totalExpensesSection
                expensesListSection
            }
            .scrollIndicators(.hidden)
            .overlay(alignment: .bottomTrailing) {
                addNewExpenseButton
                    .padding(16)
                    .padding(.horizontal, 16)
            }
            .sheet(isPresented: $showCreateExpenseView) {
                CreateExpenseView()
                    .presentationDetents([.fraction(0.65)])
            }
        }
        .task {
            await loadData()
        }
    }
    
    private func loadData() async {
        try? await Task.sleep(for: .seconds(2))
        isLoading = false
        expenses = ExpenseModel.mockList
    }
    
    private var welcomeSection: some View {
        Section {
            Text("Welcome back!")
                .font(.title2)
                .fontWeight(.semibold)
                .removeListRowFormmating()
        }
    }
    
    private var totalExpensesSection: some View {
        Section {
            VStack(alignment: .leading, spacing: 0) {
                Text("Expense total")
                    .font(.body)
                    .fontWeight(.light)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.bottom, 24)
                
                Text(totalExpenses.convertDoubleToStringWithCurrency(currency: currency))
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.bottom, 14)
            }
            .padding(18)
            .background(
                LinearGradient(
                    colors: [
                        Color.accent.opacity(0.4),
                        Color.accent.opacity(0.2),
                        Color.accent.opacity(0.2),
                        Color.accent.opacity(0.1),
                        Color.accent.opacity(0.2)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .cornerRadius(10)
            .removeListRowFormmating()
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
    
    private var expensesListSection: some View {
        Section {
            if expenses.isEmpty {
                Group {
                    if isLoading {
                        ProgressView()
                    } else {
                        Text("Click + to add new expense")
                    }
                }
                .padding(50)
                .frame(maxWidth: .infinity)
                .font(.body)
                .foregroundStyle(.secondary)
                .removeListRowFormmating()
                
            } else {
                ForEach(expenses, id: \.self) { expense in
                    ExpenseRowView(
                        amount: expense.amount.convertDoubleToStringWithCurrency(currency: currency),
                        category: expense.category.rawValue.localizedUppercase,
                        description: expense.description,
                        time: expense.dateCreated.toFormattedString()
                    )
                    .removeListRowFormmating()
                }
                .onDelete(perform: onDeleteExpense)
            }
        } header: {
            HStack {
                Text("Recent Expenses")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button {
                    
                } label: {
                    Text("See all")
                        .foregroundStyle(.accent)
                }
            }
        }
    }
    
    private func onDeleteExpense(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        expenses.remove(at: index)
    }
    
    private var addNewExpenseButton: some View {
        Button {
            onAddNewExpensePressed()
        } label: {
            Image(systemName: "plus")
                .font(.title2)
                .fontWeight(.medium)
                .padding(16)
                .foregroundStyle(.white)
                .background(.accent)
                .clipShape(Circle())
        }
    }
    
    private func onAddNewExpensePressed() {
        showCreateExpenseView = true
    }
}



#Preview {
    ExpensesView()
}
