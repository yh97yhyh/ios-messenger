//
//  AppearanceController.swift
//  Messenger
//
//  Created by 영현 on 5/22/24.
//

import Foundation
import Combine

protocol AppearanceControllerable {
    var appearance: AppearanceType { get set }
    
    func changeAppearance(_ willBeAppearance: AppearanceType?)
}

class AppearanceController: AppearanceControllerable, ObservableObjectSettable {
    
    var objectWillChange: ObservableObjectPublisher?
    
    var appearance: AppearanceType = .automatic {
        didSet {
            objectWillChange?.send()
        }
    }
    
//    init(_ appearanceValue: Int) {
//        self.appearance = AppearanceType(rawValue: appearanceValue) ?? .automatic
//    }
    
    func changeAppearance(_ willBeAppearance: AppearanceType?) {
        appearance = willBeAppearance ?? .automatic
    }
}
