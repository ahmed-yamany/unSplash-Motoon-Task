//
//  APIRequest.swift
//  Starter Project
//
//  Created by Ahmed Yamany on 27/03/2023.
//

import Foundation
import Alamofire
import Combine
import UIKit


// Get the current language code for localization, defaulting to "en"
var languageCode: String {
    Locale.current.language.languageCode?.identifier ?? "en"
}

// Define a protocol for an API request
protocol APIRequest: AnyObject {
    
    // Associated type for the expected response type
    associatedtype Response where Response: Codable
    
    // Host and endpoint for the API request
    var host: String { get }
    var endpoint: String { get set }
    var requestMethod: HTTPMethod { get }
    
    // Optional parameters for the API request
    var parameters: Parameters? { get set }
    
}

// Default implementations for the APIRequest protocol
extension APIRequest {
    var host: String { "api.unsplash.com" }
    
}

extension APIRequest{
    // Computed property that returns the full URL of the API request
    private var url: String{ "https://\(host)/\(endpoint)" }
}

// An extension for APIRequest that specifies a Codable Response type
extension APIRequest where Response: Codable {
    
    // A function that sends a request using the Alamofire library and returns a DataResponse object as a publisher
    func request() -> AnyPublisher<DataResponse<Response, AFError>, Never> {
        // Send a request using Alamofire
        return AF.request(url, method: requestMethod,
                          parameters: parameters, encoding: URLEncoding.queryString)
        
            // Validate the response
            .validate()
        
            // Decode the response as the specified Response type
            .publishDecodable(type: Response.self)
        
            // Receive the result on the main thread
            .receive(on: DispatchQueue.main)
        
            // Erase the type of the publisher to AnyPublisher<DataResponse<Response, NetworkError>, Never>
            .eraseToAnyPublisher()
    }
    
}


