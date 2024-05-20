//
//  NavigationRoutingView.swift
//  Messenger
//
//  Created by 영현 on 5/17/24.
//

import SwiftUI

struct NavigationRoutingView: View {
    @EnvironmentObject var container: DIContainer
    @State var destination: NavigationDestination
    
    var body: some View {
        switch destination {
        case let .chat(chatRoomId, myUserId, otherUserId):
            ChatView(viewModel: .init(container: container, chatRoomId: chatRoomId, myUserId: myUserId, otherUserId: otherUserId))
        case .search:
            SearchView()
        }
    }
}

//#Preview {
//    NavigationRoutingView(destination: .chat)
//}
