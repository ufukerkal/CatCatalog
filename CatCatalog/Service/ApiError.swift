//
//  ApiError.swift
//  CatCatalog
//
//  Created by Hakkı Yiğit Yener on 15.04.2022.
//

import Foundation
import Alamofire

enum ApiError : Error {
  case yanlisUrl
  case url(AFError?)
}




