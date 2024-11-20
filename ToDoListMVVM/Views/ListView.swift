//
//  ListView.swift
//  ToDoListMVVMProject
//
//  Created by Dip Dutt on 2/4/24.
//

import SwiftUI

struct ListView: View {
    // MARK: Properties
    
    @EnvironmentObject var vm: ItemsViewModel
    
    // MARK: - body
    var body: some View {
        NavigationStack {
            ZStack {
                if vm.items.count == 0 {
                    TopView()
                }
                
                List {
                    ForEach(vm.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                vm.updateItem(item: item)
                            }
                    }
                    .onDelete(perform:vm.deleteItems)
                    .onMove(perform: vm.moveItems)
                }
                .listStyle(.automatic)
                .navigationTitle(" ToDo ListItem 📝")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                            .foregroundStyle(Color("ColorTheme2"))
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            AdditemView()
                        } label: {
                            HStack {
                                Text("Add Item")
                                    .foregroundStyle(Color("ColorTheme2"))
                                Image(systemName: "plus.circle")
                                    .foregroundStyle(Color("ColorTheme2"))
                            }
                        }
                    }
                }
            }
            
        }
    }
}
// MARK: - Preview
#Preview {
    ListView()
        .environmentObject(ItemsViewModel())
    
}
