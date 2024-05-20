//
//  ChatListView.swift
//  Messenger
//
//  Created by 영현 on 5/13/24.
//

import SwiftUI

struct ChatListView: View {
    @EnvironmentObject var navigationRouter: NavigationRouter
    @StateObject var viewModel: ChatListViewModel
    
    var body: some View {
        NavigationStack(path: $navigationRouter.destinations) {
            ScrollView {
                NavigationLink(value: NavigationDestination.search) {
                    SearchButton()
                }
                .padding(.top, 24)
                .padding(.bottom, 14)
                
                ForEach(viewModel.chatRooms, id: \.self) { chatRoom in
                    ChatroomCell(chatRoom: chatRoom, userId: viewModel.userId)
                }
                
            }
            .navigationTitle("대화")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: NavigationDestination.self) {
                NavigationRoutingView(destination: $0)
            }
            .onAppear {
                viewModel.send(action: .load)
            }
        }
    }
}

fileprivate struct ChatroomCell: View {
    let chatRoom: ChatRoom
    let userId: String
    
    var body: some View {
        NavigationLink(value: NavigationDestination.chat(chatRoomId: chatRoom.chatRoomId, myUserId: userId, otherUserId: chatRoom.otherUserId)) {
            HStack(spacing: 8) {
                Image("person")
                    .resizable()
                    .frame(width: 40, height: 40)
                VStack(alignment: .leading, spacing: 3) {
                    Text(chatRoom.otherUserName)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.bkText)
                    if let lastMessage = chatRoom.lastMessage {
                        Text(lastMessage)
                            .font(.system(size: 12))
                            .foregroundColor(.greyDeep)
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 17)
        }
    }
}

#Preview {
    ChatListView(viewModel: .init(container: DIContainer(services: StubService()), userId: "user1_id"))
        .environmentObject(NavigationRouter())
}
