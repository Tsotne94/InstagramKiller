//
//  NotificationsVM.swift
//  InstsagramKiller
//
//  Created by Sandro Tsitskishvili on 22.11.24.
//
import Foundation

class NotificationsVM {
    
    var likeNotifications: [LikeNotification] = []
    
    func fetchNotifications(completion: @escaping () -> Void) {
        guard let url = URL(string: "http://localhost:3000/v1/self/notifications") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self, let data = data, error == nil else { return }
            
            do {
                let rootResponse = try JSONDecoder().decode(RootResponse.self, from: data)
                
                self.likeNotifications = [
                    LikeNotification(
                        section: "New",
                        notifications: self.transformJSONItems(rootResponse.data.new)
                    ),
                    LikeNotification(
                        section: "Today",
                        notifications: self.transformJSONItems(rootResponse.data.today)
                    ),
                    LikeNotification(
                        section: "This Week",
                        notifications: self.transformJSONItems(rootResponse.data.this_week)
                    ),
                    LikeNotification(
                        section: "This Month",
                        notifications: self.transformJSONItems(rootResponse.data.this_month)
                    )
                ]
                DispatchQueue.main.async {
                    completion()
                }
                
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        task.resume()
    }
}
