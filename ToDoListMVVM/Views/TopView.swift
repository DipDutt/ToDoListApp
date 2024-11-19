//
//  TopView.swift
//  ToDoListMVVM
//
//  Created by Dip Dutt on 18/11/24.
//

import SwiftUI

struct TopView: View {
    @State var isAnimated: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: - main body
    var body: some View {
        NavigationStack {
            VStack(spacing: 5) {
                Text("There Is No Items Here")
                    .font(.title)
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
                        .frame(maxWidth: .infinity)
                        .background(isAnimated ? Color.red:Color.blue)
                        .clipShape(.rect(cornerRadius: 10))
                }
                .padding(.horizontal, 40)
                .offset(y:isAnimated ? 10.0 : 0)
                .shadow(color: .black.opacity(0.6), radius: 5, x: 0.0, y: isAnimated ? 10 : 0)
                
            }
            .padding(.top, 30)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .onAppear(perform: {
                startAnimation()
            })
        }
    }
}

#Preview {
    TopView()
}

// MARK: - TopView Extension
extension TopView {
    func startAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 2.0) .repeatForever()) {
                isAnimated.toggle()
            }
        }
        
    }
}
