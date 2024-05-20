//
//  ChatViewModel.swift
//  Messenger
//
//  Created by 영현 on 5/20/24.
//

import Foundation
import Combine

class ChatViewModel: ObservableObject {
    
    enum Action {
        
    }
    
    @Published var chatDataList: [ChatData] = []
    @Published var myUser: User?
    @Published var otherUser: User?
    @Published var message: String = ""
    
    private let chatRoomId: String
    private let myUserId: String
    private let otherUserId: String
    
    private var container: DIContainer
    private var subscriptions = Set<AnyCancellable>()
    
    init(container: DIContainer, chatRoomId: String, myUserId: String, otherUserId: String) {
        self.container = container
        self.chatRoomId = chatRoomId
        self.myUserId = myUserId
        self.otherUserId = otherUserId
        
//        updateChataDataList(.init(chatId: "chat1_id", userId: "user1_id", message: "Hello", date: Date()))
//        updateChataDataList(.init(chatId: "chat2_id", userId: "user2_id", message: "World", date: Date()))
//        updateChataDataList(.init(chatId: "chat3_id", userId: "user1_id", message: "!!", date: Date()))

    }
    
    func updateChataDataList(_ chat: Chat) {
        let key = chat.date.toChatDateKey
        
        if let index = chatDataList.firstIndex(where: { $0.dateStr == key }) {
            chatDataList[index].chats.append(chat)
        } else {
            let newChatData: ChatData = .init(dateStr: key, chats: [chat])
            chatDataList.append(newChatData)
        }
    }
    
    func getDirection(id: String) -> ChatItemDirection {
        myUserId == id ? .right : .left
    }
    
    func send(action: Action) {
        
    }
}

/*
 
Chats/
    chatRoomId/
        chatId1/Chat
        chatId2/Chat
        chatId3/Chat
 

Chat: Date > 2024.05.19
Chat: Date > 2024.05.19
Chat: Date > 2024.05.20
같은 날짜의 Chat은 그룹화
 
 */
