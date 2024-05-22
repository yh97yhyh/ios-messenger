//
//  HomeModelDestination.swift
//  Messenger
//
//  Created by 영현 on 5/14/24.
//

import Foundation

enum HomeModelDestination: Hashable, Identifiable {
    case myProfile
    case otherProfile(String)
    case setting
    
    var id: Int {
        hashValue
    }
}
