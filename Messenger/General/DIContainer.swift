//
//  DIContainer.swift
//  Messenger
//
//  Created by 영현 on 5/9/24.
//

import Foundation

class DIContainer: ObservableObject {
    var services: ServiceType
    
    init(services: ServiceType) {
        self.services = services
    }
}
