//
//  NewsModel.swift
//  newsApp
//
//  Created by kortobaa on 11/11/2022.
//

import Foundation

// MARK: - Pokedex
struct NewsModel: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title: String?
    let articleDescription: String?
    let image: String?
    let date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}

extension Article {
    static var dummyData: Article {
        .init(
            author: "John Wagner",
            url: "https://www.washingtonpost.com/politics/2022/11/11/elections-news-house-senate-races/",
            source: "The Washington Post",
            title: "Midterm elections news: Tracking undecided House, Senate races - The Washington Post",
            articleDescription: "Republicans remain confident they will narrowly win the House, but many uncalled races, particularly in Western states, are breaking in favor of Democrats.",
            image: "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/V3Y4RQBLQFGDPIM753M3SAAIG4.JPG&w=1440",
            date: Date()
        )
    }
}
