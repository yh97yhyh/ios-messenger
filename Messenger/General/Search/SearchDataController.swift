//
//  SearchDataController.swift
//  Messenger
//
//  Created by 영현 on 5/22/24.
//

import Foundation
import CoreData

protocol DataControllerable {
    var persistantContainer: NSPersistentContainer { get set }
}

class SearchDataController: DataControllerable {
    
    var persistantContainer = NSPersistentContainer(name: "Search")
    
    init() {
        persistantContainer.loadPersistentStores { description, error in
            if let error {
                print("Core data failed: ", error)
            }
        }
    }
}
