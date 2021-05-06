//
//  PosterView.swift
//  Movie List
//
//  Created by Md Shawkath Hossain on 6/5/21.
//

import SwiftUI

struct PosterView: View {
    @ObservedObject var posterLoader: PosterLoader
    @State var image: UIImage = UIImage()

    init(withURL url:String) {
        posterLoader = PosterLoader(urlString:url)
    }

    var body: some View {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:120, height:150)
                .onReceive(posterLoader.didChange) { data in
                    self.image = UIImage(data: data) ?? UIImage()
                }
    }
}
