//
//  DBError.swift
//  Messenger
//
//  Created by 영현 on 5/13/24.
//

import Foundation

enum DBError: Error {
    case error(Error)
    case emptyValue
    case invalidatedType
}
