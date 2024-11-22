//
//  NotificationsVM.swift
//  InstsagramKiller
//
//  Created by Sandro Tsitskishvili on 22.11.24.
//

class NotificationsVM {

        var likeNotifications: [LikeNotification] = []

        func fetchNotifications() {
            likeNotifications = [
                LikeNotification(section: "New", notifications: [
                    NotificationItem(profileImage: "profile1", message: "karen liked your photo.", timestamp: "1h", postImage: "post1")
                ]),
                LikeNotification(section: "Today", notifications: [
                    NotificationItem(profileImage: "profile2", message: "kiero_d, zackjohn and 26 others liked your photo.", timestamp: "3h", postImage: "post2")
                ]),
                LikeNotification(section: "This Week", notifications: [
                    NotificationItem(profileImage: "profile3", message: "craig_love mentioned you in a comment: @jacob_w exactly..", timestamp: "2d", postImage: nil)
                ]),
                LikeNotification(section: "This Month", notifications: [
                    NotificationItem(profileImage: "profile4", message: "martini_rond started following you.", timestamp: "3d", postImage: nil),
                    NotificationItem(profileImage: "profile5", message: "maxjacobson started following you.", timestamp: "3d", postImage: nil),
                    NotificationItem(profileImage: "profile6", message: "m_humphrey started following you.", timestamp: "3d", postImage: nil)
                ])
            ]
        }
    }
