//
//  DataState.swift
//  FinancialDemo
//
//  Created by Поляков Станислав Денисович on 20.08.2024.
//

import Foundation

enum UiState<Success> {
    case loading
    case success(Success)
    case failure(Error)
    
    func onLoading(block: () -> Void) -> UiState {
        switch self {
            case .loading:
                block()
                fallthrough
            default: return self
        }
    }
    
    func onSuccess(block: (Success) -> Void) -> UiState {
        switch self {
            case .success(let data):
                block(data)
                fallthrough
            default: return self
        }
    }
    
    func onFailure(block: (Error) -> Void) -> UiState {
        switch self {
            case .failure(let error):
                block(error)
                fallthrough
            default: return self
        }
    }
}
