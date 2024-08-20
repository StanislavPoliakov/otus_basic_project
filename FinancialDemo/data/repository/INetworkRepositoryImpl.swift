//
//  INetworkRepository.swift
//  FinancialDemo
//
//  Created by Поляков Станислав Денисович on 20.08.2024.
//

import Foundation

class INetworkRepositoryImpl : INetworkRepository {
    private let service: NetworkService
    private let converter: CurrencyModelConverter
    
    init(service: NetworkService, converter: CurrencyModelConverter) {
        self.service = service
        self.converter = converter
    }
    
    func getCurrencies() async throws -> Set<CurrencyModel> {
        let responseList = try await service.getCurrencies()
        return try Set(converter.convertAll(responseList))
    }
    
    func getPoints(currencyCode: String) async throws -> [Double] {
        return try await service.getMarketData(for: currencyCode)
    }
    
    func getChart(points: [Double]) async throws -> Data {
        return try await service.getChart(values: points)
    }
}
