//
//  MainTabView.swift
//  Messenger
//
//  Created by 영현 on 5/9/24.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @EnvironmentObject var container: DIContainer
    @State private var selectedTab: MainTabType = .home
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                ForEach(MainTabType.allCases, id: \.self) { tab in
                    Group {
                        switch tab {
                        case .home:
                            HomeView(viewModel: .init(container: container, userId: authViewModel.userId ?? ""))
                        case .chat:
                            ChatListView(viewModel: .init(container: container, userId: authViewModel.userId ?? ""))
                        case .phone:
                            Color.blackFix
                        }
                    }
                    .tabItem {
                        Label(tab.title, image: tab.imageName(selected: selectedTab == tab))
                    }
                    .tag(tab)
                }
            }
        }
        .tint(.bkText)
    }
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.bkText)
    }
}

#Preview {
//    static let container = DIContainer(services: StubService())
    MainTabView()
        .environmentObject(DIContainer(services: StubService()))
        .environmentObject(AuthenticationViewModel(container: DIContainer(services: StubService())))
}
