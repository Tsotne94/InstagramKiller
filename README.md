# InstagramKiller

InstagramKiller is an Instagram-like app built using **UIKit**. It replicates key features of Instagram, such as viewing posts, liking photos, sharing images, searching for users, and editing profiles. The app also includes a notifications system and a discover page.
 
## Features
 
- **Feed**: Displays posts with captions, images, likes, and comments.
- **Search**: Users can search for other users or posts.
- **Profile**: View and edit user profiles.
- **Notifications**: Displays like and comment notifications categorized by time (New, Today, This Week, This Month).
- **Discover Page**: Allows users to explore content and users via a search bar and collection view.
 
## Technology Stack
 
- **UIKit**: The app is built entirely using UIKit for the user interface.
- **Mockoon**: Mock API for fetching posts, images, and notifications.
 
## How it Works
 
- The app interacts with a local **Mockoon** API to fetch posts, user data, and notifications.
- **Posts**: Includes user details (profile picture, username, caption, likes, comments).
- **User Profiles**: Displays user information such as name, description, and stats (followers, following).
- **Notifications**: Organized into categories like "New", "Today", "This Week", "This Month".
- **Data Fetching**: Posts and notifications are fetched asynchronously and displayed in UITableViews or UICollectionViews.
 
## UI Components
 
- **HomePage**: Displays posts in a table view with dynamic content.
- **DiscoverPage**: Allows users to search for content and users, with results displayed in a collection view.
- **NotificationsPage**: Displays categorized notifications using a table view with custom headers.
- **Profile Page**: Users can view and edit their profile information.
 
## UI Tests
 
Key tests are included to validate app functionality:
 
1. **Test Picture Swipe on Post**: Validates image swiping in posts.
2. **Test Share Button**: Verifies the share button functionality.
3. **Test Search Bar**: Confirms the search bar is accessible on the discover tab.
4. **Test Notifications Tab**: Ensures the notifications tab works as expected.
5. **Test Profile Tab**: Checks if followers, following, and posts are correctly displayed.
 
## Running the App
 
To run the app locally and fetch images, follow these steps:
 
1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/InstagramKiller.git
    ```
 
2. Install **Mockoon** and run the mock API locally:
    - Download Mockoon from [Mockoon official site](https://mockoon.com).
    - Configure the mock API to return image data for the app.
    - Make sure Mockoon is running on your machine before launching the app.
 
3. Open the project in Xcode and run the app:
    - Open the `.xcodeproj` file.
    - Build and run the app on the simulator or device.
 
## Creators
 
This project was built by the following team members:
 
- **Tsotne Chubinidze**: Lead Developer
- **Sandro Maraneli**: Senior Developer
- **Nia Khorbaladze**: Senior Developer
- **Beka Labadze**: Senior Developer
- **Sandro Tsitskshvili**: Junior Developer
-** Giorgi Kakaladze**: SeniorDeveloper
 
## License
 
This project is licensed under the Tsotne License 
