//
//  ToDoListMVVMApp.swift
//  ToDoListMVVM
//
//  Created by Dip Dutt on 5/4/24.
//

import SwiftUI

@main
struct ToDoListMVVMApp: App {
  @StateObject var listViewModel = ItemsViewModel()
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(listViewModel)
        }
    }
}
