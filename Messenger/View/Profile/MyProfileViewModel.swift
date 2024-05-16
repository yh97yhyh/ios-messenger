//
//  MyProfileViewModel.swift
//  Messenger
//
//  Created by 영현 on 5/16/24.
//

import Foundation
import SwiftUI
import PhotosUI

@MainActor
class MyProfileViewModel: ObservableObject {
    
    @Published var userInfo: User?
    @Published var isPresentedDescEitView: Bool = false
    @Published var imageSelection: PhotosPickerItem? {
        didSet {
            Task {
                await updateProfileImage(pickerItem: imageSelection)
            }
        }
    }

    private var container: DIContainer
    
    private let userId: String
    
    init(container: DIContainer, userId: String) {
        self.container = container
        self.userId = userId
    }
    
    func getUser() async {
        if let user = try? await container.services.userService.getUser(userId: userId) {
            userInfo = user
        }
    }
    
    func updateDescription(_ description: String) async {
        do {
            try await container.services.userService.updateDescription(userId: userId, description: description)
            userInfo?.description = description
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func updateProfileImage(pickerItem: PhotosPickerItem?) async {
        guard let pickerItem else { return }
        
        do {
            let data = try await container.services.photoPickerService.loadTransferable(from: pickerItem)
            let url = try await container.services.uploadService.uploadImage(source: .profile(userId: userId), data: data) // storage upload
            try await container.services.userService.updateProfileURL(userId: userId, urlString: url.absoluteString) // realtime base update
            
            userInfo?.profileURL = url.absoluteString
        } catch {
            print(error.localizedDescription)
        }
    }
}
