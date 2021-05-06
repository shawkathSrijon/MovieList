//
//  MovieListView.swift
//  Movie List
//
//  Created by Md Shawkath Hossain on 6/5/21.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject private var movieListViewModel = MovieListViewModel()
    
    var body: some View {
        NavigationView {
            movieListBody()
        }
    }
    
    //MARK:- Drawing Function(s)
    
    private func movieListBody() -> some View {
        VStack {
            searchField()
            Spacer()
            if movieListViewModel.search != "" {
                movieList()
            } else {
                emptyListMessage()
            }
        }
        .navigationTitle("Movie List")
        .onAppear {
            movieListViewModel.loadMovieList()
        }
    }
    private func searchField() -> some View {
        TextField("Search", text: $movieListViewModel.search)
            .frame(width: UIScreen.main.bounds.width * 0.80, height: 40)
            .padding(.horizontal)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.black.opacity(0.3), lineWidth: 1)
            )
    }
    private func movieList() -> some View {
        List(movieListViewModel.movieList?.results ?? []) { movie in
            HStack {
                PosterView(withURL: "https://image.tmdb.org/t/p/w500/\(movie.posterPath ?? "")")
                VStack(alignment: .leading, spacing: 10) {
                    Text(movie.title ?? "Unknown")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(movie.overview ?? "Overview not available")
                }
            }
        }
    }
    private func emptyListMessage() -> some View {
        Text("No movie to show")
            .foregroundColor(.gray)
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
