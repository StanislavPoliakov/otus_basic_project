//
//  ParserError.swift
//  FinancialDemo
//
//  Created by Поляков Станислав Денисович on 20.08.2024.
//

import Foundation

enum ParserError : Error {
    case parsingError(cause: String)
}
