//
//  RMService.swift
//  RickAndMorty
//
//  Created by ENOS on 17/1/2024.
//

import Foundation

/// Primary API service object to get Rick and Morty data
final class RMService{
    /// Shared singleton instance
    static let shared = RMService()
    
    /// Privatized constuctor
    private init(){}
    
    /// Sebd Rick and Morty API Call
    /// - Parameters:
    ///     - request: Request Instance
    ///     - completion: Callback with data or error
    public func execute(_ request: RMRequest, completion: @escaping()->Void){
        
    }
}
