//
//  AuthenticatedView.swift
//  Messenger
//
//  Created by 영현 on 5/9/24.
//

import SwiftUI

struct AuthenticatedView: View {
    @EnvironmentObject var container: DIContainer
    @StateObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        VStack {
            switch authViewModel.authenticationState {
            case .unauthenticated:
                LoginIntroView()
                    .environmentObject(authViewModel)
            case .authenticated:
                MainTabView()
                    .environment(\.managedObjectContext, container.searchDataController.persistantContainer.viewContext) // CoreData
                    .environmentObject(authViewModel)
//                    .environmentObject(appearanceController)
            }
        }
        .onAppear {
            authViewModel.send(action: .checkAuthenticationState)
//            authViewModel.send(action: .logout)
        }
        .preferredColorScheme(container.appearanceController.appearance.colorScheme)
    }
}

#Preview {
    AuthenticatedView(authViewModel: .init(container: .init(services: StubService())))
}
