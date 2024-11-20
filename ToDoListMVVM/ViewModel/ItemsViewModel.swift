//
//  ItemsViewModel.swift
//  ToDoListMVVMProject
//
//  Created by Dip Dutt on 3/4/24.
//

import Foundation

class ItemsViewModel:ObservableObject {
    // MARK: - Properties
    @Published var items:[ItemModel] = [] {
        didSet {
            saveItemsInUserDefault()
        }
    }
    let itemKey:String = "item_key"
    
    // MARK: - Initilization()
    init() {
        getItems()
    }
    
    // MARK: - Create Fuction to getItems to decode items and get data from user defaults.
    func getItems() {
        
        guard let data = UserDefaults.standard.data(forKey: itemKey),
              let saveData = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {
            return
        }
        self.items.append(contentsOf:saveData)
        
    }
    
    // MARK: - Create Fuction to additems form the additemView
    func addItems(item: String) {
        let newItem = ItemModel(title: item, isCompleted: false)
        items.append(newItem)
    }
    
    // MARK: - Create Fuction to moveItems
    func moveItems(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
    
    // MARK: - Create Fuction to deleteItems
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    // MARK: - Create Fuction toupdateItmes
    func updateItems() {
        
    }
    
    // MARK: - Create Fuction saveItemsInUserDefaults
    func saveItemsInUserDefault() {
        if let jsonEncoder = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(jsonEncoder, forKeyPath: itemKey)
        }
    }
}
