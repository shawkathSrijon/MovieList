//
//  MovieListModel.swift
//  Movie List
//
//  Created by Md Shawkath Hossain on 6/5/21.
//

import Foundation

// MARK: - MovieListModel
struct MovieListModel: Codable {
    let results: [Movie]?
}

// MARK: - Result
struct Movie: Codable, Identifiable {
    let id: Int
    let originalTitle, overview: String?
    let posterPath: String?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
            case id
            case originalTitle = "original_title"
            case overview
            case posterPath = "poster_path"
            case title
    }
}

