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
                    NotificationItem(profileImage: "profile1", username:"karen", action: "liked your photo.", timestamp: "1h", postImage: "post1")
                ]),
                LikeNotification(section: "Today", notifications: [
                    NotificationItem(profileImage: "profile2", username: "kiero_d, zackjohn and 26 others", action: "liked your photo.", timestamp: "3h", postImage: "post2")
                ]),
                LikeNotification(section: "This Week", notifications: [
                    NotificationItem(profileImage: "profile3", username: "craig_love", action: "mentioned you in a comment: @jacob_w exactly..", timestamp: "2d", postImage: nil)
                ]),
                LikeNotification(section: "This Month", notifications: [
                    NotificationItem(profileImage: "profile4", username: "martini_rond", action: "started following you.", timestamp: "3d", postImage: nil),
                    NotificationItem(profileImage: "profile5", username: "maxjacobson",action: "started following you.", timestamp: "3d", postImage: nil),
                    NotificationItem(profileImage: "profile6", username: "m_humphrey", action: "started following you.", timestamp: "3d", postImage: nil)
                ])
            ]
        }
    }
