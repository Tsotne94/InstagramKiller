//
//  Notification.swift
//  InstsagramKiller
//
//  Created by Sandro Tsitskishvili on 22.11.24.
//

struct LikeNotification {
    let section: String
    let notifications: [NotificationItem]
}

struct NotificationItem: Codable{
    let profileImage: String
    let username: String
    let action: String
    let timestamp: String
    let postImage: String?
}

struct RootResponse: Codable {
    let data: NotificationSections
}

struct NotificationJSONItem: Codable {
    let action: String
    let profile_picture: String
    let usernames: [String]
    let time_ago: String
}

struct NotificationSections: Codable {
    let new: [NotificationJSONItem]
    let today: [NotificationJSONItem]
    let this_week: [NotificationJSONItem]
    let this_month: [NotificationJSONItem]
}
