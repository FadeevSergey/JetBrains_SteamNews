//
//  DownloadJSON.swift
//  SteamNews
//
//  Created by Сергей Фадеев on 05.04.2020.
//  Copyright © 2020 Сергей Фадеев. All rights reserved.
//

import Foundation

var appID = [570, 730, 952060, 851850, 1014960]
var arrayOfNews: [Newsitems] = []

let countOfNews = 10
let maxLenghtOfNews = 100
let format = "json"
   
struct Newsitems: Codable {
   let gid : String
   let title: String
   let url: String
   let is_external_url: Bool
   let author: String
   let contents: String
   let date: Int
   let feedname: String
   let feed_type: Int
   let appid: Int
}

struct GameNews: Codable {
    struct Appnews: Codable{
        let appid: Int
        let newsitems: [Newsitems]
    }
    let appnews: Appnews
}

func getSortedNews(_ appID: [Int]) {
    let queue = DispatchQueue.global(qos: .userInitiated)
    
    queue.sync {
    let decoder = JSONDecoder()
    for id in appID {
            if let url = URL(string: "http://api.steampowered.com/ISteamNews/GetNewsForApp/v0002/?appid=\(id)&count=\(countOfNews)&maxlength=\(maxLenghtOfNews)&format=\(format)") {
                let data: Data? = try? Data(contentsOf: url)
                if let data = data {
                    let news = try! decoder.decode(GameNews.self, from: data)
                    arrayOfNews += news.appnews.newsitems
                }
            }
        }
    }
    
    sortNewsArray()
}

func sortNewsArray() {
    arrayOfNews = arrayOfNews.sorted(by: { (first, second) -> Bool in
        first.date < second.date
    })
}
