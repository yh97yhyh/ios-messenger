//
//  HomeViewModel.swift
//  Messenger
//
//  Created by 영현 on 5/13/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var myUser: User?
    @Published var users: [User] = [.stub1, .stub2]
}
