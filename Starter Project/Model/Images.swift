//
//  Images.swift
//  Starter Project
//
//  Created by Ahmed Yamany on 27/03/2023.
//

import Foundation

typealias Images = [UnSplashImage]


struct UnSplashImage: Codable {
    let id: String
     let createdAt, updatedAt: String
     let promotedAt: String?
     let width, height: Int
     let color, blurHash: String
     let description: String?
     let altDescription: String?
     let urls: Urls
     let links: UnSplashImageLinks
     let likes: Int
     let user: User
    
    enum CodingKeys: String, CodingKey {
         case id
         case createdAt = "created_at"
         case updatedAt = "updated_at"
         case promotedAt = "promoted_at"
         case width, height, color
         case blurHash = "blur_hash"
         case description
         case altDescription = "alt_description"
         case urls, links, likes
         case user
     }
}

// MARK: - WelcomeLinks
struct UnSplashImageLinks: Codable {
    let linksSelf, html, download, downloadLocation: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}

struct User: Codable {
    let id: String
    let updatedAt: String
    let username, name, firstName: String
    let lastName, twitterUsername: String?
    let portfolioURL: String?
    let bio, location: String?
    let links: UserLinks
    let profileImage: ProfileImage
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos: Int
    let acceptedTos, forHire: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case updatedAt = "updated_at"
        case username, name
        case firstName = "first_name"
        case lastName = "last_name"
        case twitterUsername = "twitter_username"
        case portfolioURL = "portfolio_url"
        case bio, location, links
        case profileImage = "profile_image"
        case instagramUsername = "instagram_username"
        case totalCollections = "total_collections"
        case totalLikes = "total_likes"
        case totalPhotos = "total_photos"
        case acceptedTos = "accepted_tos"
        case forHire = "for_hire"
    }
}

// MARK: - UserLinks
struct UserLinks: Codable {
    let linksSelf, html, photos, likes: String
    let portfolio, following, followers: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes, portfolio, following, followers
    }
}

// MARK: - ProfileImage
struct ProfileImage: Codable {
    let small, medium, large: String
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb, smallS3: String

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}
