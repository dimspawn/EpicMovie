//
//  IsFavoriteRepository.swift
//  Favorite
//
//  Created by Dimas Wicaksono on 25/01/22.
//

import Combine
import Core

public struct IsFavoriteRepository<
    FavoriteLocalDataSource: LocalDataSource>: Repository
where
FavoriteLocalDataSource.Response == FavoriteEntity {
    public typealias Request = Int
    public typealias Response = Bool
    
    private let _localDataSource: FavoriteLocalDataSource
    
    public init(
        localDataSource: FavoriteLocalDataSource
    ){
        _localDataSource = localDataSource
    }
    
    public func execute(request: Int?) -> AnyPublisher<Bool, Error> {
        guard let id = request else { fatalError() }
        return _localDataSource.isExist(id: id).eraseToAnyPublisher()
    }
}
