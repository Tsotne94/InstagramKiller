//
//  PopularMediaModel.swift
//  InstsagramKiller
//
//  Created by Sandro Maraneli on 23.11.24.
//

import Foundation

// MARK: - Response Model
struct Response: Codable {
    let data: [Post]?
    let meta: Meta?
}

// MARK: - Post Model
struct Post: Codable {
    let attribution: String?
    let caption: Caption?
    let comments: Comments?
    let created_time: String?
    let filter: String?
    let id: String?
    let images: Images?
    let likes: Likes?
    let link: String?
    let location: Location?
    let tags: [String]?
    let type: PostType?
    let user: User?
    let user_has_liked: Bool?
    let users_in_photo: [UserInPhoto]?
    let videos: Videos?
}

// MARK: - Caption Model
struct Caption: Codable {
    let created_time: String?
    let from: User?
    let id: String?
    let text: String?
}

// MARK: - Comments Model
struct Comments: Codable {
    let count: Int?
    let data: [Comment]?
}

// MARK: - Comment Model
struct Comment: Codable {
    let created_time: String?
    let from: User?
    let id: String?
    let text: String?
}

// MARK: - Images Model
struct Images: Codable {
    let low_resolution: Resolution?
    let standard_resolution: Resolution?
    let thumbnail: Resolution?
}

// MARK: - Resolution Model
struct Resolution: Codable {
    let height: Int?
    let url: String?
    let width: Int?
}

// MARK: - Likes Model
struct Likes: Codable {
    let count: Int?
    let data: [User]?
}

// MARK: - Location Model
struct Location: Codable {
    let id: String?
    let latitude: Double?
    let longitude: Double?
    let name: String?
}

// MARK: - User Model
struct User: Codable {
    let full_name: String?
    let id: String?
    let profile_picture: String?
    let username: String?
}

// MARK: - UserInPhoto Model
struct UserInPhoto: Codable {
    let position: Position?
    let user: User?
}

// MARK: - Position Model
struct Position: Codable {
    let x: Double?
    let y: Double?
}

// MARK: - Videos Model
struct Videos: Codable {
    let low_resolution: Resolution?
    let standard_resolution: Resolution?
}

// MARK: - PostType Enum
enum PostType: String, Codable {
    case image
    case video
}

// MARK: - Meta Model
struct Meta: Codable {
    let code: Int?
}
