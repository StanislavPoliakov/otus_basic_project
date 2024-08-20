//
//  FinancialDemoLibraryApi.swift
//  FinancialDemo
//
//  Created by Поляков Станислав Денисович on 20.08.2024.
//

import Foundation

struct FinancialDemoLibraryApi {
    static let shared = FinancialDemoLibraryApi()
    private init() {}
    
    private let networkService: NetworkService = NetworkServiceImpl()
    
    private var currencyModelConverter: CurrencyModelConverter {
        get {
            CurrencyModelConverter()
        }
    }
    
    private var networkRepository: INetworkRepository {
        get {
            INetworkRepositoryImpl(service: networkService, converter: currencyModelConverter)
        }
    }
    
    private var currencyInteractor: CurrencyInteractor {
        get {
            CurrencyInteractorImpl(repository: networkRepository)
        }
    }
    
    lazy var currencyViewModel: CurrencyViewModel = CurrencyViewModel(interactor: currencyInteractor)
}
