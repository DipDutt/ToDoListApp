//
//  TopView.swift
//  ToDoListMVVM
//
//  Created by Dip Dutt on 18/11/24.
//

import SwiftUI

struct TopView: View {
    // MARK: - Properties
    
    @State var isAnimated: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: - main body
    var body: some View {
        NavigationStack {
            VStack(spacing: 5) {
                Text("There Is No Items Here")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(colorScheme == .light ? Color.blue: Color.orange)
                Text("To add 🧾 on the list you can add Tap Here button ⏹️")
                    .lineLimit(2)
                    .padding()
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundStyle(colorScheme == .light ? Color.green.gradient : Color.teal.gradient)
                    .multilineTextAlignment(.center)
                  
                
                NavigationLink {
                    AdditemView()
                } label: {
                    Label("Tap Here", systemImage: "hand.tap")
                        .foregroundStyle(Color.white)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(isAnimated ? Color.green : Color.red)
                        .clipShape(.rect(cornerRadius: 10))
                }
                .padding(.horizontal, 40)
                .offset(y:isAnimated ? 10.0 : 0)
                .shadow(color: Color("RadiusColor"), radius: 5, x: 5.0, y: isAnimated ? 10 : 0)
                
            }
            .padding(.top, 30)
            .frame(width: 450)
            .frame( maxHeight: .infinity, alignment: .top)
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
