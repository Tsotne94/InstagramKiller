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

struct Meta: Codable {
    let code: Int?
}
