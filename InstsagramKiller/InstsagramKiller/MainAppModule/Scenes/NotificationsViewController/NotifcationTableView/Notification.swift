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

struct NotificationItem {
    let profileImage: String
    let username: String
    let action: String
    let timestamp: String
    let postImage: String?
}
