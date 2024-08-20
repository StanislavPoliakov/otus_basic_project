//
//  INetworkRepository.swift
//  FinancialDemo
//
//  Created by Поляков Станислав Денисович on 20.08.2024.
//

import Foundation

protocol INetworkRepository {
    func getCurrencies() async throws -> Set<CurrencyModel>
    func getPoints(currencyCode: String) async throws -> [Double]
    func getChart(points: [Double]) async throws -> Data
}
