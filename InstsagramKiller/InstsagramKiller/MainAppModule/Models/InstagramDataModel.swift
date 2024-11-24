//
//  PopularMediaModel.swift
//  InstsagramKiller
//
//  Created by Sandro Maraneli on 23.11.24.
//

import Foundation

struct Response: Codable {
    let data: [Post]?
    let meta: Meta?
    let pagination: Pagination?
}

struct Post: Codable {
    let id: String?
    let caption: Caption?
    let location: PostLocation
    let likes: Likes?
    let images: Images?
    let user: User?
    let comments: CommentsResponse
    let created_time: String?
}

struct Caption: Codable {
    let text: String?
}

struct Likes: Codable {
    let count: Int?
    let data: [User]
}

struct Images: Codable {
    let standard_resolution: Resolution?
    let low_resolution: Resolution?
    let thumbnail: Resolution?
    
    var imageURLs: [String?] {
        return [
            low_resolution?.url,
            standard_resolution?.url,
            thumbnail?.url
        ]
    }
}

struct Resolution: Codable {
    let url: String?
}

struct Pagination: Codable {
    let next_max_id: String?
    let next_url: String?
}

struct User: Codable {
    let profile_picture: String?
    let username: String?
    let full_name: String?
    let description: String?
    let counts: Counts?
    let photos: [String]?
}

struct Counts: Codable {
    let posts: Int?
    let followers: Int?
    let following: Int?
}

struct CategorizedResponse: Codable {
    let data: CategorizedData?
    let meta: Meta?
}

struct CategorizedData: Codable {
    let new: [CategorizedPost]?
    let today: [CategorizedPost]?
    let this_week: [CategorizedPost]?
    let this_month: [CategorizedPost]?
}

struct CategorizedPost: Codable {
    let action: String?
    let profile_picture: String?
    let usernames: [String]?
    let time_ago: String?
}

struct UserInfoResponse: Codable {
    let data: UserInfo?
    let meta: Meta?
}

struct UserInfo: Codable {
    let profile_picture: String?
    let username: String?
    let full_name: String?
    let description: String?
    let counts: Counts?
    let photos: [String]?
}

struct Meta: Codable {
    let code: Int?
}

struct PostLocation: Codable {
    let name: String
}


struct CommentsResponse: Codable {
    let count: Int
    let data: [Comment]
}
struct Comment: Codable {
    var createdTime: String
    var from: User
    var id: String
    var text: String

    enum CodingKeys: String, CodingKey {
        case createdTime = "created_time"
        case from
        case id
        case text
    }
}
