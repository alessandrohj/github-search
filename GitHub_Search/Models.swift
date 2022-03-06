//
//  Models.swift
//  GitHub_Search
//
//  Created by Alessandro H de Jesus & Gyuyoung Lee on 2021-11-23.
//

/*
 https://api.github.com/search/users?q=ios
 {
 "total_count": 38573,
 "incomplete_results": false,
 "items": [
 {
 "login": "iOS",
 "id": 312784,
 "node_id": "MDQ6VXNlcjMxMjc4NA==",
 "avatar_url": "https://avatars.githubusercontent.com/u/312784?v=4",
 "gravatar_id": "",
 "url": "https://api.github.com/users/iOS",
 "html_url": "https://github.com/iOS",
 "followers_url": "https://api.github.com/users/iOS/followers",
 "following_url": "https://api.github.com/users/iOS/following{/other_user}",
 "gists_url": "https://api.github.com/users/iOS/gists{/gist_id}",
 "starred_url": "https://api.github.com/users/iOS/starred{/owner}{/repo}",
 "subscriptions_url": "https://api.github.com/users/iOS/subscriptions",
 "organizations_url": "https://api.github.com/users/iOS/orgs",
 "repos_url": "https://api.github.com/users/iOS/repos",
 "events_url": "https://api.github.com/users/iOS/events{/privacy}",
 "received_events_url": "https://api.github.com/users/iOS/received_events",
 "type": "User",
 "site_admin": false,
 "score": 1.0
 },
 ]
 }
 
 https://api.github.com/users/JaviSoto
 {
 "login": "JaviSoto",
 "id": 666807,
 "node_id": "MDQ6VXNlcjY2NjgwNw==",
 "avatar_url": "https://avatars.githubusercontent.com/u/666807?v=4",
 "gravatar_id": "",
 "url": "https://api.github.com/users/JaviSoto",
 "html_url": "https://github.com/JaviSoto",
 "followers_url": "https://api.github.com/users/JaviSoto/followers",
 "following_url": "https://api.github.com/users/JaviSoto/following{/other_user}",
 "gists_url": "https://api.github.com/users/JaviSoto/gists{/gist_id}",
 "starred_url": "https://api.github.com/users/JaviSoto/starred{/owner}{/repo}",
 "subscriptions_url": "https://api.github.com/users/JaviSoto/subscriptions",
 "organizations_url": "https://api.github.com/users/JaviSoto/orgs",
 "repos_url": "https://api.github.com/users/JaviSoto/repos",
 "events_url": "https://api.github.com/users/JaviSoto/events{/privacy}",
 "received_events_url": "https://api.github.com/users/JaviSoto/received_events",
 "type": "User",
 "site_admin": false,
 "name": "Javier Soto",
 "company": "Twitch",
 "blog": "https://www.twitter.com/Javi",
 "location": "San Francisco",
 "email": null,
 "hireable": null,
 "bio": null,
 "twitter_username": null,
 "public_repos": 100,
 "public_gists": 30,
 "followers": 1037,
 "following": 94,
 "created_at": "2011-03-13T10:47:10Z",
 "updated_at": "2021-11-23T23:13:00Z"
 }
 */

import Foundation

// MARK: ResponseData. Codable protocol is used to perform encoding and decoding
class ResponseData: Codable {
    // MARK: Properties
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Item]
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

// MARK: Item
class Item: Codable {
    // MARK: Properties
    let login: String
    let id: Int
    let nodeID: String
    let avatarURL: String
    let gravatarID: String
    let url, htmlURL, followersURL: String
    let followingURL, gistsURL, starredURL: String
    let subscriptionsURL, organizationsURL, reposURL: String
    let eventsURL: String
    let receivedEventsURL: String
    let type: String
    let siteAdmin: Bool
    let score: Int
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
        case score
    }
}

class UserDetails: Codable {
    // MARK: Properties
    let login: String
    let id: Int
    let nodeID: String
    let avatarURL: String
    let gravatarID: String
    let url, htmlURL, followersURL: String
    let followingURL, gistsURL, starredURL: String
    let subscriptionsURL, organizationsURL, reposURL: String
    let eventsURL: String
    let receivedEventsURL: String
    let type: String
    let siteAdmin: Bool
    let name, company: String?
    let blog: String
    let hireable: Bool?
    let location, email, bio, twitterUsername: String?
    let publicRepos, publicGists, followers, following: Int
    let createdAt, updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
        case name, company, blog, location, email, hireable, bio
        case twitterUsername = "twitter_username"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers, following
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
