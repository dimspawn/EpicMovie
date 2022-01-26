//
//  NowPlayingPresenter.swift
//  NowPlaying
//
//  Created by Dimas Wicaksono on 24/01/22.
//

import Core
import Combine
import SwiftUI

public class NowPlayingPresenter<
    Request,
    Response,
    GetNowPlayingUseCase: UseCase>: ObservableObject
where
GetNowPlayingUseCase.Request == Request,
GetNowPlayingUseCase.Response == [Response] {
    private var cancellables: Set<AnyCancellable> = []
    private let _getNowPlayingUseCase: GetNowPlayingUseCase
    
    @Published public var list: [Response] = []
    @Published public var errorMessage: String = ""
    @Published public var isLoading: Bool = false
    @Published public var isError: Bool = false
    
    public init(getNowPlayingUseCase: GetNowPlayingUseCase) {
        _getNowPlayingUseCase = getNowPlayingUseCase
    }
    
    public func getList(request: Request?) {
        isLoading = true
        _getNowPlayingUseCase.execute(request: request)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.isError = true
                    self.isLoading = false
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: { list in
                self.list = list
            }).store(in: &cancellables)
    }
}
