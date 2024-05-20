//
//  ChatData.swift
//  Messenger
//
//  Created by 영현 on 5/20/24.
//

import Foundation

struct ChatData: Hashable, Identifiable {
    var dateStr: String
    var chats: [Chat]
    var id: String { dateStr } 
}
