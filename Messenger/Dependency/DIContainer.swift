//
//  DIContainer.swift
//  Messenger
//
//  Created by 영현 on 5/9/24.
//

import Foundation

class DIContainer: ObservableObject {
    var services: ServiceType
    var searchDataController: DataControllerable
    var navigationRouter: NavigationRoutable & ObservableObjectSettable
    var appearanceController: AppearanceControllerable & ObservableObjectSettable
    
    init(services: ServiceType,
         searchDataController: DataControllerable = SearchDataController(),
         navigationRouter: NavigationRoutable & ObservableObjectSettable = NavigationRouter(),
         appearanceController: AppearanceControllerable & ObservableObjectSettable = AppearanceController()) {
        self.services = services
        self.searchDataController = searchDataController
        self.navigationRouter = navigationRouter
        self.appearanceController = appearanceController
        
        self.navigationRouter.setObjectWillChange(objectWillChange)
        self.appearanceController.setObjectWillChange(objectWillChange)
    }
}

extension DIContainer {
    static var stub: DIContainer {
        .init(services: StubService())
    }
}
