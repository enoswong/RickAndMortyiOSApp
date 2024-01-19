//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by ENOS on 17/1/2024.
//

import Foundation

/// Object that represents a singlet API call
final class RMRequest{
    private struct Constants{
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    let endpoint: RMEndpoint
    
    let pathComponents: Set<String>
    
    let queryParameters:[URLQueryItem]
    
    private var urlString: String{
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if(!pathComponents.isEmpty)
        {
            string += "/"
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if(!queryParameters.isEmpty)
        {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    public var url: URL?{
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    public init(endpoint: RMEndpoint, pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
