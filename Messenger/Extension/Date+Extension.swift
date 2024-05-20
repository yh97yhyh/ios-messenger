//
//  Date+Extension.swift
//  Messenger
//
//  Created by 영현 on 5/20/24.
//

import Foundation

extension Date {
    
    var toChatTime: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "a h:mm"
        return formatter.string(from: self)
    }
    
    var toChatDateKey: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy.MM.dd E"
        return formatter.string(from: self)
    }
}
