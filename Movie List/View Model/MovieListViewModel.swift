//
//  MovieListViewModel.swift
//  Movie List
//
//  Created by Md Shawkath Hossain on 6/5/21.
//

import Foundation
import SwiftUI

class MovieListViewModel: ObservableObject {
    @Published var movieList: MovieListModel?
    @Published var search: String = "marvel" {
        didSet {
            loadMovieList()
        }
    }
    
    //MARK:- Network Call(s)
    
    func loadMovieList() {
        //Validating URL
        guard let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=da91beb5a7483f32d3491a2f5283389d&query=\(search)") else {
            print("Invalid URL")
            return
        }
        
        //Creating Network Request
        let networkRequest = URLRequest(url: url)
        
        //Network Task with created networkRequest above.
        URLSession.shared.dataTask(with: networkRequest) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(MovieListModel.self, from: data) {
                    DispatchQueue.main.async {
                        self.movieList = response
                    }
                    return
                }
            }
            print(error?.localizedDescription ?? "Error fetching movie data")
        }.resume()
    }
}
