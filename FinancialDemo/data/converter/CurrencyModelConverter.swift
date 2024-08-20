//
//  CurrencyModelConverter.swift
//  FinancialDemo
//
//  Created by Поляков Станислав Денисович on 20.08.2024.
//

import Foundation

class CurrencyModelConverter : OneWayConverter {
    typealias Response = CurrencyResponse
    typealias Model = CurrencyModel
    
    func convert(_ response: Response) throws -> Model {
        guard let title = response.title else {
            throw ParserError.parsingError(cause: "response title is abscent!")
        }
        
        guard let code = response.code else {
            throw ParserError.parsingError(cause: "currency code is abscent!")
        }
        
        return Model(title: title, code: code)
    }
}
