//
//  Constant.swift
//  Messenger
//
//  Created by 영현 on 5/14/24.
//

import Foundation

typealias DBKey = Constant.DBKey

enum Constant { }

extension Constant {
    struct DBKey {
        static let Users = "Users"
        static let ChatRooms = "ChatRooms"
        static let Chats = "Chats"

    }
}
