//
//  NavigationRouter.swift
//  Messenger
//
//  Created by 영현 on 5/17/24.
//

import Foundation
import Combine

protocol NavigationRoutable {
    var destinations: [NavigationDestination] { get set }
    
    func push(to view: NavigationDestination)
    func pop()
    func popToRootView()
    func setObjectWillChange(_ objectWillChange: ObservableObjectPublisher?)
}

class NavigationRouter: NavigationRoutable {
    
    var objectWillChange: ObservableObjectPublisher?
    
    var destinations: [NavigationDestination] = [] {
        didSet {
            objectWillChange?.send()
        }
    }
    
    func push(to view: NavigationDestination) {
        destinations.append(view)
    }
    
    func pop() {
        _ = destinations.popLast()
    }
    
    func popToRootView() {
        destinations = []
    }
    
    func setObjectWillChange(_ objectWillChange: ObservableObjectPublisher?) {
        self.objectWillChange = objectWillChange
    }
}
