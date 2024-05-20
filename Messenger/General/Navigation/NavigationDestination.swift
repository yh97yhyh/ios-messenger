//
//  NavigationDestination.swift
//  Messenger
//
//  Created by 영현 on 5/17/24.
//

import Foundation

enum NavigationDestination: Hashable {
    case chat(chatRoomId: String, myUserId: String, otherUserId: String)
    case search
}
