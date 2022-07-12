//
//  NewsResponse.swift
//  NewsApp
//
//  Created by Didar Bakhitzhanov on 12.07.2022.
//

import Foundation

struct NewsResponse: Codable {
    let articles: [Article]
}

struct Article: Codable, Identifiable {
    var id = UUID()
    let author: String?
    let url: String?
    let source: String?
    let title: String?
    let description: String?
    let image: String?
    let date: Date?
}

extension Article {
    static var dummyData: Article {
        .init(author: "Guardian staff reporter", url: "https://amp.theguardian.com/world/2022/jul/12/iran-drones-russia-uav-combat-ukraine", source: "The Guardian", title: "Iran to supply Russia with hundreds of combat drones, US says - The Guardian", description: "White House says it shows how Russia’s weaponry has been depleted by its relentless bombardment of eastern Ukraine", image: "https://i.guim.co.uk/img/media/13dd9d75812aa5a49ee00332df10211d9da546c7/0_34_1500_900/master/1500.jpg?width=1200&height=630&quality=85&auto=format&fit=crop&overlay-align=bottom%2Cleft&overlay-width=100p&overlay-base64=L2ltZy9zdGF0aWMvb3ZlcmxheXMvdGctZGVmYXVsdC5wbmc&enable=upscale&s=bb479877c8f55e15b5f7782b8cad3a03", date: Date())
    }
}
