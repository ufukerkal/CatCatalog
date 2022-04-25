//
//  CatBreedService.swift
//  CatCatalog
//
//

import Foundation
import Alamofire
import UIKit


final class CatBreedMananger<T:Codable>{
    static func fetch(
           from urlString: String,
           completion: @escaping (Result<T, AFError>) -> Void
       )
       {
        AF.request(urlString,
                   method: .get,headers: ["x-api-key" : API.key]).responseDecodable(of: T.self) { response in
            completion(response.result)
        }
    }
}


