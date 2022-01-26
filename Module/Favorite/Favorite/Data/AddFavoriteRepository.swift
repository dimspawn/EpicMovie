//
//  AddFavoriteRepository.swift
//  Favorite
//
//  Created by Dimas Wicaksono on 25/01/22.
//

import Combine
import Core
import MovieDomain

public struct AddFavoriteRepository<
    FavoriteLocalDataSource: LocalDataSource,
    Transformer: Mapper>: Repository
where
FavoriteLocalDataSource.Response == FavoriteEntity,
Transformer.Response == Any,
Transformer.Entity == FavoriteEntity,
Transformer.Domain == DetailModel {
    public typealias Request = DetailModel
    public typealias Response = Bool
    
    private let _localDataSource: FavoriteLocalDataSource
    private let _mapper: Transformer
    
    public init(
        localDataSource: FavoriteLocalDataSource,
        mapper: Transformer
    ){
        _localDataSource = localDataSource
        _mapper = mapper
    }
    
    public func execute(request: DetailModel?) -> AnyPublisher<Bool, Error> {
        guard let detail = request else { fatalError() }
        let favModel = _mapper.tranformDomainToEntity(domain: detail)
        var favs: [FavoriteEntity] = []
        favs.append(favModel)
        return _localDataSource.add(entities: favs).eraseToAnyPublisher()
    }
}
