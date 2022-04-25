//
//  ContentView.swift
//  CatCatalog
//
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            CatBreedList()
                .tabItem { Image(systemName: "house")
                    Text("Kediler")}.tag(1)
            CatBreedFavoriteList()
                .tabItem { Image(systemName: "star")
                    Text("Favoriler")}.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
    }
}
