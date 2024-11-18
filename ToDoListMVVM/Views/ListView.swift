//
//  ListView.swift
//  ToDoListMVVMProject
//
//  Created by Dip Dutt on 2/4/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var vm: ItemsViewModel
    // MARK: - body
    var body: some View {
        List {
            ForEach(vm.items) { item in
                ListRowView(item: item)
            }
            .onDelete(perform:vm.deleteItems)
            .onMove(perform: vm.moveItems)
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
