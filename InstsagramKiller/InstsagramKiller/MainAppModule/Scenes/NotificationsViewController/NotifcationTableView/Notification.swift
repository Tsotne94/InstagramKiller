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
    let message: String
    let timestamp: String
    let postImage: String?
}
