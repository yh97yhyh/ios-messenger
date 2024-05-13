//
//  MainTabView.swift
//  Messenger
//
//  Created by 영현 on 5/9/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: MainTabType = .home
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                ForEach(MainTabType.allCases, id: \.self) { tab in
                    Group {
                        switch tab {
                        case .home:
                            HomeView(viewModel: .init())
                        case .chat:
                            ChatListView()
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
    MainTabView()
}
