//
//  ListRowView.swift
//  ToDoListMVVMProject
//
//  Created by Dip Dutt on 2/4/24.
//

import SwiftUI

struct ListRowView: View {
    // MARK: - Properties
    let item:ItemModel
    
    // MARK: - body
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: item.isCompleted ? "checkmark.circle":"circle")
                .foregroundStyle(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
            
        }
        .font(.title2)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 5)
        
    }
}
// MARK: - Preview
#Preview {
    ListRowView(item: ItemModel(title: "firstitem", isCompleted: true))
}
