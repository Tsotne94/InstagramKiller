//
//  UserModel.swift
//  InstsagramKiller
//
//  Created by Gio Kakaladze on 24.11.24.
//

import Foundation

struct UserResponse: Codable {
    let data: UserModel 
}

struct UserModel: Codable {
    let profilePicture: URL
    let username: String
    let fullName: String
    let description: String
    let counts: Counts
    let photos: [URL]
    let meta: Meta

    struct Counts: Codable {
        let posts: Int
        let followers: Int
        let following: Int
    }

    struct Meta: Codable {
        let code: Int
    }

    enum CodingKeys: String, CodingKey {
        case profilePicture = "profile_picture"
        case username
        case fullName = "full_name"
        case description
        case counts
        case photos
        case meta
    }
}
