//
//  ItemModel.swift
//  ToDoListMVVMProject
//
//  Created by Dip Dutt on 2/4/24.
//

import Foundation

struct ItemModel:Identifiable {
    let id:String = UUID().uuidString
    let title:String
    let isCompleted:Bool
}
