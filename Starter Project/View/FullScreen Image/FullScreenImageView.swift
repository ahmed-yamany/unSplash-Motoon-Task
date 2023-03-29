//
//  FullScreenImageView.swift
//  Starter Project
//
//  Created by Ahmed Yamany on 27/03/2023.
//

import SwiftUI
import Combine

struct FullScreenImageView: View {
    let unSplashImage: UnSplashImage
    
    @State var image: UIImage = UIImage()
    
    @State var cancelableSet: Set<AnyCancellable> = []

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20.0) {
               Image(uiImage: image)
                    .resizable()
                    .frame(height: 400)
                    .cornerRadius(20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    VStack {
                        Divider()
                        HStack(alignment: .center, spacing: 10) {
      
                            InformationView(caption: "Likes",
                                            title: "\(unSplashImage.likes)")
                            InformationView(caption: "Username",
                                            title: unSplashImage.user.username)
                            InformationView(caption: "location",
                                            title: "\(unSplashImage.user.location ?? "None")",
                                            hasLeftDivider: false)
                            
                        }
                        .frame(height: 80)
                        Divider()
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom)
                
                
                Spacer()
                    
            }
            .padding(.horizontal)
            .onAppear {
                ImageDownloader.download(url: unSplashImage.urls.regular)
                    .sink { error in

                    } receiveValue: { image in
                        self.image = image
                        
                    }
                    .store(in: &cancelableSet)

            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct InformationView: View {
    let caption: String
    var title: String
    var hasLeftDivider = true
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 8) {

                Text(caption.uppercased())
                    .font(.footnote)
                    .foregroundColor(.gray)

                Text(title.capitalized)

            }
            .frame(width: 100)
            if hasLeftDivider {
                Divider().frame(height: 60)
            }
        }
    }
}


struct FullScreenImageView_Previews: PreviewProvider {
    static var previews: some View {
        let image = UnSplashImage(id: "YQ4vknTXgfI", createdAt: "2023-03-24T17:27:15Z", updatedAt: "2023-03-27T10:40:09Z", promotedAt: nil, width: 3024, height: 4032, color: "#73a6d9", blurHash: "LxDK13xuNGofyZbboLa}tSadoffR", description: nil, altDescription: "a sign that is on top of a hill", urls: Starter_Project.Urls(raw: "https://images.unsplash.com/photo-1679678691006-0ad24fecb769?ixid=Mnw0MjczNTd8MXwxfGFsbHwxfHx8fHx8Mnx8MTY3OTkzNjYxMw&ixlib=rb-4.0.3", full: "https://images.unsplash.com/photo-1679678691006-0ad24fecb769?crop=entropy&cs=srgb&fm=jpg&ixid=Mnw0MjczNTd8MXwxfGFsbHwxfHx8fHx8Mnx8MTY3OTkzNjYxMw&ixlib=rb-4.0.3&q=85", regular: "https://images.unsplash.com/photo-1679678691006-0ad24fecb769?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MjczNTd8MXwxfGFsbHwxfHx8fHx8Mnx8MTY3OTkzNjYxMw&ixlib=rb-4.0.3&q=80&w=1080", small: "https://images.unsplash.com/photo-1679678691006-0ad24fecb769?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MjczNTd8MXwxfGFsbHwxfHx8fHx8Mnx8MTY3OTkzNjYxMw&ixlib=rb-4.0.3&q=80&w=400", thumb: "https://images.unsplash.com/photo-1679678691006-0ad24fecb769?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MjczNTd8MXwxfGFsbHwxfHx8fHx8Mnx8MTY3OTkzNjYxMw&ixlib=rb-4.0.3&q=80&w=200", smallS3: "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1679678691006-0ad24fecb769"), links: Starter_Project.UnSplashImageLinks(linksSelf: "https://api.unsplash.com/photos/YQ4vknTXgfI", html: "https://unsplash.com/photos/YQ4vknTXgfI", download: "https://unsplash.com/photos/YQ4vknTXgfI/download?ixid=Mnw0MjczNTd8MXwxfGFsbHwxfHx8fHx8Mnx8MTY3OTkzNjYxMw", downloadLocation: "https://api.unsplash.com/photos/YQ4vknTXgfI/download?ixid=Mnw0MjczNTd8MXwxfGFsbHwxfHx8fHx8Mnx8MTY3OTkzNjYxMw"), likes: 6, user: Starter_Project.User(id: "8Ae1yJe8OoA", updatedAt: "2023-03-27T15:27:24Z", username: "boxedwater", name: "Boxed Water Is Better", firstName: "Boxed Water Is Better", lastName: nil, twitterUsername: Optional("boxedwater"), portfolioURL: Optional("https://boxedwaterisbetter.com/?utm_source=brand-referral&utm_medium=unsplash&utm_campaign=stigmatize-plastic"), bio: Optional("👋  We\'re a sustainable alternative to plastic water bottles.\r\n🚫  Ditch plastic bottles  🌲  Plant trees with us using #BetterPlanet Boxed Water is 100% pure, 92% sustainably packaged & 100%  recyclable. Let’s build a #BetterPlanet together. "), location: Optional("Holland, MI"), links: Starter_Project.UserLinks(linksSelf: "https://api.unsplash.com/users/boxedwater", html: "https://unsplash.com/@boxedwater", photos: "https://api.unsplash.com/users/boxedwater/photos", likes: "https://api.unsplash.com/users/boxedwater/likes", portfolio: "https://api.unsplash.com/users/boxedwater/portfolio", following: "https://api.unsplash.com/users/boxedwater/following", followers: "https://api.unsplash.com/users/boxedwater/followers"), profileImage: Starter_Project.ProfileImage(small: "https://images.unsplash.com/profile-1557251674406-effb9d313841?ixlib=rb-4.0.3&crop=faces&fit=crop&w=32&h=32", medium: "https://images.unsplash.com/profile-1557251674406-effb9d313841?ixlib=rb-4.0.3&crop=faces&fit=crop&w=64&h=64", large: "https://images.unsplash.com/profile-1557251674406-effb9d313841?ixlib=rb-4.0.3&crop=faces&fit=crop&w=128&h=128"), instagramUsername: Optional("boxedwater"), totalCollections: 2, totalLikes: 3, totalPhotos: 241, acceptedTos: true, forHire: false))
        
        FullScreenImageView(unSplashImage: image)
    }
}


