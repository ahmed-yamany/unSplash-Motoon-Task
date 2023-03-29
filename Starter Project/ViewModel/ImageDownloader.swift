//
//  ImageDownloader.swift
//  Starter Project
//
//  Created by Ahmed Yamany on 27/03/2023.
//

import UIKit
import Alamofire
import Combine

struct ImageDownloader {
    
    // Takes a URL string and returns a publisher that emits UIImage or NetworkError.
    static func download(url: String) -> AnyPublisher<UIImage, NetworkError> {
        
        // If the URL is invalid, return a publisher that emits the NetworkError.invalidURL error.
        guard let url = URL(string: url) else {
            return Fail(error: NetworkError.invalidURL)
                .eraseToAnyPublisher()
        }
        
        return AF.request(url, method: .get)
            .validate()
        
            .publishDecodable(type: Data.self) // Decode the response data to Data type.
        
            .tryMap { response -> Data in
                
                // Throw an error if the response status code is not 200 OK.
                guard let httpURLResponse = response.response,
                      httpURLResponse.statusCode == 200 else {
                    throw NetworkError.statusCode
                }
                
                // Return the response data if it exists.
                guard let data = response.data else {
                    throw NetworkError.decoding
                }
                
                return data
            }
        
            .tryMap { data in
                
                // Decode the Data to UIImage type.
                guard let image = UIImage(data: data) else {
                    throw NetworkError.invalidImage
                }
                
                return image
                
            }
            .mapError { NetworkError.map($0) }
            .eraseToAnyPublisher()
        
    }
}
