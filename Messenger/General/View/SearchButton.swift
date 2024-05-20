//
//  SearchButton.swift
//  Messenger
//
//  Created by 영현 on 5/17/24.
//

import SwiftUI

struct SearchButton: View {
    var body: some View {
//        NavigationLink(value: NavigationDestination.search) {
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 36)
                    .background(Color.greyCool)
                    .cornerRadius(5)
                
                HStack {
                    Text("검색")
                        .font(.system(size: 12))
                        .foregroundColor(.greyLightVer2)
                    
                    Spacer()
                }
                .padding(.leading, 22)
            }
            .padding(.horizontal, 22)
//        } 
    }
}

#Preview {
    SearchButton()
}
