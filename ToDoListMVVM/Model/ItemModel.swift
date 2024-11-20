//
//  ItemModel.swift
//  ToDoListMVVMProject
//
//  Created by Dip Dutt on 2/4/24.
//

import Foundation

struct ItemModel:Identifiable,Codable {
    var id:String = UUID().uuidString
    let title:String
    let isCompleted:Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
            self.id = id
            self.title = title
            self.isCompleted = isCompleted
        }
        
        func updateCompletion() -> ItemModel {
            return ItemModel(id: id, title: title, isCompleted: !isCompleted)
        }
}
