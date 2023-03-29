//
//  NetworkError.swift
//  Starter Project
//
//  Created by Ahmed Yamany on 27/03/2023.
//

import Foundation
import Alamofire



enum NetworkError: Error {
  case statusCode
  case decoding
  case invalidImage
  case invalidURL
  case other(Error)
  
  static func map(_ error: Error) -> NetworkError {
    return (error as? NetworkError) ?? .other(error)
  }
}
