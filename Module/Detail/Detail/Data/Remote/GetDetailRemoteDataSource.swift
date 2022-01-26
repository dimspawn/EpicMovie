//
//  GetDetailRemoteDataSource.swift
//  Detail
//
//  Created by Dimas Wicaksono on 25/01/22.
//

import Core
import Common
import Combine
import Alamofire

public struct GetDetailRemoteDataSource: DataSource {
    public typealias Request = Int
    public typealias Response = DetailResponse
    private let _endpoint: String
    public init(endpoint: String) {
        _endpoint = endpoint
    }
    
    public func execute(request: Int?) -> AnyPublisher<DetailResponse, Error> {
        return Future<DetailResponse, Error> { completion in
            guard let id = request else { fatalError() }
            if let url = URL(string: _endpoint + "\(id)") {
                let parameters: Parameters = [
                    "api_key": API.apiKey
                ]
                AF.request(url, parameters: parameters)
                    .validate()
                    .responseDecodable(of: DetailResponse.self) { response in
                        switch response.result {
                        case .success(let value): completion(.success(value))
                        case .failure: completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
}
