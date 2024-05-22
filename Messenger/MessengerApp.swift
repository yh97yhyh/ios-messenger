//
//  MessengerApp.swift
//  Messenger
//
//  Created by 영현 on 5/9/24.
//

import SwiftUI

@main
struct MessengerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @AppStorage(AppStorageType.Appearance) var appearanceValue: Int = UserDefaults.standard.integer(forKey: AppStorageType.Appearance)
    @StateObject var container: DIContainer = .init(services: Services())

    var body: some Scene {
        WindowGroup {
            AuthenticatedView(authViewModel: .init(container: container), navigationRouter: .init(), searchDataController: .init(), appearanceController: .init(appearanceValue))
                .environmentObject(container)
        }
    }
}
