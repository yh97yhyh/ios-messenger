//
//  AppearanceController.swift
//  Messenger
//
//  Created by 영현 on 5/22/24.
//

import Foundation

class AppearanceController: ObservableObject {
    
    @Published var appearance: AppearanceType
    
    init(_ appearanceValue: Int) {
        self.appearance = AppearanceType(rawValue: appearanceValue) ?? .automatic
    }
    
    func changeAppearance(_ willBeAppearance: AppearanceType) {
        appearance = willBeAppearance
    }
}
