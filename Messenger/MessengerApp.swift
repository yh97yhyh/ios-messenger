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
    @StateObject var container: DIContainer = .init(services: Services())

    var body: some Scene {
        WindowGroup {
            AuthenticatedView(authViewModel: .init(container: container), navigationRouter: .init())
                .environmentObject(container)
        }
    }
}
