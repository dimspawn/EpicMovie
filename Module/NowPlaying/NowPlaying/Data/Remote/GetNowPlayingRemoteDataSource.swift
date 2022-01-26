//
//  GetNowPlayingRemoteDataSource.swift
//  NowPlaying
//
//  Created by Dimas Wicaksono on 24/01/22.
//

import Core
import Combine
import Alamofire
import Common

public struct GetNowPlayingRemoteDataSource: DataSource {
    public typealias Request = Any
    public typealias Response = [NowPlayingResponse]
    private let _enpoint: String
    public init(endpoint: String){
        _enpoint = endpoint
    }
    
    public func execute(request: Any?) -> AnyPublisher<[NowPlayingResponse], Error> {
        return Future<[NowPlayingResponse], Error> { completion in
            if let url = URL(string: _enpoint) {
                let parameters: Parameters = [
                    "api_key": API.apiKey
                ]
                AF.request(url, parameters: parameters)
                    .validate()
                    .responseDecodable(of: NowPlayingResponses.self) { response in
                        switch response.result {
                        case .success(let value):
                            completion(.success(value.movies))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
}
