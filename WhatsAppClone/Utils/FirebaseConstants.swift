//
//  FirebaseConstants.swift
//  WhatsAppClone
//
//  Created by Vlad on 23/7/24.
//

import Foundation
import Firebase
import FirebaseStorage

enum FirebaseConstants {
    private static let DatabaseRef = Database.database().reference()
    static let UserRef = DatabaseRef.child("users")
}
