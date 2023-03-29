//
//  AlbumListViewModel.swift
//  Starter Project
//
//  Created by Ahmed Yamany on 27/03/2023.
//

import UIKit
import Alamofire


class AlbumListViewModel: APIRequest {    
    typealias Response = Images
    
    var endpoint: String = "photos"
    
    var requestMethod: Alamofire.HTTPMethod = .get
    
    var parameters: Alamofire.Parameters? = [
        "page": "1",
        "per_page": "30",
        "client_id": "Ahj-66mbyiRNL-GhTltHoIgGfkznNgv7SALhCOTLMaM"
    ]
    
    
}

