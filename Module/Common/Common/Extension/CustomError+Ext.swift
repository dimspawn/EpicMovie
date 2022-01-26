//
//  CustomError+Ext.swift
//  Common
//
//  Created by Dimas Wicaksono on 24/01/22.
//

import Foundation

public enum URLError: LocalizedError {
    
    case invalidResponse
    case addressUnreachable(URL)
    
    public var errorDescription: String? {
        switch self {
        case .invalidResponse: return "Internal Server Error"
        case .addressUnreachable(let url): return "\(url.absoluteString) in unreachable."
        }
    }
}

public enum DatabaseError: LocalizedError {
    
    case invalidInstance
    case requestFailed
    
    public var errorDescription: String? {
        switch self {
        case .invalidInstance: return "Database can't instance."
        case .requestFailed: return "Request Failed."
        }
    }
}
