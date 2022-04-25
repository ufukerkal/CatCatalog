//
//  CatBreedFetcher.swift
//  CatCatalog
//
//  Created by Hakkı Yiğit Yener on 14.04.2022.
//

import Foundation
import Alamofire
	
class CatBreedFetcher: ObservableObject {
    

    @Published var cat = [CatBreed]()
    @Published var isLoading: Bool=false
    @Published var error: String?=nil
    @Published var imageUrl:String?=nil

    
    init()
    {
      fetcCatsBreed()
    }
    
    
    func fetcCatsBreed(){
        isLoading=true
        error=nil
        DispatchQueue.main.async {
            CatBreedMananger<[CatBreed]>.fetch(from:ConstantsApiUrl.baseURL) { [unowned self] result in
                self.isLoading=false
                switch result{
                    case .success(let response):
                    self.cat = response
                    case .failure(let error):
                    self.error=error.localizedDescription
               }
            }
        }
    }
    
    func fetcAllCatBreddSearch(searchText:String){
        cat.removeAll()
        isLoading=true
        error=nil
        DispatchQueue.main.async {
            CatBreedMananger<[CatBreed]>.fetch(from:"\(ConstantsApiUrl.baseSearchUrl)\(searchText)") { [unowned self] result in
                self.isLoading=false
                switch result{
                    case .success(let response):
                    self.cat = response
                    case .failure(let error):
                    self.error=error.localizedDescription
               }
            }
      }
   }
}
    
    

