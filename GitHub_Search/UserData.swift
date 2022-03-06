//
//  UserData.swift
//  GitHub_Search
//
//  Created by Alessandro H de Jesus & Gyuyoung Lee on 2021-11-23.
//

import Foundation
import Alamofire

struct RequiredUserData {
    // MARK: Properties
    var avatarURL = ""
    var url = ""
    var htmlURL = ""
    var login = ""
    var score = 0
    var id = 0
}

class UserData: ObservableObject {
    // MARK: Property
    var users = [RequiredUserData]()
    // MARK: Method
    func clearUserData(){
        users.removeAll()
    }
}

class DetailsData : ObservableObject {
    // MARK: Properties
    @Published var name = ""
    @Published var location = ""
    @Published var company = ""
    @Published var followers = ""
    @Published var publicGists = ""
    @Published var publicRepos = ""
    @Published var lastUpdate = ""
    @Published var accountCreated = ""
    var url: String
    var htmlURL = ""
    var avatarURL = ""
    
    // MARK: Method
    func fetchJson(url: String){
        print(url)
        AF.request(url)
            .validate()
            .responseDecodable(of: UserDetails.self) {
                response in
                guard let jsonData = response.value
                else {
                    print("userData error: \(response.result)")
                    print("userData error: \(String(describing: response.response))")
                    return
                }
                self.name = jsonData.name ?? "Unknown"
                self.location = jsonData.location ?? "Unknown"
                self.company = jsonData.company?.split(separator:",").map{String($0)}.joined(separator:"\n") ?? "Unknown"
                self.followers = String(jsonData.followers)
                self.publicGists = String(jsonData.publicGists)
                self.publicRepos = String(jsonData.publicRepos)
                self.accountCreated = String(String(jsonData.createdAt).split(separator: "T")[0])
                self.lastUpdate = String(String(jsonData.updatedAt).split(separator: "T")[0])
            }
    }
    init(url: String, htmlURL: String, avatarURL: String){
        self.url = url
        self.htmlURL = htmlURL
        self.avatarURL = avatarURL
        fetchJson(url: url)
    }
}
