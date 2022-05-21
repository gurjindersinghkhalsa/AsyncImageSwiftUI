//
//  ContentView.swift
//  AsyncImageS
//
//  Created by Gurjinder Singh on 21/05/22.
//

import SwiftUI



struct ContentView: View {
    private let imageUrl = "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
    var body: some View {
        //MARK: - 1 Basic
//        AsyncImage(url: URL(string: imageUrl))
        
        //MARK: - Scale
//        AsyncImage(url: URL(string: imageUrl), scale: 2.0)
        
        // MARK: - Placeholder
        
//        AsyncImage(url: URL(string: imageUrl), scale: 2.0) { image in
//            image.imageModifier()
//        } placeholder: {
//            Image(systemName: "photo.circle.fill").imagePlaceholderModifier()
//        }.padding(10)
        
        // MARK: - Phase
        
        AsyncImage(url: URL(string: imageUrl)) { phase in
            switch phase {
            case .success(let image):
                image.imageModifier()
            case .empty:
                Image(systemName: "photo.circle.fill").imagePlaceholderModifier()
            case .failure(let msg):
                Image(systemName: "ant.circle.fill").imagePlaceholderModifier()
            @unknown default:
                ProgressView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Image {
    func imageModifier() -> some View {
        self.resizable()
            .scaledToFit()
    }
    func imagePlaceholderModifier() -> some View {
        self.imageModifier()
            .frame(maxWidth: 120)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}
