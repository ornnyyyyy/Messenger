//
//  DatabaseManager.swift
//  Messenger
//
//  Created by orn on 25/6/2564 BE.
//

import Foundation
import FirebaseDatabase

// final -> this class cannot be subclasses
// we wanna class to be a singleton
final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    public func test() {
        database.child("foo").setValue(["something": true])
    }
}

// MARK: - Account Management

extension DatabaseManager {
    
    // completion: @escaping it's return to us a Boolean based on if that the validation passed
    // so this will return true if the user email doesn't exist and false if it does exist
    public func userExists(with email: String, completion: @escaping ((Bool) -> Void)) {
        
        database.child(email).observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.value as? String != nil else {
                completion(false)
                return
            }
            completion(true)
        })
    }
    
    /// insert new user to datatbase
    public func insertUser(with user: ChatAppUser) {
        database.child(user.emailAddress).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName
        ])
    }
}

struct ChatAppUser {
    let firstName: String
    let lastName: String
    let emailAddress: String
//    let profilePictureUrl: String

}
