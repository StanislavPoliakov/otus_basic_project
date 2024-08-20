//
//  CurrencyInteractor.swift
//  FinancialDemo
//
//  Created by Поляков Станислав Денисович on 20.08.2024.
//

import Foundation

protocol CurrencyInteractor {
    func getCurrencies() async throws -> Set<CurrencyModel>
}

class CurrencyInteractorImpl : CurrencyInteractor {
    private let repository: INetworkRepository
    
    init(repository: INetworkRepository) {
        self.repository = repository
    }
    
    func getCurrencies() async throws -> Set<CurrencyModel> {
        return try await repository.getCurrencies()
    }
}
