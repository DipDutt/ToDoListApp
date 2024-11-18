//
//  TopView.swift
//  ToDoListMVVM
//
//  Created by Dip Dutt on 18/11/24.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 5) {
                Text("There Is No Items Here")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("To add 🧾 on the list you can add press button ⏹️ or add item button ▶️ top right corner.")
                    .lineLimit(2)
                    .padding()
                    .font(.title3)
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.green)
                    .multilineTextAlignment(.center)
                  
                NavigationLink {
                    AdditemView()
                } label: {
                    Text("Tap Here")
                        .foregroundStyle(Color.white)
                        .frame(height: 50)
                        .frame(width: 100)
                        .background(Color.blue)
                        .clipShape(.rect(cornerRadius: 15))
                }
                
            }
            .padding(.top, 30)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    TopView()
}
