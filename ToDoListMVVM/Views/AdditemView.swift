//
//  AdditemView.swift
//  ToDoListMVVMProject
//
//  Created by Dip Dutt on 2/4/24.
//

import SwiftUI

struct AdditemView: View {
    
    // MARK: - Properties
    @State var textFieldTitle:String = ""
    @EnvironmentObject var vm: ItemsViewModel
    @State var showAlert:Bool = false
    @Environment(\.dismiss) var dismiss
    
    
    // MARK: - body
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    TextField(text: $textFieldTitle, label: {
                        Text("type your item")
                    })
                    .padding()
                    .frame(height:50)
                    .background(Color.gray.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    // MARK: - Create action Button to save item
                    Button {
                        additem()
                    } label: {
                        Text("Save")
                            .foregroundStyle(Color.white)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                }
                .padding()
                .navigationTitle("Add an item 🖌️")
            }
            .scrollDisabled(true)
            .alert(
                "An alert is showing ❌",
                isPresented: $showAlert) {
                    Button("Ok",role: .destructive) {
                        
                    }
                }
        }
        
    }
    
    // MARK: - add items from the textField.
    func additem() {
        if textFieldTitle.count >= 3 {
            vm.addItems(item: textFieldTitle)
            dismiss()
        }
        else {
            showAlert.toggle()
        }
    }
}
// MARK: - Preview
#Preview {
    
    AdditemView()
        .environmentObject(ItemsViewModel())
    
}
