//
//  Services.swift
//  Messenger
//
//  Created by 영현 on 5/9/24.
//

import Foundation

protocol ServiceType {
    var authService: AuthenticationServiceType { get set }
    var userService: UserServiceType { get set }
    var contactService: ContactServiceType { get set }
}

class Services: ServiceType {
    
    var authService: AuthenticationServiceType
    var userService: UserServiceType
    var contactService: any ContactServiceType
    
    init() {
        self.authService = AuthenticationService() 
        self.userService = UserService(dbRepository: UserDBRepository())
        self.contactService = ContactService()
    }
}

class StubService: ServiceType {
    var authService: AuthenticationServiceType = StubAuthenticationService()
    var userService: UserServiceType = StubUserService()
    var contactService: ContactServiceType = StubContactService()
}
