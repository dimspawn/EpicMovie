//
//  GetFavoriteRepository.swift
//  Favorite
//
//  Created by Dimas Wicaksono on 25/01/22.
//

import Combine
import Core
import MovieDomain

public struct GetFavoriteRepository<
    FavoriteLocalDataSource: LocalDataSource,
    Tranformer: Mapper>: Repository
where
FavoriteLocalDataSource.Response == FavoriteEntity,
Tranformer.Response == Any,
Tranformer.Entity == [FavoriteEntity],
Tranformer.Domain == [FavoriteModel]{
    public typealias Request = Any
    public typealias Response = [FavoriteModel]
    
    private let _localDataSource: FavoriteLocalDataSource
    private let _mapper: Tranformer
    
    public init(
        localDataSource: FavoriteLocalDataSource,
        mapper: Tranformer
    ){
        _localDataSource = localDataSource
        _mapper = mapper
    }
    
    public func execute(request: Any?) -> AnyPublisher<[FavoriteModel], Error> {
        return _localDataSource.list(request: nil)
            .map { _mapper.tranformEntityToDomain(entity: $0)}
            .eraseToAnyPublisher()
    }
}
