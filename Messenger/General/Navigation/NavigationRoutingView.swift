//
//  NavigationRoutingView.swift
//  Messenger
//
//  Created by 영현 on 5/17/24.
//

import SwiftUI

struct NavigationRoutingView: View {
    @State var destination: NavigationDestination
    
    var body: some View {
        switch destination {
        case .chat:
            ChatView()
        case .search:
            SearchView()
        }
    }
}

//#Preview {
//    NavigationRoutingView(destination: .chat)
//}
