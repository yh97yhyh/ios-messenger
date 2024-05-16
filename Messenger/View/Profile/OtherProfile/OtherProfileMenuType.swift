//
//  OtherProfileMenuType.swift
//  Messenger
//
//  Created by 영현 on 5/17/24.
//

import Foundation

enum OtherProfileMenuType: Hashable, CaseIterable {
    case chat
    case phoneCall
    case videoCall
    
    var description: String {
        switch self {
        case .chat:
            return "대화"
        case .phoneCall:
            return "음성통화"
        case .videoCall:
            return "영상통화"
        }
    }
    
    var imageName: String {
        switch self {
        case .chat:
            return "sms"
        case .phoneCall:
            return "phone_profile"
        case .videoCall:
            return "videocam"
        }
    }
}

