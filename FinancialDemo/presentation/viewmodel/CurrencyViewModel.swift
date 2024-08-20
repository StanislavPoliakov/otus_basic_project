//
//  CurrencyViewModel.swift
//  FinancialDemo
//
//  Created by Поляков Станислав Денисович on 20.08.2024.
//

import Foundation
import Observation

class CurrencyViewModel : ObservableObject {
    private let interactor: CurrencyInteractor
    
    init(interactor: CurrencyInteractor) {
        self.interactor = interactor
    }
    
    @Published var state: UiState<[CurrencyModel]> = .loading
    
    private var currencySelected: CurrencyModel? = nil
    
    @MainActor
    func load() {
        state = .loading
        Task {
            do {
                let response = try await interactor.getCurrencies()
                state = .success(response.sorted(by: { $0.title < $1.title }))
            } catch {
                if let networkError = error as? NetworkError {
                    print(networkError.self)
                }
                
                if case ParserError.parsingError(let cause) = error {
                    print("PARSER ERROR: \(cause)")
                }
                state = .failure(error)
            }
        }
    }
    
    func selectCurrency(_ currency: CurrencyModel) { currencySelected = currency }
    func onCurrencySubmitted() {
        print(currencySelected?.title)
    }
}
