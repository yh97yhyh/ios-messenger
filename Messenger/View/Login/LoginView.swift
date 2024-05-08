//
//  LoginView.swift
//  Messenger
//
//  Created by 영현 on 5/9/24.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("로그인")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.bkText)
                    .padding(.top, 80)
                
                Text("아래 제공되는 서비스로 로그인을 해주세요.")
                    .font(.system(size: 14))
                    .foregroundColor(.greyDeep)
            }
            .padding(.horizontal, 30)
            
            Spacer()
            
            Button {
                authViewModel.send(action: .googleLogin)
            } label: {
                Text("Google로 로그인")
            }.buttonStyle(LoginButtonStyle(textColor: .bkText, borderColor: .greyLight))
            
            SignInWithAppleButton { request in
                // 유료..
            } onCompletion: { result in
                // TODO: -
            }
            .frame(height: 40)
            .padding(.horizontal, 15)
            .cornerRadius(5)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image("back")
                }
            }
        }
        .overlay {
            if authViewModel.isLoading {
                ProgressView()
            }
        }
    }
}

#Preview {
    LoginView()
//        .environmentObject(AuthenticationViewModel(container: DIContainer(services: StubService as> ServiceType)))
}
