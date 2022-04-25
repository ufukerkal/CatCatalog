//
//  ApiError.swift
//  CatCatalog
//
//

import Foundation
import Alamofire

enum ApiError : Error {
  case yanlisUrl
  case url(AFError?)
}




