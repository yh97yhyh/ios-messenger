//
//  SettingViewModel.swift
//  Messenger
//
//  Created by 영현 on 5/22/24.
//

import Foundation

class SettingViewModel: ObservableObject {
    
//    enum Action {
//        case changeAppearance(AppearanceType)
//    }
    
    @Published var sectionItems: [SectionItem] = []
//    @Published var appearance: AppearanceType = .automatic

    init() {
        self.sectionItems = [
            .init(label: "모드설정", settings: AppearanceType.allCases.map { .init(item: $0) })
        ]
    }
    
//    func send(action: Action) {
//        switch action {
//        case let .changeAppearance(willBeAppearance):
//            appearance = willBeAppearance
//        }
//    }
}

