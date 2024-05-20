//
//  ChatView.swift
//  Messenger
//
//  Created by 영현 on 5/17/24.
//

import SwiftUI
import PhotosUI

struct ChatView: View {
    @EnvironmentObject var navigationRouter: NavigationRouter
    @StateObject var viewModel: ChatViewModel
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                if viewModel.chatDataList.isEmpty {
                    Color.chatBg
                } else {
                    contentView
                }
            }
            .onChange(of: viewModel.chatDataList.last?.chats) { newValue in
                proxy.scrollTo(newValue?.last?.id, anchor: .bottom)
            }
        }
        .background(Color.chatBg)
        .navigationBarBackButtonHidden()
        .toolbar(.hidden, for: .tabBar)
        .toolbarBackground(Color.chatBg, for: .navigationBar)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button {
                    navigationRouter.pop()
                } label: {
                    Image("back")
                }
                
                Text(viewModel.otherUser?.name ?? "대화방이름")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.bkText)
            }
            
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Image("search_chat")
                Image("bookmark")
                Image("settings")
            }
        }
        .keyboardToolbar(height: 50) {
            HStack(spacing: 13) {
                Button {
                    
                } label: {
                    Image("other_add")
                }
                
                PhotosPicker(selection: $viewModel.imageSelection,
                             matching: .images) {
                    Image("image_add")
                }
                
//                Button {
//                    
//                } label: {
//                    Image("image_add")
//                }
                
                Button {
                    
                } label: {
                    Image("photo_camera")
                }
                
                TextField("", text: $viewModel.message)
                    .font(.system(size: 16))
                    .foregroundColor(.bkText)
                    .focused($isFocused)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 13)
                    .background(Color.greyCool)
                    .cornerRadius(20)
                
                Button {
                    viewModel.send(action: .addChat(viewModel.message))
                    isFocused = false
                } label: {
                    Image("send")
                }
                .disabled(viewModel.message.isEmpty)
            }
            .padding(.horizontal, 27)
        }
        .onAppear {
            viewModel.send(action: .load)
        }
    }
    
    var contentView: some View {
        ForEach(viewModel.chatDataList) { ChatData in
            Section {
                ForEach(ChatData.chats) { chat in
                    if let message = chat.message {
                        ChatItemView(message: message,
                                     direction: viewModel.getDirection(id: chat.userId),
                                     date: chat.date)
                        .id(chat.chatId)
                    } else if let photoURL = chat.photoURL {
                        ChatImageItemView(urlString: photoURL, direction: viewModel.getDirection(id: chat.userId))
                            .id(chat.chatId)

                    }
                    
                }
            } header: {
                headerView(dateStr: ChatData.dateStr)
            }
        }
    }
    
    func headerView(dateStr: String) -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 76, height:  20)
                .background(Color.chatNotice)
                .cornerRadius(50)
            Text(dateStr)
                .font(.system(size: 10))
                .foregroundColor(.bgWh)
        }
        .padding(.top)
    }
}

#Preview {
    NavigationStack {
        ChatView(viewModel: .init(container: DIContainer(services: StubService()), chatRoomId: "chatRoom1_id", myUserId: "user1_id", otherUserId: "user2_id"))
    }
}
