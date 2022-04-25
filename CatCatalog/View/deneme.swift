//
//  deneme.swift
//  CatCatalog
//
//  Created by Hakkı Yiğit Yener on 16.04.2022.
//

import SwiftUI

struct deneme: View {
    let breed: CatBreed
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct deneme_Previews: PreviewProvider {
    static var previews: some View {
        deneme(breed: CatBreed(id: "abys", name: "Abyssinian", temperament: "Active, Energetic, Independent, Intelligent", description: "he Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.", origin: "Egypt", lifeSpan: "14 - 15", image: CatBreedImage(id: "i", width: 100, height:100,url:"https://cdn2.thecatapi.com/images/unX21IBVB.jpg")))
    }
}
