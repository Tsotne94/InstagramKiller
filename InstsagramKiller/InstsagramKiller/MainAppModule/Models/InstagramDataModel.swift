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
    let likes: Likes?
    let images: Images?
    let user: User?
}

struct Caption: Codable {
    let text: String?
}

struct Likes: Codable {
    let count: Int?
}

struct Images: Codable {
    let standard_resolution: Resolution?
}

struct Resolution: Codable {
    let url: String?
}

struct Pagination: Codable {
    let next_max_id: String?
    let next_url: String?
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

struct Meta: Codable {
    let code: Int?
}
