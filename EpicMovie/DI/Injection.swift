//
//  Injection.swift
//  EpicMovie
//
//  Created by Dimas Wicaksono on 24/01/22.
//

import RealmSwift
import Core
import MovieDomain
import NowPlaying
import Detail
import Favorite

final class Injection: NSObject {
    func provideNowPlaying<U: UseCase>() -> U where U.Request == Any, U.Response == [NowPlayingModel] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let local = NowPlayingLocalDataSource(realm: appDelegate.realm)
        let remote = GetNowPlayingRemoteDataSource(endpoint: Endpoints.Gets.movies.url)
        let mapper = NowPlayingTransformer()
        let repository = GetNowPlayingRepository(
            localDataSource: local,
            remoteDataSource: remote,
            mapper: mapper
        )
        return Interactor(repository: repository) as! U
    }
    
    func provideDetail<U: UseCase>() -> U where U.Request == Int, U.Response == DetailModel {
        let remote = GetDetailRemoteDataSource(endpoint: Endpoints.Gets.movieDetail.url)
        let mapper = DetailTranformer()
        let repository = GetDetailRepository(
            remoteDataSource: remote,
            mapper: mapper
        )
        return Interactor(repository: repository) as! U
    }
    
    func provideIsFavorite<U: UseCase>() -> U where U.Request == Int, U.Response == Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let local = FavoriteLocalDataSource(realm: appDelegate.realm)
        let repository = IsFavoriteRepository(localDataSource: local)
        return Interactor(repository: repository) as! U
    }
    
    func provideAddFavorite<U: UseCase>() -> U where U.Request == DetailModel, U.Response == Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let local = FavoriteLocalDataSource(realm: appDelegate.realm)
        let mapper = FavoriteTransformer()
        let repository = AddFavoriteRepository(
            localDataSource: local,
            mapper: mapper
        )
        return Interactor(repository: repository) as! U
    }
    
    func provideDeleteFavorite<U: UseCase>() -> U where U.Request == Int, U.Response == Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let local = FavoriteLocalDataSource(realm: appDelegate.realm)
        let repository = DeleteFavoriteRepository(localDataSource: local)
        return Interactor(repository: repository) as! U
    }
    
    func provideGetFavorite<U: UseCase>() -> U where U.Request == Any, U.Response == [FavoriteModel] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let local = FavoriteLocalDataSource(realm: appDelegate.realm)
        let mapper = FavoritesTransformer()
        let repository = GetFavoriteRepository(
            localDataSource: local,
            mapper: mapper
        )
        return Interactor(repository: repository) as! U
    }
}
