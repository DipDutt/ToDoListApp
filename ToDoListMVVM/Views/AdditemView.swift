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
    
    // MARK: - body
    var body: some View {
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
        
    }
}
// MARK: - Preview
#Preview {
    NavigationStack {
        AdditemView()
    }
}
