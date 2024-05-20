//
//  Chat.swift
//  Messenger
//
//  Created by 영현 on 5/20/24.
//

import Foundation

struct Chat: Hashable, Identifiable {
    var chatId: String
    var userId: String
    var message: String?
    var photoURL: String?
    var date: Date
    var id: String { chatId }
}
