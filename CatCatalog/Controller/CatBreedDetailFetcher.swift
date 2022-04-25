//
//  CatBreedDetailFetcher.swift
//  CatCatalog
//
//  Created by Hakkı Yiğit Yener on 20.04.2022.
//

import Foundation

class CatBreedFetcherDetail: ObservableObject {
    private let baseUrl:String = "https://api.thecatapi.com/v1/breeds?limit=25"
    
    let service=CatBreedService()

    @Published var cat: CatBreed?
    @Published var isLoading: Bool=false
    @Published var error: String?=nil
    
    

}
