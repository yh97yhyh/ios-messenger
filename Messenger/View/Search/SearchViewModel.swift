//
//  SearchViewModel.swift
//  Messenger
//
//  Created by 영현 on 5/20/24.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    
    enum Action {
        case requestQuery(String)
        case clearSearchResult
        case clearSearchText
    }
    
    @Published var shouldBecomeFirstResponder: Bool = false
    @Published var searchResults: [User] = []
    @Published var searchText: String = ""
    
    private let userId: String
    private let container: DIContainer
    private var subscriptions = Set<AnyCancellable>()
    
    init(container: DIContainer, userId: String) {
        self.container = container
        self.userId = userId
        
        bind()
    }
    
    func bind() {
        $searchText
            .debounce(for: .seconds(0.2), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] text in
                if text.isEmpty {
                    self?.send(action: .clearSearchResult )
                } else {
                    self?.send(action: .requestQuery(text))

                }
            }.store(in: &subscriptions)
    }
    
    func send(action: Action) {
        switch action {
        case let .requestQuery(query):
            container.services.userService.filterUsers(with: query, userId: userId)
                .sink { completion in
                    
                } receiveValue: { [weak self] users in
                    self?.searchResults = users
                }.store(in: &subscriptions)
            
        case .clearSearchResult:
            searchResults = []
            
        case .clearSearchText:
            searchText = ""
            shouldBecomeFirstResponder = false
            searchResults = []
        }
        
    }
}
