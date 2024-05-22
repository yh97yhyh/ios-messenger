//
//  SearchDataController.swift
//  Messenger
//
//  Created by 영현 on 5/22/24.
//

import Foundation
import CoreData

class SearchDataController: ObservableObject {
    
    let persistantContainer = NSPersistentContainer(name: "Search")
    
    init() {
        persistantContainer.loadPersistentStores { description, error in
            if let error {
                print("Core data failed: ", error)
            }
        }
    }
}
