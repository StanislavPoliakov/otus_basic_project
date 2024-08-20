//
//  NetworkError.swift
//  FinancialDemo
//
//  Created by Поляков Станислав Денисович on 20.08.2024.
//

import Foundation

enum NetworkError : Error {
    case requestProcessingError
    case networkError
    case networkStatusError(code: Int)
    case emptyData
    case invalidUrl
    case invalidBodySerialization
    case requestError
    case invalidResult
}
