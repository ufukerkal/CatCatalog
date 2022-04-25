//
//  CatBreed.swift
//  CatCatalog
//


import Foundation
import SwiftUI

struct CatBreed : Codable,Identifiable{
    let id: String?
    let name: String?
    let temperament: String?
    let description: String?
    let origin: String?
    let lifeSpan: String?
    let imageId: String?
    let image: CatBreedImage?
    
    enum CodingKeys: String, CodingKey
    {
        case id
        case name
        case temperament
        case description
        case origin
        case lifeSpan = "life_span"
        case imageId = "reference_image_id"
        case image
    }

    static func example1() -> CatBreed {
        return CatBreed(id: "abys",
                        name: "Abyssinian",
                        temperament: "Active, Energetic, Independent, Intelligent",
                        description: "he Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
                        origin: "Egypt",
                        lifeSpan: "14 - 15",
                        imageId: "0XYvRd7oD",
                        image: CatBreedImage(
                            id: "i",
                            width: 100,
                            height:100,
                            url:"https://cdn2.thecatapi.com/images/unX21IBVB.jpg"
                        )
        )
    }
   
}
