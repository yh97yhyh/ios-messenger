//
//  ObservableObjectSettable.swift
//  Messenger
//
//  Created by 영현 on 5/23/24.
//

import Foundation
import Combine

// Protocol Oriented Programming
protocol ObservableObjectSettable: AnyObject {
    var objectWillChange: ObservableObjectPublisher? { get set }
    
    func setObjectWillChange(_ objectWillChange: ObservableObjectPublisher)
}

extension ObservableObjectSettable {
    func setObjectWillChange(_ objectWillChange: ObservableObjectPublisher) {
        self.objectWillChange = objectWillChange
    }
}
