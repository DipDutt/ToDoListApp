//
//  ListView.swift
//  ToDoListMVVMProject
//
//  Created by Dip Dutt on 2/4/24.
//

import SwiftUI

struct ListView: View {
    @State var items:[ItemModel] = [
        ItemModel(title: "FirstItem1", isCompleted: true),
        ItemModel(title: "FirstItem2", isCompleted: false),
        ItemModel(title: "FirstItem3", isCompleted: true)
    ]
    // MARK: - body
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .listStyle(.plain)
        .navigationTitle(" ToDo ListItem 📝")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    AdditemView()
                } label: {
                    HStack {
                        Text("Add Item")
                        Image(systemName: "plus.circle")
                    }
                }
                
            }
        }
    }
}
// MARK: - Preview
#Preview {
    NavigationStack {
        ListView()
    }
}
